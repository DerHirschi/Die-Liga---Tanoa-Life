#include "..\..\Liga_script_macros.hpp"

/*
File: fn_sendChannel.sqf
Author: alleskapot & Lifted
Thanks again for all the help alleskapot!
Description:
Ermöglicht senden bzw. die Abfrage des Geschriebenen.
*/
private["_message"];
disableSerialization;
waitUntil {!isnull (findDisplay 9000)};
if(__GETC__(life_adminlevel) < 3 || (life_blacklisted isEqualTo 0)) then {if (life_cash <= 6000 ) exitWith { systemChat "Du brauchst 6000€ um eine Nachricht zu senden!"; };}; 

//if (playerSide != civilian ) exitWith { systemChat "Du musst ein Zivilist sein!"; };
if(__GETC__(life_adminlevel) < 3 || (life_blacklisted isEqualTo 0)) then {life_cash = life_cash - 6000;};
_message = ctrlText 9001;
[3,format ["%1 sendete folgende Nachricht an Alle: %2",name player,_message]] remoteExec ["life_fnc_broadcast",RCLIENT];
life_channel_send = false;
[] spawn
{
sleep 600;
life_channel_send = true;
};