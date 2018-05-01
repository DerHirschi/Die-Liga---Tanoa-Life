#include "\life_server\Liga_Macros.hpp"
/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi Liga-Life
	
	Description:
	Sends the query request to the database, if an array is returned then it creates
	the vehicle if it's not in use or dead.
*/
private["_vid","_sp","_pid","_query","_vehicle","_nearVehicles","_name","_side","_dir"];
_vid = 	[_this,0,-1,[0]] call BIS_fnc_param;
_pid = 	[_this,1,"",[""]] call BIS_fnc_param;
_sp = 	[_this,2,[],[[],""]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
_price =[_this,4,0,[0]] call BIS_fnc_param;
_dir = 	[_this,5,0,[0]] call BIS_fnc_param;
_side = [_this,6,civilian,[civilian]] call BIS_fnc_param;
_unit_return = _unit;
_name = name _unit;
//_side = side _unit;
_unit = owner _unit;

if(EQUAL(_vid,-1) OR EQUAL(_pid,"")) exitWith {};
if(_vid in serv_sv_use) exitWith {};
serv_sv_use pushBack _vid;
_servIndex = serv_sv_use find _vid;

_query = format["vehicleInfo:%1:%2",_vid,_pid];

//waitUntil{sleep (random 0.3); !DB_Async_Active};
//_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;
/*
	diag_log "╔════════════════════════════════╗";
	diag_log "║------------------ Client Query Request -----------------";
	diag_log "╠════════════════════════════════╣";
	diag_log "║------------- Fahrzeug ausparken DB LOG ------------";
	diag_log format["║ QUERY: %1",_query];
	diag_log format["║ _vid: %1",_vid];
	diag_log format["║ typeName  _vid: %1",(typeName _vid)];
	diag_log format["║ _pid: %1",_pid];
	diag_log format["║ typeName _pid: %1",(typeName  _pid)];	

	diag_log format["║ Result: %1",_queryResult];
	diag_log "╚════════════════════════════════╝";
*/
if(EQUAL(typeName _queryResult,typeName "")) exitWith {};

_vInfo = _queryResult;
if(isNil "_vInfo") exitWith {serv_sv_use deleteAt _servIndex;};
if(EQUAL(count _vInfo,0)) exitWith {serv_sv_use deleteAt _servIndex;};

if(EQUAL(SEL(_vInfo,5),0)) exitWith {
	serv_sv_use deleteAt _servIndex;
	[1,format[(localize "STR_Garage_SQLError_Destroyed"),_vInfo select 2]] remoteExecCall ["life_fnc_broadcast",_unit];
};

if(EQUAL(SEL(_vInfo,6),1)) exitWith {
	serv_sv_use deleteAt _servIndex;
	[1,format[(localize "STR_Garage_SQLError_Active"),_vInfo select 2]] remoteExecCall ["life_fnc_broadcast",_unit];
};
//diag_log str _sp;
if!(EQUAL(typeName _sp,typeName "")) then {
	_nearVehicles = nearestObjects[_sp,["Air","Car","Ship"] + (M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_bohrt","allVeh")) + (M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_cargo","allVeh")),5];
} else {
	_nearVehicles = [];
};

if(count _nearVehicles > 0) exitWith {
	serv_sv_use deleteAt _servIndex;
	[_price,_unit_return] remoteExecCall ["life_fnc_garageRefund",_unit];
	[1,(localize "STR_Garage_SpawnPointError")] remoteExecCall ["life_fnc_broadcast",_unit];
};


