#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*
	Author: Hirschi .. bla bla
	HC Remote Steuerung von Client kommend
*/
private ["_mode"];
PAR(_ar,0,[],[[]]);
//RPT("ARR",_ar);
//PARVAR(_mode,_ar,0,-1,[0]);
_mode = [_ar,0,-1,[0]] call BIS_fnc_param;
//RPT("_mode",_mode);
//RPT("TEEE",_ar);
if(EQUAL(_mode,-1))exitWith{SYSLOG(SKYID,"ERROR","HC Client Remote System","fn_clrem","Mode ungueltig");};

SETMODEX(_mode,1,[_ar]spawn SKY_fnc_brettDBsys;);		// Brett DB System
SETMODEX(_mode,0,[_ar]spawn SKY_fnc_gewinnwar ;);		// Gewinnwarnung


if(_mode isEqualTo 2)exitWith {[7,_ar select 1,_ar select 2,_ar select 3,_ar select 4,_ar select 5]spawn SKY_fnc_DBlogSys;};
//SETMODEX(_mode,2,[_ar select 0,_ar select 1,_ar select 2,_ar select 3,_ar select 4,_ar select 5]spawn SKY_fnc_DBlogSys;);			// Display Log
