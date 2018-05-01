#include "..\Liga_script_macros.hpp"

/*
	Quelle : Global Gamer .... 
	Author: OLLI
	Veröffentlicher: VicesViper
	Edited by: Hirschi - Die Liga
	Rewrite by: Hirschi - Die Liga
*/
private ["_speed","_vehicle","_fnc_50blitz","_fnc_99blitz","_t","_tp"];

_vehicle 	= vehicle player;

_blitzer 	= [bl1_1_7,bl1_1_9,bl1_1_23];
_blitzer100 = [bl1,bl1_1,bl1_1_8,bl1_1_14,bl1_1_21];

if((typeOf _vehicle) in M_CONFIG(getArray,"LigaVehSetup","Fahrzeuge","warnpiep"))then { _tp = true; }else{_tp = false;};

_fnc_50blitz = {
	if!(EQUAL(side player,civilian)) exitWith{};
	private["_wantID"];
	_speed 	= _this;
	_wantID	= "";
	
	titleCut [" ","white in",1];
	switch(true) do
	{												
		case (_speed >= 55 and _speed < 70): 	{_wantID		= "500";};
		case (_speed >= 70 and _speed < 85): 	{_wantID		= "501";};
		case (_speed >= 85 and _speed < 100): 	{_wantID		= "502";};
		case (_speed >= 100 and _speed < 115): 	{_wantID		= "503";};
		case (_speed >= 115 and _speed < 130): 	{_wantID		= "504";};
		case (_speed >= 130 and _speed < 145): 	{_wantID		= "505";};
		case (_speed >= 145 and _speed < 160): 	{_wantID		= "506";};
		case (_speed >= 160)				: 	{_wantID		= "507";};
	};
	[steamid,name player,_wantID] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	hint parseText format ["Du wurdest grade geblitzt! (Limit: 60, Geschwindigkeit: %1)", round _speed];
	UISL(6);
};

_fnc_99blitz = {
	if!(EQUAL(side player,civilian)) exitWith{};
	private["_wantID"];
	_speed 	= _this;
	_wantID	= "";	

	titleCut [" ","white in",1];
	switch(true) do
	{
		case (_speed >= 105 and _speed < 115): 	{_wantID		= "508";};
		case (_speed >= 115 and _speed < 125): 	{_wantID		= "509";};
		case (_speed >= 125 and _speed < 135): 	{_wantID		= "510";};
		case (_speed >= 135 and _speed < 145): 	{_wantID		= "511";};
		case (_speed >= 145 and _speed < 155): 	{_wantID		= "512";};
		case (_speed >= 155 and _speed < 165): 	{_wantID		= "513";};
		case (_speed >= 165 and _speed < 180): 	{_wantID		= "514";};
		case (_speed >= 180 and _speed < 350): 	{_wantID		= "515";};
	};
	[steamid,name player,_wantID] remoteExecCall ["life_fnc_wantedAdd",RSERV];
	hint parseText format ["Du wurdest grade geblitzt! (Limit: 100, Geschwindigkeit: %1)", round _speed];	
	UISL(6);
};

while {!(isNull objectParent player)} do 
{
	_t 		= true;	
	_speed 	= speed _vehicle;
	if(_speed  >= 65 ) then { 
		{if(_vehicle distance _x < 22) exitWith { _speed call _fnc_50blitz; _t = false;}; }foreach _blitzer;	
		if(_speed  >= 105 && _t) then { {if(_vehicle distance _x < 28) exitWith { _speed call _fnc_99blitz;}; }foreach _blitzer100;	};
	}else{	
		if((round _speed) < -3 && _tp) then { [_vehicle,"piep.ogg"]call LIGACL_fnc_play3DSound; UISL(0.64); };
	};	
	UISL(0.4);
};	
