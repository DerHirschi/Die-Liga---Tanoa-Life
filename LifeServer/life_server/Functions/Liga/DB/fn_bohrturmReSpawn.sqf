#include "\life_server\Liga_Macros.hpp"
/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi Liga-Life
	
	Description:
	Sends the query request to the database, if an array is returned then it creates
	the vehicle if it's not in use or dead.
*/
private["_vid","_sp","_pid","_query","_vehicle","_nearVehicles","_side","_dir","_queryResult"];
_vid 	= [_this,0,-1,[0]	] call BIS_fnc_param;
_pid 	= [_this,1,"",[""]	] call BIS_fnc_param;
_sp 	= [_this,2,[],[[]]	] call BIS_fnc_param;
_name 	= [_this,3,"",[""]	] call BIS_fnc_param;
_dir 	= [_this,4,0 ,[0]	] call BIS_fnc_param;
_varNam	= [_this,5,"",[""]	] call BIS_fnc_param;

_side 	= civilian;


if(EQUAL(_vid,-1) OR EQUAL(_pid,"") OR EQUAL(_varNam,"")) exitWith {};
if(_vid in serv_sv_use) exitWith {};

serv_sv_use pushBack _vid;
_servIndex = serv_sv_use find _vid;

_query = format["vehicleInfo:%1:%2",_vid,_pid];


_queryResult = [_query,2] call DB_fnc_asyncCall;


	diag_log "╔════════════════════════════════╗";
	diag_log "║------------------ Client Query Request -----------------";
	diag_log "╠════════════════════════════════╣";
	diag_log "║------------- Bohrturm Respawn DB LOG ------------";
	diag_log format["║ QUERY: %1",_query];
	diag_log format["║ _vid: %1",_vid];
	diag_log format["║ typeName  _vid: %1",(typeName _vid)];
	diag_log format["║ _pid: %1",_pid];
	diag_log format["║ typeName _pid: %1",(typeName  _pid)];
	diag_log format["║ _name: %1",_name];
	diag_log format["║ _dir: %1",_dir];
	diag_log format["║ _sp: %1",_sp];
	diag_log format["║ _varNam: %1",_varNam];
	diag_log format["║ Result: %1",_queryResult];
	diag_log "╚════════════════════════════════╝";

if(EQUAL(typeName _queryResult,typeName "")) exitWith {};

_vInfo = _queryResult;

if(isNil "_vInfo") exitWith {serv_sv_use deleteAt _servIndex;};

if(EQUAL(count _vInfo,0)) exitWith {serv_sv_use deleteAt _servIndex;};

if(EQUAL(SEL(_vInfo,5),0)) exitWith {	serv_sv_use deleteAt _servIndex;};

if(EQUAL(SEL(_vInfo,6),1)) exitWith {	serv_sv_use deleteAt _servIndex;};
//diag_log str _sp;
if!(EQUAL(typeName _sp,typeName "")) then {
	_nearVehicles = nearestObjects[_sp,["Air","Car","Ship"] + (M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_bohrt","allVeh")) + (M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_cargo","allVeh")),5];
} else {
	_nearVehicles = [];
};

if(count _nearVehicles > 0) exitWith {	serv_sv_use deleteAt _servIndex;};


_vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
_vehicle allowDamage false;
_vehicle setPos _sp;
_vehicle setVectorUp (surfaceNormal _sp);
_vehicle setDir _dir;
sleep 1.6;


_type = switch(true) do
{
	case ((SEL(_vInfo,2)) in M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_bohrt","allVeh")): {"BOHR"};
	case ((SEL(_vInfo,2)) in M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_cargo","allVeh")): {"CARGO"};

};


_query = format["vehicleUpdateActive:1:%1:%2:%3:%4:%5",_pid,_vid,_type,0,0];
[_query,false] spawn DB_fnc_asyncCall;

	diag_log "╔════════════════════════════════╗";
	diag_log "║------------------ Client Query Request -----------------";
	diag_log "╠════════════════════════════════╣";
	diag_log "║------------- Bohrturm Respawn DB LOG ------------";
	diag_log format["║ QUERY: %1",_query];
	diag_log format["║ _vid: %1",_vid];
	diag_log format["║ _pid: %1",_pid];
	diag_log format["║ (_vInfo select 0): %1",(_vInfo select 0)];


	diag_log "╚════════════════════════════════╝";
	
//Send keys over the network.


//Reskin the vehicle 

_vehicle SVAR["vehicle_info_owners",[[_pid,_name]],true];
_vehicle SVAR["dbInfo",[(_vInfo select 4),(_vInfo select 7),_name,(_vInfo select 0)]];
[_vehicle,"dbInfo",[(_vInfo select 4),(_vInfo select 7),_name,(_vInfo select 0)],false] remoteExecCall ["SKY_fnc_setObjVar",HC_id];


//Sets of animations

serv_sv_use deleteAt _servIndex;


_vehicle allowDamage true;

[_vehicle,false,Objnull,_varNam] remoteExec ["LIGA_fnc_turmUP",HC_id];
