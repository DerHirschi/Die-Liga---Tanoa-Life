#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi - Die Liga
	Blahhhhhhh 
*/

disableSerialization;
private ["_ui","_progress","_pgText","_cP"];
_vendor = position player;
if(airdrop_zomgoingon) exitWith {hint "Die Airdrop kann nur einmal pro Stunde gerufen werden ..."; };


5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace GVAR "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Airdrop wird gerufen (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;
[] remoteExec ["fncPopRem",HC_id];
	while{true} do
	{
		sleep  1.8; 
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Airdrop wird gerufen (%1%2)...",round(_cP * 100),"%"];
		if(_cP >= 1) exitWith {};
		if(player distance2D  _vendor > 8) exitWith {hint "Du musst innerhalb von 8 m bleiben."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	};
	
if(player distance2D  _vendor > 8) exitWith {hint "Du musst innerhalb von 8 m bleiben."; 5 cutText ["","PLAIN"]; life_is_processing = false;};



[position player] remoteExec ["LIGA_fnc_generateAirdropZom",HC_id];

life_is_processing = false;
5 cutText ["","PLAIN"];

hint "Die Airdrop ist unterwegs..";