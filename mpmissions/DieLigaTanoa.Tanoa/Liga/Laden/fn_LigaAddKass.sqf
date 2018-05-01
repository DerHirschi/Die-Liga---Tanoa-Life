#include "..\..\Liga_script_macros.hpp"

/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	Description:
	Tries to place a storage box in the nearest house.
*/
private["_boxType","_house","_kasse","_positions","_containers","_pos","_dir","_houseCfg"];
_boxType = SEL(_this,0);

_house = nearestObject [(getPosATL player), "House_F"];
if(!(_house in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};
_containers = _house GVAR["kassen",[]];

switch (_boxType) do {
	
	case "schrank": {
		
		_kasse = nearestObject [(getPosATL player), "Land_CashDesk_F"];
		_kassindex = -1;
		{
			if(_kasse in _x) exitWith {_kassindex = _forEachIndex;};
		} forEach _containers;

		if(EQUAL(_kassindex,-1))exitWith {hint "Du musst erst eine Kasse aufbauen...";};
		
		_allzucont = (SEL(SEL(_containers,_kassindex),1));
		
		if(!isClass (missionConfigFile >> "LigaLadenClass" >> (typeOf _house))) exitWith {};

		_count = count ((M_CONFIG(getArray,"LigaLadenClass",(typeOf _house),"ZusatzPos")) select _kassindex);
		_count2 = count _allzucont;
		if(_count2 >= _count)  exitWith {hint localize "STR_ISTR_Box_HouseFull"};
		
		
		_zupos 		= [_house,1] call LIGACL_fnc_getLadenPositions;
				
		_pos = [0,0,0];
		{
			_slots = _kasse GVAR ["zuslots",[]];
			if(!(_forEachIndex in _slots)) exitWith {
				_slots pushBack _forEachIndex;
				_kasse SVAR["zuslots",_slots,true];
				_pos = SEL(_x,0);
				_dir = SEL(_x,1);
			};
		} foreach (SEL(_zupos,_kassindex));
		if(_pos isEqualTo [0,0,0]) exitWith {};
		if(!([false,_boxType,1] call life_fnc_handleInv)) exitWith {};			
		_zucontainer = createVehicle["Land_ShelvesMetal_F",_pos,[],0,"NONE"];
		waitUntil{!isNil "_zucontainer"};
		VEH_DAMF(_zucontainer);	
		_zucontainer enableSimulation false;		
		uiSleep 0.5;
		_zucontainer setPosATL (_house modelToWorld _pos);
		_zucontainer setDir (getDir _house + _dir);
		_allzucont pushBack 		_zucontainer;
		life_vehicles pushBack 		_zucontainer;
					
		_containers set [_kassindex,[ SEL(SEL(_containers,_kassindex),0)  ,_allzucont]];	
		_house SVAR["kassen",_containers,true];		
		
		_zucontainer SVAR["Trunk",[[],0],true];		
		
		//_containers pushBack 		_zucontainer;
		clearWeaponCargoGlobal 		_zucontainer;
		clearItemCargoGlobal 		_zucontainer;
		clearMagazineCargoGlobal 	_zucontainer;
		clearBackpackCargoGlobal 	_zucontainer;
		uiSleep 1;
		[_house] remoteExec ["TON_fnc_updateZusa",RSERV];	

	};
	
	case "kasse": {
		
		_houseCfg = [(typeOf _house)] call LIGACL_fnc_LigaLadenCfg;
		if(EQUAL(count _houseCfg,0)) exitWith {}; //What the fuck happened?
		if(count _containers  >= (_houseCfg select 1)) exitWith {hint localize "STR_ISTR_Box_HouseFull"};

		_slots 		= _house GVAR ["slots",[]];
		_positions 	= [_house,0] call LIGACL_fnc_getLadenPositions;

		_pos = [0,0,0];
		{
			_slots = _house GVAR ["slots",[]];
			if(!(_forEachIndex in _slots)) exitWith {
				_slots pushBack _forEachIndex;
				_house SVAR["slots",_slots,true];
				_pos = SEL(_x,0);
				_dir = SEL(_x,1);		
			};
		} foreach _positions;
		
		if(_pos isEqualTo [0,0,0]) exitWith {hint localize "STR_ISTR_Box_HouseFull_2"};
		if(!([false,_boxType,1] call life_fnc_handleInv)) exitWith {};	
	
		_container = "Land_CashDesk_F" createVehicle [0,0,0];
		_container allowDamage false;
		_container enableSimulation false;
		_container setPosATL (_house modelToWorld _pos);
		_container setDir (getDir _house + _dir);
		_containers pushBack [_container,[]];
		
		_house SVAR["kassen",_containers,true];
		_container SVAR ["kassinh",0,true];
		_container SVAR ["kasspreis",[["",-1],["",-1],["",-1]],true];
		uiSleep 1;
		[[_container]] remoteExec ["LIGACL_fnc_addLadenAction",RCLIENT];	
		[_house] remoteExec ["TON_fnc_updateKass",RSERV];	
		[_house] remoteExec ["TON_fnc_updateZusa",RSERV];
		[_container] remoteExec ["TON_fnc_KassAction",RSERV];
				
		//Empty out the crate
		clearWeaponCargoGlobal _container;
		clearMagazineCargoGlobal _container;
		clearItemCargoGlobal _container;
		clearBackpackCargoGlobal _container;
	};
};