if(EQUAL(typeName _sp,"STRING")) then {
	_vehicle = createVehicle[(_vInfo select 2),[0,0,999],[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _sp,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	sleep 0.6;
} else {
	_vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_vehicle setPos _sp;
	_vehicle setVectorUp (surfaceNormal _sp);
	_vehicle setDir _dir;
	sleep 0.6;
};

// Verwahrstelle
_repcount = SEL(_vInfo,11);
_tuv	  = SEL(_vInfo,10);

_type = switch(true) do
{
	case ((SEL(_vInfo,2)) in M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_bohrt","allVeh")): {"BOHR"};
	case ((SEL(_vInfo,2)) in M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,"civ_cargo","allVeh")): {"CARGO"};

	case (_vehicle isKindOf "Car"): {"Car"};
	case (_vehicle isKindOf "Air"): {"Air"};
	case (_vehicle isKindOf "Ship"): {"Ship"};
};

//_query = format["UPDATE vehicles SET active='1', type='%3' WHERE pid='%1' AND id='%2'",_pid,_vid,_type];
if(		 tuv_da && _type isEqualTo "Car") then {_tuv = _tuv + 1;};
if(flusi_tuv_da && _type isEqualTo "Air") then {_tuv = _tuv + 1;};
if( _type isEqualTo "BOHR" ) then {[_vehicle,"dbInfo",[(_vInfo select 4),(_vInfo select 7),_name,(_vInfo select 0)],false] remoteExec ["SKY_fnc_setObjVar",HC_id];};


_query = format["vehicleUpdateActive:1:%1:%2:%3:%4:%5",_pid,_vid,_type,_repcount,_tuv];
[_query,false] spawn DB_fnc_asyncCall;
// Verwahrstelle Ende
/*
	diag_log "╔════════════════════════════════╗";
	diag_log "║------------------ Client Query Request -----------------";
	diag_log "╠════════════════════════════════╣";
	diag_log "║------------- Bohrturm Respawn DB LOG ------------";
	diag_log format["║ QUERY: %1",_query];
	diag_log format["║ _vid: %1",_vid];
	diag_log format["║ _pid: %1",_pid];
	diag_log format["║ (_vInfo select 0): %1",(_vInfo select 0)];


	diag_log "╚════════════════════════════════╝";
*/

//Send keys over the network.
[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain",_unit];
[_pid,_side,_vehicle,1] call TON_fnc_keyManagement;
_vehicle lock 2;
//Reskin the vehicle 
[_vehicle,_vInfo select 8] remoteExec ["life_fnc_colorVehicle",_unit];
_vehicle SVAR["vehicle_info_owners",[[_pid,_name]],true];
_vehicle SVAR["dbInfo",[(_vInfo select 4),_vInfo select 7]];


_vehicle SVAR["tuv",[_tuv,_repcount],true];
//_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

//_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"]; //Obsolete function?
[_vehicle] call life_fnc_clearVehicleAmmo;

//Sets of animations
if(EQUAL(SEL(_vInfo,1),"civ") && EQUAL(SEL(_vInfo,2),"B_Heli_Light_01_F") && !(EQUAL(SEL(_vInfo,8),13))) then {
	[_vehicle,"civ_littlebird",true] remoteExec ["life_fnc_vehicleAnimate",_vehicle];
};

if(EQUAL(SEL(_vInfo,1),"cop") /*&& (SEL(_vInfo,2)) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F"]*/) then {
	[_vehicle,"cop_offroad",true] remoteExec ["life_fnc_vehicleAnimate",_vehicle];
};

if(EQUAL(SEL(_vInfo,1),"med") /*&& EQUAL(SEL(_vInfo,2),"C_Offroad_01_F")*/) then {
	[_vehicle,"med_offroad",true] remoteExec ["life_fnc_vehicleAnimate",_vehicle];
};

if(EQUAL(SEL(_vInfo,1),"adac")) then{
	[_vehicle,"adac_offroad",true] remoteExec ["life_fnc_vehicleAnimate",_vehicle];
	_vehicle setFuelCargo 1;
};

[1,"Dein Fahrzeug steht bereit!"] remoteExec ["life_fnc_broadcast",_unit];
serv_sv_use deleteAt _servIndex;
//_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"]; //Obsolete function?
[_vehicle,SEL(_vInfo,9)] remoteExec ["life_fnc_setHit",_vehicle];
[_vehicle] spawn {
	_vehicle = SEL(_this,0);
	sleep 40;
	_vehicle allowDamage true;
};





