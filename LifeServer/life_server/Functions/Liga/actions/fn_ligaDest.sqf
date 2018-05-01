/*
╔══════════════════════════════════════════════════╗
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
╠══════════════════════════════════════════════════╝
║	File: fn_ligaDest.sqf
║	Author: Hirschi Liga-Life	
╚══════════════════════════════════════════════════╝
*/
private["_dest","_pos","_player","_id","_pos"];

_player = _this select 0;
_id = _this select 1;
_pos = _this select 2;
_destOb_ar = [];
_dat_obj = ObjNull;

closeDialog 0;
_dest = [2] call TON_fnc_ligaDestObj;
_dest attachTo[_player,[0,5.5,0.2]];
_dest allowDamage true;
_dest enableSimulation true;
_dest setDir 90;
_dest setVariable["item","destDeployed",true];

[0,_dest] remoteExec ["life_fnc_ligaDesAdAc",_id];


life_dest = _dest;

waitUntil {isNull life_dest};

if(isNull _dest) exitWith {life_dest = ObjNull; _id publicVariableClient "life_dest";};
_pos = getPos _dest;
_dir = getDir _dest;

[0,_pos] call TON_fnc_ligaDestObj;
sleep 0.3;
_dest = [3] call TON_fnc_ligaDestObj;

_dest setPos [(_pos select 0),(_pos select 1),0];
_dest setDir _dir;
sleep 1;
		_dat_obj = nearestObjects[ getPos _dest,["Land_HeatPump_F"],3] select 0;
		_destOb_ar = _dat_obj getVariable ["lig_dest_ar",[]];	

					_destOb_ar select 0 removeAction 0;
					_destOb_ar select 2 removeAction 0;	
					_destOb_ar select 0 enableSimulationGlobal false;	
					_destOb_ar select 2 enableSimulationGlobal false;			