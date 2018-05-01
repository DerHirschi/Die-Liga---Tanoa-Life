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
║	File: fn_ligaFass.sqf
║	Author: Hirschi Liga-Life	
║	Vorlage: OLLI aka Hauklotz
╚══════════════════════════════════════════════════╝
*/

private["_position","_fass"];
closeDialog 0;
_fass = "Land_WaterBarrel_F" createVehicle [0,0,0];
_fass attachTo[player,[0,5.5,0.2]];
_fass allowDamage true;
_fass enableSimulation true;
_fass setDir 90;
_fass setVariable["item","fassDeployed",true];
life_action_fassDeploy = player addAction["<t color='#00FF00'>Fass aufstellen</t>",{if(!isNull life_fass) then {detach life_fass; life_fass = ObjNull;}; player removeAction life_action_fassDeploy; life_action_fassDeploy = nil;},"",999,false,false,"",'!isNull life_fass'];
life_fass = _fass;
waitUntil {isNull life_fass};
if(!isNil "life_action_fassDeploy") then {player removeAction life_action_fassDeploy;};
if(isNull _fass) exitWith {life_fass = ObjNull;};
_fass setPos [(getPos _fass select 0),(getPos _fass select 1),0];
_fass setVariable["liga_maischPro",0,true];
_fass setVariable["Trunk",[[],0],true];
_fass allowDamage true;
_fass enableSimulation true;
_fass setVariable["destpro",false,true] ;		