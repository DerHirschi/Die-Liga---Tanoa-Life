#include "..\..\Liga_script_macros.hpp"
/*
File : fn_copShowLicense.sqf
Create : Black Lagoon
Edit : Noldy and CYNX
Link : http://www.global-gamer.com/home/wbb/index.php/Thread/509-Turorial-Polizeimarke-zeigen/

Beschreibung : Fuegt einen 'Polizeiausweis' hinzu, den man ueber scrollen Zivilisten zeigen kann
*/

private["_target", "_message","_rang"];

_target = cursorTarget;

if(playerSide != west || !liga_cop_on) exitWith
{
	hint "Du bist kein Cop!";
};

if( isNull _target) 			exitWith {};
if( !(_target isKindOf "Man") ) exitWith {};
if( !(alive _target) ) 			exitWith {};



switch ( call life_coplevel ) do
{
	case 1: { _rang = "Recruit"; };
	case 2: { _rang = "Police Officer"; };
	case 3: { _rang = "Sergeant"; };
	case 4: { _rang = "Lieutenant"; };
	case 5: { _rang = "Captain"; };
	case 6: { _rang = "Deputy Inspector"; };
	case 7: { _rang = "Inspector"; };
	case 8: { _rang = "Deputy Chief"; };
	case 9: { _rang = "Assistent Chief"; };
	case 10: { _rang = "Bureau Chief"; };
	case 11: { _rang = "Chief of Department"; };
	default {_rank =  "Error";};
};

_message = format["<img size='10' color='#FFFFFF' image='textures\ausweis_cop.jpg'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/>", name player, _rang];

[player,_message] remoteExecCall ["life_fnc_copLicenseShown",_target];