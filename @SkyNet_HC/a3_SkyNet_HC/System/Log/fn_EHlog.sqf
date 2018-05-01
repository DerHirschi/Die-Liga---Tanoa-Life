#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*
╔══════════════════════════════════════════════════╗
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
║░░▀▀▀▀░░░█░░░█░░▀░░░░░▀░░░░░██░░░█░░░░░░░░▀▀▀█▀▀▀░║
║░█░░░░░░░█░░█░░░░▀░░░▀░░░░░░█░█░░█░░█▀▀▀░░░░░█░░░░║
║░░▀▀▀░░░░█▀▀░░░░░░▀░▀░░░▀▀░░█░░█░█░░█▀▀▀░░░░░█░░░░║
║░░░░░█░░░█░░█░░░░░░█░░░░░░░░█░░░██░░▀▀▀▀░░░░░█░░░░║
║░▀▀▀▀░░░░▀░░░▀░░░░░▀░░░░░░░░▀░░░░▀░░░░░░░░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
╠══════════════════════════════════════════════════╝
║ File: fn_EHlog.sqf
║ Author: Hirschi Liga-Life
╠══════════════════════════════════════════════════╝
║ Mode
║ 0 = life_fnc_MP_packet
║ 1 = BIS_fnc_MP_packet
╚══════════════════════════════════════════════════╝
*/

private ["_fn_countAr"];

if(DEB)then{diag_log format ["║ >>>> SKY-NET Debug EHlog :%1",(_this select 0)];};

_fn_countAr = {
	private ["_ar"];
	
	_ar = [_this,0,[],[[]]] call bis_fnc_param;;
	_co = (count _ar);
	if(DEB)then{diag_log format ["║ >>>> SKY-NET Count SKY_EH_LogAr01  :%1",_co];};	
	if ( _co >= LOGARSIZE) then {
		if(DEB)then{diag_log "║ >>>> SKY-NET Count2 SKY_EH_LogAr01  ";};	
		[_ar,1]call SKY_fnc_LogOut; 
		true;
	}else{
		false;
	};	
	
};

_functionName =	[(_this select 0),2,"",[""]] call bis_fnc_param;
_var1 =[_this,0,[],[[]]] call bis_fnc_param;

_mode = _this select 1;

switch (_mode) do {
	case 0:{ 
		SKY_EH_LogAr01 pushBack [_functionName,_var1]; 
		if(([SKY_EH_LogAr01]call _fn_countAr)) then {SKY_EH_LogAr01 = [];}; };
	//case 1:{ if (([(SKY_EH_LogAr02 pushBack [EVHAvar1,_functionName,(_this select 0)])]call _fn_countAr)) then {SKY_EH_LogAr02 = [];}; };
		
};


