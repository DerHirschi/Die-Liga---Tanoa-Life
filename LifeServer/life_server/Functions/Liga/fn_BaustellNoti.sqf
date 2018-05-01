#include "\life_server\Liga_Macros.hpp"
/*
╔══════════════════════════════════════════════════╗
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
╠══════════════════════════════════════════════════╝
║ File: fn_BaustellNoti.sqf
║ Author: Hirschi Liga-Life
║
║ Description:
║ Schick an alle den Stand der Baustelle
╚══════════════════════════════════════════════════╝
*/
//private ["_row","_msg","_it_0","_it_1","_it_2","_it_3","_query","_queryResult"];

	_query = format["BaustGET"];
	
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	_row = call compile format["%1",_queryResult]; 	

_it_0 = _row select 0;
_it_1 = _row select 1;
_it_2 = _row select 2;
_it_3 = _row select 3;

_msg = format["<t size='1.7'><t color='#33CC00'> Community Baustelle </t></t><br/><br/><t size='1.15'>Die Liga Community Baustelle wurde vor kurzem beliefert..</t><br/><br/><t size='1'><t color='#E5CC00'>Spanplatten %1 von 40.000 Stk.</t></t><br/><br/><t size='1'><t color='#E5CC00'>Zement %2 von 25.000 Stk. </t></t><br/><br/><t size='1'><t color='#E5CC00'>Glass %3 von 20.000 Stk.</t></t><br/><br/><t size='1'><t color='#E5CC00'>Stahltraeger %4 von 20.000 Stk.</t></t><br/><br/><t size='1.15'> wurden schon geliefert ....</t>  ", _it_0 select 1,  _it_1 select 1,  _it_2 select 1, _it_3 select 1];

[5,_msg] remoteExec ["life_fnc_broadcast",RCLIENT];