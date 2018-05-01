#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi - Die Liga
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer"];
disableSerialization;
params [
	["_unit",objNull,[objNull]],
	["_killer",objNull,[objNull]]
];
_log = [_unit,_killer, 0, 9, life_thirst, life_hunger];
LOG_to_HC(0,_log);
liga_deathUnit = _unit;
//Set some vars
_unit SVAR["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit SVAR["name",profileName,TRUE]; //Set my name so they can say my name.
_unit SVAR["restrained",FALSE,TRUE];
_unit SVAR["Escorting",FALSE,TRUE];
_unit SVAR["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit SVAR["steam64id",(getPlayerUID player),true]; //Set the UID.

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,17.5];
life_deathCamera camSetFOV 2;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;
life_deathCamera camSetFOV 0.2;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camCommit 22;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer","_LRKBtn","_medicsOnline"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_LRKBtn = ((findDisplay 7300) displayCtrl 7303);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	
	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count playableUnits > 0;
	//_medicsOnline = true;
	if(_medicsOnline) then {
		_LRKBtn ctrlEnable true;
	}else{
		_LRKBtn ctrlEnable false;
	};
	
	waitUntil {
		_Timer ctrlSetText format["Respawn verfügbar in: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
		round(_maxTime - time) <= 0 || isNull _this || Life_request_timer
	};
	
	if (Life_request_timer) then 
	{
		_maxTime = time + (life_respawn_timer * 150);
		waitUntil {
			_Timer ctrlSetText format["Respawn verfügbar in: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
			round(_maxTime - time) <= 0 || isNull _this
		};
	};
	
	Life_request_timer = false; //resets increased respawn timer
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {
		if(EQUAL(speed _unit,0)) exitWith {true}; 
		if!(isNil "life_deathCamera") then {
			life_deathCamera camSetTarget _unit; 
			life_deathCamera camSetRelPos [0,3.5,17.5]; 
			life_deathCamera camCommit 0;
		};
	};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		
		[getPlayerUID _killer,_killer GVAR ["realname",name _killer],"187V"] remoteExecCall ["life_fnc_wantedAdd",RSERV]; 
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
			[2] remoteExecCall ["life_fnc_removeLicenses",_killer];
		};
	} else {
		[getPlayerUID _killer,_killer GVAR ["realname",name _killer],"187"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
		
		if(!local _killer) then {
			[3] remoteExecCall ["life_fnc_removeLicenses",_killer];
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && side player != west) then {
	life_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!life_use_atm && {CASH > 0}) then {
		[format[localize "STR_Cop_RobberDead",[CASH] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
		CASH = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = false;
};


_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
CASH = 0;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[player,life_sidechat,side player] remoteExecCall ["TON_fnc_managesc",RSERV];

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;

if(lci_uhrspawn) then {	
	[player] joinSilent (createGroup independent);	
};
