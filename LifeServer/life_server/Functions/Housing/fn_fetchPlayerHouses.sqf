#include "\life_server\Liga_Macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches all the players houses and sets them up.
*/
private["_query","_houses","_pos","_house","_trunk"];
if(EQUAL(_this,"")) exitWith {};

_query = format["housingFetchPlayerHouse:%1",_this];

_houses = [_query,2,true] call DB_fnc_asyncCall;
//diag_log format [">>>>>>> Query %1",_houses];

_return = [];
{
	
	//_pos = [_x select 1] call DB_fnc_mresString;
	_pos = call compile format["%1",_x select 1];
	//diag_log format [">>>>>>> pos %1",_pos];
	//diag_log format [">>>>>>> _x select 1 %1",_x select 1];
	//_house = nearestObject [_pos, "House_F"];
	_house = nearestBuilding _pos;
	//diag_log format [">>>>>>> _house %1",_house];
	//_house allowDamage false;
	VEH_DAMF(_house);
	_containers = [];
	_house SVAR["slots",[],true];
	if(!isNil {(_house GVAR "containers")}) then {
		{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house GVAR "containers");
	};
	
	_trunk = _x select 2;//[_x select 2] call DB_fnc_mresToArray;
	if(typeName _trunk == "STRING") then {_trunk = call compile format["%1", _trunk];};
	_containerData = _x select 3;//[_x select 3] call DB_fnc_mresToArray;
	if(typeName _containerData == "STRING") then {_containerData = call compile format["%1", _containerData];};
	_house SVAR["Trunk",_trunk,true];
	//diag_log format [">>>>>>> _containerData %1",_containerData];
	{
		if(EQUAL((count _x),0)) exitWith {}; //No containers / items.
		_className = SEL(_x,0);
		_weapons = (SEL(_x,1)) select 0;
		_magazines = (SEL(_x,1)) select 1;
		_items = (SEL(_x,1)) select 2;
		_backpacks = (SEL(_x,1)) select 3;
		
		//Setup the variables
		_positions = [_house] call life_fnc_getBuildingPositions;
		_pos = [0,0,0];
	//	diag_log format [">>>>>>> _positions %1",_positions];
		
		{
			_slots = _house GVAR ["slots",[]];
			if(!(_forEachIndex in _slots)) exitWith {
				_slots pushBack _forEachIndex;
				_house SVAR["slots",_slots,true];
				_pos = _x;
		//		diag_log format [">>>>>>> _x _pos %1",_x];
			};
		} foreach _positions;
		
		if(_pos isEqualTo [0,0,0]) exitWith {};
		
		_container = createVehicle[_className,_pos,[],0,"NONE"];
		waitUntil{!isNil "_container"};
		
		clearWeaponCargoGlobal _container;
		clearItemCargoGlobal _container;
		clearMagazineCargoGlobal _container;
		clearBackpackCargoGlobal _container;
	//	diag_log format [">>>>>>> _container %1",_container];
		VEH_DAMF(_container);
		uiSleep 0.2;
		_container setPosATL (_house modelToWorld _pos);
		
		//_container enableSimulation false;
		
		
		clearWeaponCargoGlobal _container;
		clearItemCargoGlobal _container;
		clearMagazineCargoGlobal _container;
		clearBackpackCargoGlobal _container;

		uiSleep 0.2;
		
		_containers pushBack _container;
		clearWeaponCargoGlobal _container;
		clearItemCargoGlobal _container;
		clearMagazineCargoGlobal _container;
		clearBackpackCargoGlobal _container;		
		//Add weapons to the crate.
		{
			_weaponCount = (SEL(_weapons,1)) select _forEachIndex;
			_container addWeaponCargoGlobal [_x,_weaponCount];
		} foreach (SEL(_weapons,0));
		
		//Add magazines
		{
			_magazineCount = (SEL(_magazines,1)) select _forEachIndex;
			_container addMagazineCargoGlobal [_x,_magazineCount];
		} foreach (SEL(_magazines,0));
			
		//Add items
		{
			_itemCount = (SEL(_items,1)) select _forEachIndex;
			_container addItemCargoGlobal [_x,_itemCount];
		} foreach (SEL(_items,0));
		
		//Add backpacks
		{
			_backpackCount = (SEL(_backpacks,1)) select _forEachIndex;
			_container addBackpackCargoGlobal [_x,_backpackCount];
		} foreach (SEL(_backpacks,0));
		
	} foreach _containerData;
	
	_house SVAR["containers",_containers,true];
	_return pushBack [_x select 1,_containers];
} foreach _houses;

missionNamespace SVAR[format["houses_%1",_this],_return];