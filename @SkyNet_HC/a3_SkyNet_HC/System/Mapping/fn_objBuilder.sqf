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

private["_arr","_timeStamp"];
_timeStamp = diag_tickTime;

params [
	["_pos",[],[[]]],
	["_obswitch","",[""]]
];

if(EQUAL(_obswitch,"")) exitWith {diag_log "ERROR : OBJ BULIDER .. NO ENTERY"; SYSLOG(SKYID,"ERROR : OBJ BULIDER .. NO ENTERY","","","");};


_arr = [];
_obj_arr = SKYMAPFILE(getArray,"Bohrturm_ob",_obswitch);

//  //  AttachTo Mode //  // 
// Create
{
	_obj = SEL(_x,0) createVehicle [0,0,0];
	//_obj setPos _pos;
	//_obj setDir ((_obj_arr select _forEachIndex) select 3);
 	
	_arr set [_forEachIndex,_obj];
	
}forEach _obj_arr;



/*
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
*/
//Godmodfe usw

{
	if(  ((_obj_arr select _forEachIndex) select 4)   isEqualTo  1) then {
		_x allowDamage false;
		//_x enableSimulation false;
		//[_x,false] remoteExecCall ["TON_fnc_simDisable",RSERV];
		diag_log format ["║ %1 Objekt Sim off",_x];
		

	};
	
}forEach _arr;	


diag_log format ["║ %1 Sekunden Laufzeit",(diag_tickTime) - _timeStamp];

_arr;



