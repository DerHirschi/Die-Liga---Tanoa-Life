#include "..\..\Liga_script_macros.hpp"
/*
File : fn_medicShowLicense.sqf
Create : Black Lagoon
Edit : Noldy and CYNX
Link : http://www.global-gamer.com/home/wbb/index.php/Thread/509-Turorial-Polizeimarke-zeigen/
Beschreibung : Fuegt einen 'Polizeiausweis' hinzu, den man ueber scrollen Zivilisten zeigen kann
*/
private["_target","_message","_rang"];
_target = cursorTarget;
if(playerSide != independent || !liga_lrk_on) exitWith
{
    hint "Du bist kein Arzt!";
};
if( isNull _target) 			exitWith {};
if( !(_target isKindOf "Man") ) exitWith {};
if( !(alive _target) ) 			exitWith {};

switch ( call life_mediclevel ) do
{
    case 1: { _rang = "Rettungshelfer"; };
    case 2: { _rang = "Rettungssanitäter"; };
    case 3: { _rang = "Rettungsassistent"; };
    case 4: { _rang = "Notarzt"; };
    case 5: { _rang = "Assistenzarzt"; };
	case 6: { _rang = "Oberarzt"; };
	case 7: { _rang = "Stellv. DRF-DRK Leiter"; };
	case 8: { _rang = "LRK-DRK Leiter"; };
    default {_rank =  "Error";};
};
_message = format["<img size='10' color='#FFFFFF' image='textures\ausweis_Med.jpg'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>Krankenhaus Chernarus</t>", name player, _rang];

[player,_message] remoteExecCall ["life_fnc_medicLicenseShown",_target];