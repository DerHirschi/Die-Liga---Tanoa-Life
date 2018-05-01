#include "..\..\Liga_script_macros.hpp"
/*
File : fn_copShowLicense.sqf
Create : Black Lagoon
edit: Hirschi - Die Liga
Edit : Noldy and CYNX
Link : http://www.global-gamer.com/home/wbb/index.php/Thread/509-Turorial-Polizeimarke-zeigen/

Beschreibung : Fuegt einen 'Polizeiausweis' hinzu, den man ueber scrollen Zivilisten zeigen kann
*/

private["_target", "_message","_rang"];

_target = cursorTarget;

if(playerSide != east) exitWith
{
	hint "Du bist kein ALAC-Mitarbeiter!";
};

if( isNull _target) 			exitWith {};
if( !(_target isKindOf "Man") ) exitWith {};
if( !(alive _target) ) 			exitWith {};


switch ( call life_adaclevel ) do
{
	case 1: { _rang = "AZUBI"; };
	case 2: { _rang = "ALAC Mechaniker"; };
	case 3: { _rang = "ALAC Meister"; };
	case 4: { _rang = "ALAC Werkstattleiter"; };
	case 5: { _rang = "ALAC Techniker FH"; };
	case 6: { _rang = "ALAC stelv. Leitung"; };
	case 7: { _rang = "ALAC Leitung"; };
	default {_rang =  "Error";};
};

_message = format["<img size='10' color='#FFFFFF' image='textures\ADAC\ausweis_alac.jpg'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><t size='1'>Liga Pannenhilfe</t>", name player, _rang];

[player,_message] remoteExecCall ["life_fnc_ADACIDShown",_target];