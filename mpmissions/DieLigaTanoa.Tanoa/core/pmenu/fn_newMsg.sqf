#include "..\..\Liga_script_macros.hpp"
/*
	
	file: fn_newMsg.sqf
	Author: Silex
	
*/

private["_to","_type","_playerData","_msg"];
disableSerialization;

_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;

switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Nachricht an: %1",name life_smartphoneTarget]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		
		if(isNUll SEL(life_smartphoneTarget,2)) exitWith {hint format["Keine Person ausgwählt!"];};
		
		if(EQUAL(_msg,"")) exitWith {hint "Du musst eine Nachricht eingeben.";};
		
		[SEL(life_smartphoneTarget,2),_msg,player,0] remoteExecCall ["TON_fnc_handleMessages",RSERV];
		
		hint format["Du hast eine Nachricht an %1 gesendet: %2",(SEL(life_smartphoneTarget,0)),_msg];	

	};
	//copmessage
	case 2:
	{
		if(({side _x isEqualTo west} count playableUnits) isEqualTo 0) exitWith {hint format["Das Liga-PD ist derzeit nicht zu erreichen. Bitte versuchen Sie es später nochmal."];};
		
		if(_msg isEqualTo "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[ObjNull,_msg,player,1] remoteExecCall ["TON_fnc_handleMessages",RSERV];
		_to = "An das Liga-PD";
		hint format["Du hast eine Nachricht an %1 gesendet %2",_to,_msg];

	};
	//msgadmin
	case 3:
	{
		
		if(_msg isEqualTo "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[ObjNull,_msg,player,2] remoteExecCall ["TON_fnc_handleMessages",RSERV];
		_to = "An Admin";
		hint format["Du hast eine Nachricht an %1 gesendet : %2",_to,_msg];

	};
	//emsrequest
	case 4:
	{
		if(({side _x isEqualTo independent} count playableUnits) isEqualTo 0) exitWith {hint format["Zurzeit ist kein Arzt im Dienst. Bitte probiere es später nochmal."];};
		
		if(_msg isEqualTo "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[ObjNull,_msg,player,3] remoteExecCall ["TON_fnc_handleMessages",RSERV];
		hint format["Du hast den Notartzt gerufen.",_msg];

	};
	//adminToPerson
	case 5:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Du bist kein Admin!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Keine Person ausgwählt!"];};
		if(_msg isEqualTo "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[1,"Admin Nachricht an",name life_smartphoneTarget,_msg]call life_fnc_toSt;
		[life_smartphoneTarget,_msg,player,4] remoteExecCall ["TON_fnc_handleMessages",RSERV];
		hint format["Admin Nachricht gesendet an: %1 - Message: %2",name life_smartphoneTarget,_msg];
		
	};
	//emergencyloading
	case 6:
	{
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call life_adminlevel) < 1) exitWith {hint "You are not an admin!";};
		if(_msg isEqualTo "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[ObjNull,_msg,player,5] remoteExecCall ["TON_fnc_handleMessages",RSERV];
		
		[1,"Admin Nachricht an","ALLE",_msg]call life_fnc_toSt;
		hint format["Admin Nachricht an alle: %1",_msg];
		
	};
	//adacrequest
	case 8:
	{
		if(({side _x isEqualTo east} count playableUnits) isEqualTo 0) exitWith {hint format["Zurzeit ist kein ALAC im Dienst. Bitte probiere es später nochmal."];};
		
		if(_msg isEqualTo "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[ObjNull,_msg,player,6] remoteExecCall ["TON_fnc_handleMessages",RSERV];
		hint format["Notruf wurde abgesetzt.",_msg];

	};
	case 9:
	{
		
		if(SEL(life_smartphoneTarget,0) isEqualTo "") exitWith {hint format["Keine Person ausgwählt!"];};
		
		if(_msg isEqualTo "") exitWith {hint "Du musst eine Nachricht eingeben.";};
		[life_smartphoneTarget,_msg,player,7] remoteExecCall ["TON_fnc_handleMessages",RSERV];
		hint format["Du hast eine Offline Nachricht an %1 gesendet: %2",(SEL(life_smartphoneTarget,0)),_msg];	

	};	
};