#include "..\Liga_script_macros.hpp"
#define TUVTEXT1 "<img size='12' align='center' color='#FFFFFF' image='textures\tuv.jpg'/><br/><t color='#33CC33'>naechster B-Check in: <t color='#ffffff'>%1 Monaten<br/>"
#define TUVTEXT2 "<img size='12' align='center' color='#FFFFFF' image='textures\tuv.jpg'/><br/><t color='#33CC33'>naechster TUEV Termin in: <t color='#ffffff'>%1 Monaten<br/>"
/*
	File: fuel_check.sqf
	Author: Paradox

	Edited by Hirschi - Die Liga 
	
	Description: checkt ob der Mototr an ist , bzw. ob der Spieler im Auto ist??
*/
private ["_vehicle","_tuv"];

	_tuv = [0,0];
	_vehicle = vehicle player;

	if (!(isNull objectParent player) && (alive (vehicle player))) then { 	
		if(vehicle player isKindOf "Air") then {
			if!((SEL(liga_bos,6))) then {				
				[player,true,7] remoteExecCall ["TON_fnc_radio",RSERV];
				liga_bos set [6,true];
			};	
		}; 
		if ((driver _vehicle isEqualTo player)) then {			
			_tuv = _vehicle GVAR ["tuv",[0,0]];
			_tuv = SEL(_tuv,0);
			if( _vehicle isKindOf "Air" && _tuv >= 6) then{
				hint parseText format [TUVTEXT1,(7 - _tuv)];
			}else{
				if(_tuv >= 13) then {
					hint parseText format [TUVTEXT2,(14 - _tuv)];
				};
			};	
			if(vehicle player isKindOf "Car") then {[]spawn life_fnc_radartrap;};
			[] spawn life_fnc_fuel;
		};		
	} else { 
		if!(liga_flusi) then {
			if ((SEL(liga_bos,6))) then {				
				[player,false,7] remoteExecCall ["TON_fnc_radio",RSERV];
				liga_bos set [6,false];
			};
		};
	};
	