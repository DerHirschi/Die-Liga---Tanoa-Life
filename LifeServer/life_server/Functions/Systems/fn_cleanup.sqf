/*
	File: fn_cleanup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Server-side cleanup script on vehicles.
	Sort of a lame way but whatever.
*/
private["_deleted","_dam_ar","_veh","_units","_tuv","_repcount","_dbInfo","_uid","_plate","_query"];
_deleted = false;
	
	{
		_veh = _x;
		_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");
		
		if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) then
		{
			_dbInfo		= _veh getVariable["dbInfo",[]];
			_repcount 	= _veh getVariable["tuv",[]];
			_units 		= 0;
			{if(_x distance2D _veh < 4500) exitWith {_units = 1; }; } foreach playableUnits;
			//_units 		= {(_x distance2D _veh < 4500)} count playableUnits;
			_dam_ar 	= [_x] call TON_fnc_getHit;
			_uid 		= _dbInfo select 0;
			if((count _dbInfo) isEqualTo 0) then { _uid = "00";};
			if(((count crew _veh) isEqualTo 0) && (_units isEqualTo 0) && !([_uid] call life_fnc_isUIDActive)) then
			{
				switch (true) do
				{
					case ((_x getHitPointDamage "HitEngine") 	> 0.7  ) : 	{	 deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitLFWheel") 	> 0.88 ) : 	{	 deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitLF2Wheel") 	> 0.88 ) : 	{	 deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitRFWheel") 	> 0.88 ) : 	{	 deleteVehicle _x; _deleted = true;};
					case ((_x getHitPointDamage "HitRF2Wheel") 	> 0.88 ) : 	{	 deleteVehicle _x; _deleted = true;};
					//case (_units isEqualTo 0): {deleteVehicle _x; _deleted = true;};
				};
			};
			
			if(_deleted) then {
				waitUntil {isNull _veh};
				_deleted = false;
			};
			
			if(isNull _veh) then
			{
		
				if(count _dbInfo > 0) then
				{
					if(count _repcount isEqualTo 0) then {_repcount = 0;_tuv = 0;}else{_tuv = _repcount select 0;_repcount = _repcount select 1;};
					//systemChat "Fixing...";
					_uid = _dbInfo select 0;
					_plate = _dbInfo select 1;
					/*
						if (debugRPT_srv) then {	
						diag_log "╠══════════════════════════════════════════════════╣";
						diag_log format["║LigaCleanup Car Damage Array %1",_dam_ar];
						diag_log "╠══════════════════════════════════════════════════╣";
						};
					*/	
					//_query = format["UPDATE vehicles SET active='0', damage='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_dam_ar];
					_query = format["vehicleUpdateActivePlate:0:%1:%2:%3:%4:%5",_uid,_plate,_dam_ar,_repcount,_tuv];

					[_query,1] call DB_fnc_asyncCall;
				};
			}else{
				if(count _dbInfo > 0) then
				{
					if(count _repcount isEqualTo 0) then {_repcount = 0;_tuv = 0;}else{_tuv = _repcount select 0;_repcount = _repcount select 1;};
					//systemChat "Fixing...";
					_uid = _dbInfo select 0;
					_plate = _dbInfo select 1;
					_query = format["vehicleUpdateActivePlate:1:%1:%2:%3:%4:%5",_uid,_plate,_dam_ar,_repcount,_tuv];

					[_query,1] call DB_fnc_asyncCall;
				};				
			};
		};
	} foreach vehicles;
	
	{
		if((typeOf _x) in ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F", "Land_Can_V3_F","Land_Money_F","Land_Suitcase_F"]) then
		{
			deleteVehicle _x;
		};
	} foreach (allMissionObjects "Thing");
	
	{
		deleteVehicle _x;
	} foreach (allMissionObjects "GroundWeaponHolder");

