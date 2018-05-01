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
	║ File: fn_objBuilder.sqf
	║ Author: Hirschi - Die Liga
	╚═════════════════════════════════════════════════════╝
	
	Bohrturm = "BT_1"
*/

private["_timeStamp"];
_timeStamp = diag_tickTime;

params [
	["_arr",[],[[]]],
	["_obswitch","",[""]],
	["_pos",[],[[]]],
	["_dir",0,[0]]
];

if(EQUAL(_obswitch,"")) exitWith {diag_log "ERROR : OBJ BULIDER .. NO ENTERY"; SYSLOG(SKYID,"ERROR : OBJ BULIDER .. NO ENTERY","","","");};



_obj_arr = SKYMAPFILE(getArray,"Bohrturm_ob",_obswitch);

//_obj setPos _pos;
//SEL(_arr,0) setVectorUp [0,0,1];
//SEL(_arr,0) setPos _pos;
//SEL(_arr,0) setDir (_dir + 90);
//SEL(_arr,0) setVectorUp [0,0,1];

// Attatch To
{
	if!(EQUAL(_forEachIndex,0)) then {
		_x attachTo [(_arr select ((_obj_arr select _forEachIndex) select 1)),((_obj_arr select _forEachIndex) select 2)];
		_x setDir ((_obj_arr select _forEachIndex) select 3);
		
	};
}forEach _arr;

diag_log format ["║ %1 Sekunden Laufzeit",(diag_tickTime) - _timeStamp];
//uiSleep 10;
_timeStamp = diag_tickTime;

//Godmodfe usw
/*
{
	if(  ((_obj_arr select _forEachIndex) select 4)   isEqualTo  1) then {
		_x allowDamage false;
		//_x enableSimulation false;
		//[_x,false] remoteExecCall ["TON_fnc_simDisable",RSERV];
		diag_log format ["║ %1 Objekt Sim off",_x];
		

	};
	
}forEach _arr;	
*/

diag_log format ["║ %1 Sekunden Laufzeit",(diag_tickTime) - _timeStamp];

_arr;



