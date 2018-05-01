#include "..\..\Liga_script_macros.hpp"
if (EQUAL(joinmode,0)) then {    
    hint "Eine Anfrage wurde an den Server gesendet, bitte warte einen Moment";    
	[getPlayerUID player,life_cash] remoteExecCall ["TON_fnc_paintball",RSERV];
    joinmode = 1;
} else {
    hint "Du bist der Lobby bereits beigetreten, versuche es später noch einmal!";
};