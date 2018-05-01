/*
	File: fn_spawnConfirm.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;
cutText ["","BLACK IN"];
if(count life_spawn_point == 0) then
{
//	diag_log format [">>>>>>> count 0 %1",life_spawn_point];

	private["_sp","_spCfg"];
	_spCfg = [playerSide] call life_fnc_spawnPointCfg;
	_sp = _spCfg select 0;
//	diag_log format [">>>>>>> _spCfg 0 %1",_spCfg];
//	diag_log format [">>>>>>> _sp 0 %1",_sp];
	if(playerSide  in [civilian,independent]) then
	{
		if(isNil {(call compile format["%1", _sp select 0])}) then {
			player setPos (getMarkerPos (_sp select 0));
		} else {
			_spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom;
		//	diag_log str (_spawnPos);
			_spawnPos = _spawnPos buildingPos 0;
		//	diag_log str (_spawnPos);
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (_sp select 0));
	};
	camUseNVG false; false setCamUseTi 0;  
	_effect_screen = ppEffectCreate ["ColorCorrections", 5000];      
	_effect_screen ppEffectEnable true;  
	_effect_screen ppEffectAdjust [1, 1.2, 0, [1, 1, 1, 0], [1, 1, 1, 1.1], [1, 1, 1, 1.0]];  
	_effect_screen ppEffectCommit 0;
	cutText [" ", "BLACK IN", 1];
	//titleText[format["%2 %1",_sp select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
	
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [100];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 2; 
}
	else
{
	if(playerSide  in [civilian,independent]) then
	{
		if(isNil {(call compile format["%1",life_spawn_point select 0])}) then {
		//	diag_log format [">>>>>>> NIL LSP life_spawn_point %1",life_spawn_point];
			if((["house",life_spawn_point select 0] call BIS_fnc_inString)) then {
				private["_bPos","_house","_pos"];
				_house = (nearestObjects [getMarkerPos (life_spawn_point select 0),["House_F"],10]) select 0;
				_bPos = [_house] call life_fnc_getBuildingPositions;
			//	diag_log format [">>>>>>> NIL LSP _house %1",_house];
			//	diag_log format [">>>>>>> NIL LSP _bPos %1",_bPos];
				if(count _bPos == 0) exitWith {
					player setPos (getMarkerPos (life_spawn_point select 0));
				};
				
				{_bPos = _bPos - [(_house buildingPos _x)];} foreach (_house getVariable ["slots",[]]);
				_pos = _bPos call BIS_fnc_selectRandom;
				player setPosATL (_house modelToWorld _pos);
			} else {
				player setPos (getMarkerPos (life_spawn_point select 0));
			//	diag_log format [">>>>>>> ELESE222 life_spawn_point %1",life_spawn_point];
			};
		} else {
		//	diag_log format [">>>>>>> ELSE %1",life_spawn_point];
			_spawnPos = (call compile format["%1", life_spawn_point select 0]) call BIS_fnc_selectRandom;
		//	diag_log format [">>>>>>> _spawnPos %1",_spawnPos];
		//	diag_log str (_spawnPos);
			_spawnPos = _spawnPos buildingPos 0;
		//	diag_log str (_spawnPos);
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (life_spawn_point select 0));
	};
	camUseNVG false; false setCamUseTi 0;  
	_effect_screen = ppEffectCreate ["ColorCorrections", 5000];      
	_effect_screen ppEffectEnable true;  
	_effect_screen ppEffectAdjust [1, 1.2, 0, [1, 1, 1, 0], [1, 1, 1, 1.1], [1, 1, 1, 1.0]];  
	_effect_screen ppEffectCommit 0;
	cutText [" ", "BLACK IN", 1];
	//titleText[format["%2 %1",_sp select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
	
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [100];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 2;  
};

if(life_firstSpawn) then {
	life_firstSpawn = false;
	
};
[] call life_fnc_hudSetup;

[] spawn {
	sleep 15; 
	player allowDamage true;
};