#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*
	╔═════════════════════════════════════════════════════╗
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░░░║
	║░░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░░░║
	║░░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░▀▀▀▀░░░█░░░█░░▀░░░░░▀░░░░░██░░░█░░░░░░░▀▀▀█▀▀▀░░░║
	║░░░█░░░░░░░█░░█░░░░▀░░░▀░░░░░░█░█░░█░░█▀▀▀░░░░█░░░░░░║
	║░░░░▀▀▀░░░░█▀▀░░░░░░▀░▀░░░▀▀░░█░░█░█░░█▀▀▀░░░░█░░░░░░║
	║░░░░░░░█░░░█░░█░░░░░░█░░░░░░░░█░░░██░░▀▀▀▀░░░░█░░░░░░║
	║░░░▀▀▀▀░░░░▀░░░▀░░░░░▀░░░░░░░░▀░░░░▀░░░░░░░░░░▀░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	╠═════════════════════════════════════════════════════╝
	║ File: fn_turmDOWN.sqf
	║ Author: Hirschi - Die Liga
	╚═════════════════════════════════════════════════════╝
	
	[	
		[x.y.z],							|	Pos				|0	|0
		0,									|	DIR				|1	|1
		0,									|	RestartCount	|2	|2
		[[["sig",8],["oilu",7]],66],	|	Trunk Tank 1	|3	|3
		[[["sig",8],["oilu",7]],66],	|	Trunk Tank 2	|4	
		[[["sig",8],["oilu",7]],66],	|	Gerätehaus		|5	
		"7658554546466",					|	STEAM ID pid	|6	|4
		18,									|	Plate			|7	|5
		"Mas Tobias",						|	ProfilName		|8	|6
		8455								|	VID in DB vid	|9	|7
	]		
*/
private["_vehicle","_flagObj","_flagDir","_flagPos"];
_obj 	 = [_this,0,Objnull,[Objnull]	] call BIS_fnc_param;
_unit 	 = [_this,1,Objnull,[Objnull]	] call BIS_fnc_param;
_side 	 = civilian;
//RPT("TEST TURM DOWN","");
if(isNull _obj) exitWith {diag_log "ERROR : fn_turmDOWN.sqf .. NO _obj"; };
if!(_obj isKindOf "Land_Research_house_V1_F") exitWith {diag_log "ERROR : fn_turmDOWN.sqf .. falsches Objekt"; };

_slot 		= _obj GVAR ["turm_slot",""];
if(EQUAL(_slot,"")) exitWith {diag_log "ERROR : fn_turmDOWN.sqf .. Keine SLOT VAR";};

_turmData 	= profileNamespace GVAR [_slot,[]];
if(EQUAL(_turmData,[])) exitWith {diag_log "ERROR : fn_turmDOWN.sqf .. Keine Turm Daten";};

_objArr		= _obj GVAR ["turm_ObArr",[]];
if(EQUAL(_objArr,[])) exitWith {diag_log "ERROR : fn_turmDOWN.sqf .. Keine Obj Array";};

_pos 	=  SEL(_turmData,0);
_dir 	=  SEL(_turmData,1);
_pid 	=  SEL(_turmData,6);
_plate 	=  SEL(_turmData,7);
_name 	=  SEL(_turmData,8);
_vid 	=  SEL(_turmData,9);


[_obj,false] call LIGA_fnc_burnTurm;
/* lösche Turm */
{
	if(typeOf _x in ["Land_Research_house_V1_F","Land_Tank_rust_F"]) then {
		[_pid,_side,_x,2] remoteExecCall ["TON_fnc_keyManagement",RSERV];
		[_x] remoteExecCall ["life_fnc_addVehicle2Chain",_unit];
	};	
	deleteVehicle _x; 
}forEach _objArr;



uiSleep 13;
/* tausche Gerät */
_flagObj = _pos nearestObject "Land_Device_assembled_F"; 
if!(isNull _flagObj) then {
	_flagPos = getPos _flagObj;
	_flagDir = getDir _flagObj;
	deleteVehicle _flagObj;
};


_vehicle = "Land_Device_assembled_F" createVehicle [0,0,0];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
_vehicle allowDamage false;
_vehicle setPos _pos;
_vehicle setDir _dir;
sleep 0.6;

/* setze Variablen*/
[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain",_unit];
[_pid,_side,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];

//_vehicle lock 2;

_vehicle SVAR ["vehicle_info_owners",[[_pid,_name]],true];
_vehicle SVAR ["dbInfo",[_pid,_plate,_name,_vid]]; ////!!!!!!''''''' AUF SERVER SETZEN .. Bring hier nischt
[_vehicle,"dbInfo",[_pid,_plate,_name,_vid],false] remoteExecCall ["TON_fnc_setObjVar",RSERV];

_vehicle addEventHandler["Killed","_this remoteExec ['TON_fnc_vehicleDead',2];"];

/* lösche Slot - Daten */
profileNamespace SVAR [_slot, nil];
profileNamespace SVAR [(_slot + "_steu"),nil];
profileNamespace SVAR [(_slot + "_ObjArr"),nil];

_vehicle allowDamage true;
SYSLOG(SKYID,"Turm abgebaut",_slot,_turmData,"");
