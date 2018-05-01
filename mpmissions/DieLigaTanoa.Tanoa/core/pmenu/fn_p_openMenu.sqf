#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
{player reveal _x;} foreach (player nearObjects 30);
disableSerialization;
_dialog 		= findDisplay 2001;
if(liga_cop_on) then {
	ctrlShow[2011,false];
	(_dialog displayCtrl 9800) ctrlSetText "Wanted +";
	(_dialog displayCtrl 9800) buttonSetAction " closeDialog 0; createDialog ""life_wantedadd2"";";

}else{
	ctrlShow[2012,false];
	//ctrlShow[9800,false];
	(_dialog displayCtrl 9800) ctrlSetText "Lotto";
	(_dialog displayCtrl 9800) buttonSetAction "closeDialog 0;	[player] remoteExec ['TON_fnc_LottoPlInfo',2];";

};

if(__GETC__(life_adminlevel) < 2) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};

[] call life_fnc_p_updateMenu;

if(__GETC__(life_adminlevel) < 2) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};