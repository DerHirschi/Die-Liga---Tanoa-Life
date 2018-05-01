#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
if(life_atmcash < 5000 ) exitWith { hint " Du kannst dir das nicht leisten Kumpel !!!";};

disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Establishing connection..."];

ctrlShow[2405,false];
	
life_atmcash = life_atmcash - 5000;


[player] remoteExec ["life_fnc_wantedFetch",RSERV];