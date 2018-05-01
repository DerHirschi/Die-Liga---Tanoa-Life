#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Does something with vehicle purchasing.
*/
private["_action","_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle"];
_mode = SEL(_this,0);
_exit = false;
if((lbCurSel 2302) isEqualTo -1) exitWith {closeDialog 0;hint localize "STR_Shop_Veh_DidntPick"};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_action = true;
if!(_mode) then{
	
	
	_action = [									
			'Willst du das Fahrzeug mieten ??',
			'Fahrzeug mieten',
			'JA',
			'NEIN'
			] call BIS_fnc_guiMessage;

		
};
if(_action) then {
	_vehicleList = M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,SEL(life_veh_shop,0),"vehicles");
	//_shopSide = M_CONFIG(getText,CONFIG_LIGA_VEHSHOP,SEL(life_veh_shop,0),"side");
	_basePrice = SEL(SEL(_vehicleList,_vIndex),1);
	//_licenses = SEL(SEL(_vehicleList,_vIndex),2);

	if!(_mode) then {_basePrice = round(_basePrice * 0.67)};
	_colorIndex = lbValue[2304,(lbCurSel 2304)];

	//Series of checks (YAY!)
	if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {closeDialog 0; hint localize "STR_Shop_Veh_NoLicense"};

	if(_basePrice < 0) exitWith {closeDialog 0;}; //Bad price entry
	if(CASH < _basePrice) exitWith {closeDialog 0; hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - CASH] call life_fnc_numberText];};

	_spawnPoints = SEL(life_veh_shop,1);
	_spawnPoint = "";

	/* if((life_veh_shop select 0) == "med_air_hs") then {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
	} else { */
		//Check if there is multiple spawn points and find a suitable spawnpoint.
		if(EQUAL(typeName _spawnPoints,typeName [])) then {
			//Find an available spawn point.
			{if(count(nearestObjects[(getMarkerPos _x),["Air","Car","Ship"] + (M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_bohrt","allVeh")) + (M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_cargo","allVeh")),5]) isEqualTo 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
		} else {
			if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air","Car","Ship"] + (M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_bohrt","allVeh")) + (M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_cargo","allVeh")),5]) isEqualTo 0) exitWith {_spawnPoint = _spawnPoints};
		};
	//};


	if(EQUAL(_spawnPoint,"")) exitWith {closeDialog 0;hint localize "STR_Shop_Veh_Block";};
	SUB(CASH,_basePrice);
	hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];

	//Spawn the vehicle and prep it.

		_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
		waitUntil {!isNil "_vehicle"}; //Wait?
		VEH_DAMF(_vehicle); //Temp disable damage handling..
		_vehicle lock 2;
		_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
		_vehicle setDir (markerDir _spawnPoint);
		_vehicle setPos (getMarkerPos _spawnPoint);
		[_vehicle,_colorIndex] call life_fnc_colorVehicle;

		[_vehicle] call life_fnc_clearVehicleAmmo;
		[_vehicle,"trunk_in_use",false,true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
		[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
		//_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
		player reveal _vehicle;
		_flag = "civ";
		if(playerSide in [civilian,independent]) then {		
			if(liga_cop_on) then {[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;};	
			if(liga_lrk_on) then {[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;};	
			if!(liga_lrk_on && liga_cop_on) then {
				if(EQUAL(SEL(life_veh_shop,2),"civ") && {EQUAL(_className,"B_Heli_Light_01_F")}) then {
					[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
				};
			};	
		}else{	
			switch(playerSide) do {
				case west: {[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;}; 			
				case east: {[_vehicle,"adac_offroad",true] spawn life_fnc_vehicleAnimate;};			
			};			
		};
	/*

	switch(playerSide) do {
		case west: {
			[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
		};
		
		case civilian: {
			if(EQUAL(SEL(life_veh_shop,2),"civ") && {EQUAL(_className,"B_Heli_Light_01_F")}) then {
				[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
			};
		};
		
		case independent: {
			[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
		};
		
		case east: {
			[_vehicle,"adac_offroad",true] spawn life_fnc_vehicleAnimate;
		};
	};
	*/
	VEH_DAMT(_vehicle);

	//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
	life_vehicles pushBack _vehicle;
	[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];

	if(_mode) then {
		if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F","O_supplyCrate_F","Land_WaterTank_F","Land_CargoBox_V1_F"])) then {
			[(getPlayerUID player),side player,_vehicle,_colorIndex,(name player)] remoteExecCall ["TON_fnc_vehicleCreate",RSERV];
		};
	};

	[0] call SOCK_fnc_updatePartial;
	//[]call LIGACL_fnc_IgiVehAdd;
	closeDialog 0; //Exit the menu.
	true;
	[] call life_fnc_hudUpdate;
};