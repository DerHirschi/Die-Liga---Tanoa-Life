#include "..\Liga_script_macros.hpp"

/*
File: welcome.sqf
Author: ZedBuster
Edited by Hirschi Liga-Life
Link: opendayz.net/threads/dayz-welcome-message-credits-style.13071/
Description:
Creates an intro on the bottom-right hand corner of the screen.
*/

_onScreenTime = 2.8; //Zeit wie lange ein Text angezeigt wird
cutText["","BLACK FADED"];

player setPos [6903.71,7390.25,0.00143862];
cutText["","BLACK FADED"];
_role1 = "Du hast es geschafft ...."; //In Gelb
_role1names = [""]; //In Weiß
_role2 = "Endlich angekommen ...";
_role2names = [""]; 
_role3 = "Dir zeigt sich nach einer langen und erschwerlichen Reise endlich das lang ersehnte Ziel am Horizont";
_role3names = [""]; 
{
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='1.20' color='#097A1E' align='center'>%1<br /></t>", _memberFunction]; //Changes colours
	_finalText = _finalText + "<t size='1.10' color='#FFFFFF' align='center'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5) + 0.7;
	cutText["","BLACK FADED"];
	[
		_finalText,
		[safezoneX + safezoneW - 1.5,0.70], //DEFAULT: 0.5,0.35
		[safezoneY + safezoneH - 1,0.7], //DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5
	] call BIS_fnc_dynamicText;
	cutText["","BLACK FADED"];
	sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
	[_role1, _role1names]
	
];
cutText["","BLACK FADED"];
{
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='1.20' color='#097A1E' align='center'>%1<br /></t>", _memberFunction]; //Changes colours
	_finalText = _finalText + "<t size='1.10' color='#FFFFFF' align='center'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5) + 0.7;
	cutText["","BLACK FADED"];
	[
		_finalText,
		[safezoneX + safezoneW - 1.5,0.70], //DEFAULT: 0.5,0.35
		[safezoneY + safezoneH - 1,0.7], //DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5
	] call BIS_fnc_dynamicText;
	cutText["","BLACK FADED"];
	sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
	
	[_role2, _role2names]
];

{
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='1.20' color='#097A1E' align='center'>%1<br /></t>", _memberFunction]; //Changes colours
	_finalText = _finalText + "<t size='1.10' color='#FFFFFF' align='center'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5) + 4 ;
	cutText["","BLACK FADED"];
	[
		_finalText,
		[safezoneX + safezoneW - 1.5,0.70], //DEFAULT: 0.5,0.35
		[safezoneY + safezoneH - 1.1,0.7], //DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5
	] call BIS_fnc_dynamicText;
	cutText["","BLACK FADED"];
	sleep (_onScreenTime);
} forEach [
//The list below should have exactly the same amount of roles as the list above
[_role3, _role3names]
];
cutText["","BLACK FADED"];
	createDialog "liga_disp";
	playSound "start";

	0 cutFadeOut 3;
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [100];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 4;  
	uisleep 5;
	
	//[] call life_fnc_hudSetup;
	//[] spawn life_fnc_survival;
	uiSleep 3;
	[] call life_fnc_hudSetup;
	