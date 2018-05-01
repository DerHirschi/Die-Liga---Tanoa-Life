#include "\life_server\Liga_Macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches all the players houses and sets them up.
*/
private["_query","_houses","_pos","_dir","_house","_trunk","_arr","_kassin","_zucont","_kasslot","_positions"];
if(EQUAL(SEL(_this,0),"")) exitWith {};

_query = format["LadenFetchPlayerLaden:%1",SEL(_this,0)];

_houses = [_query,2,true] call DB_fnc_asyncCall;
//diag_log format [">>>>Laden Fetch Det>>> %1",_houses];

_return = [];
{
	/*der Wichtige Scheiss ... Kassen Trunk Preistab usw...*/
	
	//_pos = [_x select 1] call DB_fnc_mresString;
	_pos = call compile format["%1",_x select 1];
	diag_log format [">>Laden Det>>>>> pos %1",_pos];
	//diag_log format [">>>>>>> _x select 1 %1",_x select 1];

	_house = nearestBuilding _pos;
	//diag_log format [">>>>>>> _house %1",_house];

	VEH_DAMF(_house);
	
	
	_kassen = [];
	_allzucont = [];
	_house SVAR["slots",[],true];
	
	if(!isNil {(_house GVAR "kassen")}) then {
		{
			if(!isNull (SEL(_x,0))) then {				
				deleteVehicle (SEL(_x,0));
			};
			{
				if(!isNull _x) then {
					deleteVehicle _x;
				};
			}foreach (SEL(_x,1));
		} foreach (_house GVAR "kassen");
	};
	/*EXTRA*/
	_extraData = SEL(_x,2);//[_x select 3] call DB_fnc_mresToArray;
	/*Preistab*/
	_kassenData = SEL(_x,3);//[_x select 3] call DB_fnc_mresToArray;
	if(typeName _kassenData == "STRING") then {_kassenData = call compile format["%1", _kassenData];};
	
	/*Kasseninhalt $$$*/
	_kassin = SEL(_x,4);//[_x select 2] call DB_fnc_mresToArray;
	
	
	_zucont = SEL(_x,5);//[_x select 2] call DB_fnc_mresToArray;
	
	
	{
		if(EQUAL((count _x),0)) exitWith {}; //No containers / items.

		
		//Setup the variables
		_positions = [_house,0] call LIGACL_fnc_getLadenPositions;
		_pos = [0,0,0];
		//diag_log format [">>>>>>> _positions %1",_positions];
		
		{
			_slots = _house GVAR ["slots",[]];
			if(!(_forEachIndex in _slots)) exitWith {
				_slots pushBack _forEachIndex;
				_house SVAR["slots",_slots,true];
				_pos = SEL(_x,0);
				_dir = SEL(_x,1);
				//diag_log format [">>>>Laden Kassen>>> _x _pos %1",_x];
			};
		} foreach _positions;
		
		if(_pos isEqualTo [0,0,0]) exitWith {};
		
		_container = createVehicle["Land_CashDesk_F",_pos,[],0,"NONE"];
		waitUntil{!isNil "_container"};
		_container enableSimulationGlobal false;
		//diag_log format [">>>>>>> _container %1",_container];
		VEH_DAMF(_container);		
		uiSleep 0.5;
		_container setPosATL (_house modelToWorld _pos);
		_container setDir (getDir _house + _dir);
		_container SVAR ["kassinh",SEL(_kassin,_forEachIndex),true];
		_container SVAR ["kasspreis",_x,true];
		Liga_Laden pushBack _container;
		[[_container]] remoteExec ["LIGACL_fnc_addLadenAction",RCLIENT];
		
		//_containers pushBack 		_container;
		clearWeaponCargoGlobal 		_container;
		clearItemCargoGlobal 		_container;
		clearMagazineCargoGlobal 	_container;
		clearBackpackCargoGlobal 	_container;
		
		_kasslot 	= _forEachIndex;	
		_positions 	= [_house,1] call LIGACL_fnc_getLadenPositions;
		{
			if(EQUAL(count _x,0)) exitWith {}; //No containers / items			
			//{
				_pos = [0,0,0];
				//diag_log format [">>>>>>> _positionsSchrank %1",_positions];
				
				{
					_slots = _container GVAR ["zuslots",[]];
					if(!(_forEachIndex in _slots)) exitWith {
						_slots pushBack _forEachIndex;
						_container SVAR["zuslots",_slots,true];
						_pos = SEL(_x,0);
						_dir = SEL(_x,1);
					//	diag_log format [">>>>Laden Schrank>>> _x _pos %1",_x];
					};
				} foreach (SEL(_positions,_kasslot));
				
				if(_pos isEqualTo [0,0,0]) exitWith {};
				
				_zucontainer = createVehicle["Land_ShelvesMetal_F",_pos,[],0,"NONE"];
				waitUntil{!isNil "_zucontainer"};
				_zucontainer enableSimulationGlobal false;
			//	diag_log format [">>>>>>> _zucontainer %1",_zucontainer];
				VEH_DAMF(_zucontainer);		
				uiSleep 0.5;
				_zucontainer setPosATL (_house modelToWorld _pos);
				_zucontainer setDir (getDir _house + _dir);
				
				_arr = missionNamespace getVariable [format["%1_KEYS_%2",SEL(_this,0),SEL(_this,1)],[]];
				_arr pushBack _zucontainer;
				_arr = _arr - [ObjNull];
				missionNamespace setVariable[format["%1_KEYS_%2",SEL(_this,0),SEL(_this,1)],_arr];
				//_zucontainer SVAR ["kassinh",SEL(_kassin,_forEachIndex),true];
				//_zucontainer SVAR ["kasspreis",_x,true];
				
				/*TRUNK*/
				
				//if(typeName _trunk == "STRING") then {_trunk = call compile format["%1", _trunk];};
				_zucontainer SVAR["Trunk",_x,true];			
				
				
				//_containers pushBack 		_zucontainer;
				clearWeaponCargoGlobal 		_zucontainer;
				clearItemCargoGlobal 		_zucontainer;
				clearMagazineCargoGlobal 	_zucontainer;
				clearBackpackCargoGlobal 	_zucontainer;
				
				_allzucont pushBack 		_zucontainer;
				
			
		//	} forEach (SEL(_x,0));
		//	} forEach _x;
			
			
		}forEach (SEL(_zucont,_forEachIndex));
		//				 [OBJ		,[OBJ,OBJ]]	
		_kassen pushBack [_container,_allzucont	];
		_allzucont = [];
	} foreach _kassenData;
	
	_house SVAR["kassen",_kassen,true];
	_return pushBack [SEL(_x,1),_kassen];
	
	_house SVAR ["ladextra",_extraData,true];
	
} foreach _houses;

missionNamespace SVAR[format["laden_%1",SEL(_this,0)],_return];