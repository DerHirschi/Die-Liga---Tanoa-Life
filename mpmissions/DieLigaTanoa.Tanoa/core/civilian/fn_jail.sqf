#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
//hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,10,[0]] call BIS_fnc_param;
player SVAR["restrained",false,true];
player SVAR["Escorting",false,true];
player SVAR["transporting",false,true];

titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPos ([12062.2,2449.35,0.00111842]);

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance ([12062.2,2449.35,0]) > 40) then
{
	player setPos ([12062.2,2449.35,0]);
};

[1] call life_fnc_removeLicenses;
if(lin_heru > 0) then {[false,"heroinu",lin_heru] call life_fnc_handleInv;};
if(lin_herp > 0) then {[false,"heroinp",lin_herp] call life_fnc_handleInv;};
if(lin_cok > 0) then {[false,"cocaine",lin_cok] call life_fnc_handleInv;};
if(lin_cokp > 0) then {[false,"cocainep",lin_cokp] call life_fnc_handleInv;};
if(lin_turt > 0) then {[false,"turtle",lin_turt] call life_fnc_handleInv;};
if(lin_cana > 0) then {[false,"cannabis",lin_cana] call life_fnc_handleInv;};
if(lin_marj > 0) then {[false,"marijuana",lin_marj] call life_fnc_handleInv;};
if(lin_metu > 0) then {[false,"methu",lin_metu] call life_fnc_handleInv;};
if(lin_metp > 0) then {[false,"methp",lin_metp] call life_fnc_handleInv;};
if(lin_lsdu > 0) then {[false,"lsdu",lin_lsdu] call life_fnc_handleInv;};
if(lin_lsdp > 0) then {[false,"lsdp",lin_lsdp] call life_fnc_handleInv;};
life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

[player,_bad,_time] remoteExecCall ["life_fnc_jailSys",RSERV];
[5] call SOCK_fnc_updatePartial;