#include "..\Liga_script_macros.hpp"
/*
	File: super.sqf
	Author: Paradox
	Edit: Hirschi - Die Liga
	
	Description: Wer braucht Super ? Siehe fn_diesel.sqf
*/
private["_items","_e","_abm","_privatTank","_space","_itemWeight","_classNameLife","_vehicle", "_controll", "_liter", "_completeliter", "_costs", "_vehicleFuelold", "_vehicleArray", "_ui", "_progress", "_pgText", "_cP", "_vehicleName"];
_privatTank = SEL(_this,0);
_vehicleArray = nearestObjects[getPos player, ["Landvehicle","Ship"],10];
_saule = life_pInact_curTarget;
if(EQUAL(count _vehicleArray,0)) exitwith { hint "Kein Fahrzeug gefunden"};
if(count _vehicleArray > 1 ) exitwith { hint "Es wurde mehr als ein Fahrzeug im Umkreis von 5 Metern gefunden! Bitte entferne alle weiteren Fahrzeuge...";};
life_shop_type = "tank";
_vehicle = SEL(_vehicleArray,0);

_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_controll = 0.01;
_liter = 1;
_completeliter = 1;
_cost = 0;
_vehicleFuelold = 0;
_vehicle engineOn false;

{
	_x action ["Eject", vehicle _x];
} 
forEach crew _vehicle;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//1.00 = voll = 100% annahme 65 Liter fasst Tank von offroad währen: 1.00 / 65L = 0.0154L 
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////

_classNameLife = typeOf _vehicle;
if(!isClass (missionConfigFile >> CONFIG_LIGA_VEHICLES >> _classNameLife)) then {
	_classNameLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_classNameLife];
};	
_completeliter = M_CONFIG(getNumber,CONFIG_LIGA_VEHICLES,_classNameLife,"LigaTank");
_completeliter = _completeliter * 3;
_liter = 0.00900;


//GET VEHICLE Fuel Percent
_vehicleFuelold = fuel _vehicle;

_cost = round(((1 - _vehicleFuelold) * _completeliter) * fuel_super);

/*	Wenn Privat dann gucken ob Tank voll*/
_e = false;
if(_privatTank) then {
	if(isNull _saule)exitWith {hint "Es ist ein Fehler aufgetreten... Bitte an den Support melden..";};
	_saule SVAR ["trunk_in_use",true,true];
	_inv = _saule GVAR ["Trunk",[[],0]];
	_itemIndex 	= ["ben",SEL(_inv,0)] call TON_fnc_index;
	if(EQUAL(_inv,[]) || EQUAL(_itemIndex,-1) ) exitWith {
		_abm = _saule GVAR ["ABM",false];
		if!(_abm)then {
			_saule SVAR ["ABM",true,true];
			[_saule] remoteExecCall ["TON_fnc_TankABM",RSERV];
		};
		hint "Diese Tankstelle ist leer.. Der Besitzer erhällt eine Abmahnung ...";
		_e = true;
	};
	_items 		= SEL(_inv,0);
	_space 		= SEL(_inv,1);
	_val 		= _items select _itemIndex select 1;
	/**/
	_Fahrtank 	= round ((_completeliter - (_vehicleFuelold * _completeliter)) / 50); // 20 = Faktor
	if(_val < _Fahrtank)  exitWith {
		_abm = _saule GVAR ["ABM",false];
		if!(_abm)then {
			_saule SVAR ["ABM",true,true];
			[_saule] remoteExecCall ["TON_fnc_TankABM",RSERV];
		};
		hint "Diese Tankstelle ist leer.. Der Besitzer erhällt eine Abmahnung ...";
		_e = true;
	};

	_weight 	= [_saule] call life_fnc_vehicleWeight;
	_itemWeight = (["ben"] call life_fnc_itemWeight) * _Fahrtank;			
	_items set[_itemIndex,["ben",_val - _Fahrtank]];	

};
if(_e) exitWith {_saule SVAR ["trunk_in_use",false,true];};
// CREATE DIALOG FOR Fuel

_action = [
	format["Moechtest du dein Fahrzeug %1 voll betanken? Das Tanken kostet %2 $ und wird von deinem Konto abgezogen. Sollte der Tankvorgang unterbrochen werden, wird kein Geld erstattet.",_vehicleName,[_cost] call life_fnc_numberText],
	"Betanken",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if(_action) then {
	
	if(fuel _vehicle > 0.99) exitWith {hint "Dein Fahrzeug ist bereits voll betankt"; 5 cutText ["","PLAIN"];};
	if(BANK < _cost) exitWith {hint format["Du hast nicht genuegend Geld auf der Bank! Du benoetigst %1",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"];};
	SUB(BANK,_cost);
	
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = GVAR_UINS "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["Betanke %2 (%3%1)...","%",_vehicleName,round(_vehicleFuelold * 100) ];
	_progress progressSetPosition _vehicleFuelold;
	_cP = _vehicleFuelold;
	
	while {fuel _vehicle < 0.99} do {
			
		sleep  0.3;
		_cP = (_cP + _liter) min 1;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Betanke %2 (%3%1)...","%",_vehicleName,round((fuel _vehicle) * 100 ) ];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 7) exitWith {hint "Du musst zum Tanken im Umkreis von 5 Metern bleiben."; 5 cutText ["","PLAIN"];};
		if(vehicle player != player)exitWith{hint "Der Tankvorgang muss beaufsichtigt werden !!!";};
		if (ad_debugHint) then {
			hint formatText["DEBUG akt TANK: %1, CP %2, Liter %3", fuel _vehicle, _cp, _liter]; 5 cutText ["","PLAIN"];
		};	

		[_vehicle,((fuel _vehicle + _liter) min 1)] remoteExecCall ["life_fnc_setFuel",_vehicle];		
		//_vehicle setFuel ((fuel _vehicle + _liter) min 1);
	};
		
	if (round (fuel _vehicle) > 0.96) then {		

		[_vehicle,1] remoteExecCall ["life_fnc_setFuel",_vehicle];	
		//_vehicle setFuel 1;
		//5 cutText ["","PLAIN"];
		hint format ["Dein Fahrzeug %1 wurde für %2$ vollgetankt. Wir wuenschen eine gute Weiterfahrt" , _vehicleName,[_cost] call life_fnc_numberText];

	
		if(_privatTank) then {
			
				_saule SVAR["Trunk",[_items,_space - _itemWeight],true];	
				_kasse = _saule GVAR "Kasse";
				if(!isNil "_kasse")then {_saule SVAR ["Kasse",(_kasse + _cost),true];}else{_saule SVAR ["Kasse",_cost,true];};
				[_saule] remoteExecCall ["TON_fnc_updateTankTrunk",RSERV];
				uiSleep 0.4;
			
			//_saule SVAR ["trunk_in_use",false,true];
		}else{
			["ben",(round(((1 - _vehicleFuelold) * _completeliter) / 15)),true,true,false]call life_fnc_ligaWHbuy;
		};
	};
	5 cutText ["","PLAIN"];	
	if(_privatTank) then { _saule SVAR ["trunk_in_use",false,true]; };
} else {
	hint "Betankung abgebrochen";
	_saule SVAR ["trunk_in_use",false,true];
};

