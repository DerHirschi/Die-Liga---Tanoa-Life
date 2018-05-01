#include "..\..\Liga_script_macros.hpp"
/*
	0 = private message
	1 = police message
	2 = message to admin
	3 = message from admin
	4 = admin message to all
	5 = Medic
	6 = ADAC
	
	8 = New Player
*/
if(isServer)exitWith{};
	private["_msg","_from", "_type","_wart","_player"];
	_msg = SEL(_this,0);
	_from = SEL(_this,1);
	_type = SEL(_this,2);
	_player = [_this,3,objNull,[objNull]] call BIS_fnc_param;
	_wart = [_this,4,0,[0]] call BIS_fnc_param;
	if(EQUAL(_from,"")) exitWith {};
	if (isNil "life_adminlevel") exitWith {};
	switch (_type) do
	{
		case 0 :
		{
			private["_message"];
			_message = format[">>>MESSAGE Von %1: %2",_from,_msg];
			hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];
			["TextMessage",[format["Du hast eine Nachricht von %1 erhalten!!",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};		
		case 1 :
		{
			if(side player != west) exitWith {};
			private["_message"];
			_message = format["Notruf von %1: %2",_from,_msg];
			hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Neuer Notruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>alle Beamte<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];
			["PoliceDispatch",[format["Ein Notruf von: %1",_from]]] call bis_fnc_showNotification;
			systemChat _message;
			[_player]spawn life_fnc_NotMarker;
		};		
		case 2 :
		{
			if(__GETC__(life_adminlevel) < 1 ) exitWith {};
			private["_message"];
			_message = format["???ADMIN ANFRAGE VON %1: %2",_from,_msg];
			hint parseText format ["<t color='#ffcefe'><t size='2'><t align='center'>Admin Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>alle Admins<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];
			["AdminDispatch",[format["%1 Ruf verzweifelt nach einen Admin..",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};		
		case 3 :
		{
			private["_message"];
			_message = format["!!!ADMIN NACHRICHT!!!: %1",_msg];
		//	_admin = format["Sent by admin: %1", _from];
			hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Vom: <t color='#ffffff'>Admin<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg];
			["AdminMessage",["Du hast eine Admin Nachricht erhalten!"]] call bis_fnc_showNotification;
			systemChat _message;
		//	if(__GETC__(life_adminlevel) >= 1) then {systemChat _admin;};
		};		
		case 4 :
		{
			private["_message"];
			_message = format["ADMIN NACHRICHT AN ALLE SPIELER: %1",_msg];
		//	_admin = format["Nachricht vom Admin Team", _from];
			hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Vom: <t color='#ffffff'>Liga Admin Team<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg];
			["AdminMessage",["Du hast eine Admin Nachricht erhalten!"]] call bis_fnc_showNotification;
			systemChat _message;
		//	if(life_adminlevel >= 1)  then {systemChat _admin;};
		};		
		case 5: {
			if(EQUAL(side player,civilian)) exitWith {};
			private["_message"];
			_message = format["!!!Notruf: %1",_msg];
			hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Notruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>You<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];
			["TextMessage",[format["Notruf von %1",_from]]] call bis_fnc_showNotification;
			[_player]spawn life_fnc_NotMarker;
		};	
		case 6: {
			private["_message"];
			_message = format["!!!ALAC RUF: %1",_msg];
			hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>ALAC Anfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];
			["TextMessage",[format["ALAC Anfrage von %1",_from]]] call bis_fnc_showNotification;
			[_player]spawn life_fnc_NotMarker;
		}; 
		case 7: {
			if(EQUAL(side player,civilian)) exitWith {};
			//private["_message"];
			//_message = format["Neuer Notruf in Warteschlange"];
			hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Voice NOTRUF<br/><br/><t color='#33CC33'><t align='left'><t size='1'> <t color='#ffffff'><br/><t color='#33CC33'>Warteschlange: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>",(_wart + 1)];
			["TextMessage",[format["Warteschlange: %1",(_wart + 1)]]] call bis_fnc_showNotification;
			[_player]spawn life_fnc_NotMarker;
		};
		
		case 8 :
		{
		
			if(__GETC__(life_adminlevel) < 1 ) exitWith {};
			hint parseText format ["<t color='#04FF00'><t size='2.2'><t align='center'>Neuer Spieler<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>alle Admins (Info)<br/><t color='#33CC33'>Neuer Spieler: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Neuer Spieler auf der Insel:<br/><br/><t color='#ffffff'>UID: %2<br/>Steam Name: %3<br/>Name: %4",_from,(_msg select 0),(_msg select 1),(_msg select 2)];
		//	["Neuer Spieler",[format["%1 ist neu auf der Insel !!! ",_from]]] call bis_fnc_showNotification;
			systemChat ">>>>>>> Admin Info <<<<<<";
			systemChat ">>>>> Neuer Spieler <<<<<";
			systemChat format ["UID: %1",(_msg select 0)];
			systemChat format ["SteamName: %1",(_msg select 1)];
			systemChat format ["Name: %1",(_msg select 2)];
			systemChat ">>>>> Neuer Spieler <<<<<";
		};	
		/*
		case 9 :
		{
		
			if(__GETC__(life_adminlevel) < 1 ) exitWith {};
			hint parseText format ["<t color='#FF0040'><t size='2.2'><t align='center'>Bug-User<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>alle Admins (Achtung)!!!<br/><t color='#33CC33'>Neuer Spieler: <t color='#ffffff'>%1<br/><br/><t color='#F5DA81'>I-Inventar Zugriffsversuch .. Mc Chicken gibts an der Admin Base<br/><br/><t color='#ffffff'>UID: %2<br/>Steam Name: %3<br/>Name: %4",_from,(_msg select 0),(_msg select 1)];
		//	["Neuer Spieler",[format["%1 ist neu auf der Insel !!! ",_from]]] call bis_fnc_showNotification;
			systemChat ">>>>>>> Admin Warnung <<<<<<";
			systemChat ">>>>>>>>> Bug User  <<<<<<<<<";
			systemChat format ["UID: %1",(_msg select 0)];
			systemChat format ["SteamName: %1",(_msg select 1)];
			systemChat format ["Name: %1",_from)];
			systemChat ">>>>>>>>> Bug User  <<<<<<<<<";
		};	
		*/
	};
