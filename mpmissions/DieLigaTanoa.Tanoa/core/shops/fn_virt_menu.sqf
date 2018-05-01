#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi - Die Liga
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop","_items","_side","_arr"];
_shop = SEL(_this,3);
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = SEL(_this,0);
if(vehicle player != player) exitWith {hint "Steig aus du fauler Sack !!!";};
if(_shop isEqualTo "cop" && side player != west) exitWith {hint "Du biste kein Polizist.. Du kannst dich aber gerne mal Bewerben falls du nenn Job suchst...";};
if(_shop isEqualTo "ada" && side player isEqualTo civilian) exitWith {hint "Du biste kein ALAC oder LRK Mitarbeiter.. Du kannst dich aber gerne mal Bewerben falls du nenn Job suchst...";};

if(missionNamespace getVariable ["lci_reb",false]) then {
	_side = "REB";
}else{
	_side = switch (playerSide) do {
		case civilian 		: {"CIV"};
		case independent	: {"UHR"};	// Da war sie wieder ... die Uhr :D
		default				  {"CIV"};
	};
};
_items = M_CONFIG(getArray,"Shops",life_shop_type,_side);
_arr = [];
{
	switch(SEL(_x,3)) do {
		
		case "liga_wh_1" 		: {if!(61 in _arr) then {  _arr pushBack 61;};};
		case "liga_wh_2" 		: {if!(62 in _arr) then {  _arr pushBack 62;};};
		case "liga_wh_3"	  	: {if!(63 in _arr) then {  _arr pushBack 63;};};
		case "liga_wh_4"	  	: {if!(65 in _arr) then {  _arr pushBack 65;};};
	};	
}forEach SEL(_items,1);
if(EQUAL(life_shop_type,"spantank")) then {_arr pushBack 60};
_arr pushBack 200; 
[_arr] call life_fnc_getPVC;
/*
switch (life_shop_type) do {
	
	case "spantank" : {[[60,200		]] call life_fnc_getPVC;};
	case "wh_2" 	: {[[65,66,200	]] call life_fnc_getPVC;};	// Handelsposten UHR
	case "wh_3" 	: {[[67,68,200	]] call life_fnc_getPVC;};	// Schmuggler
	
	default {[[61,62,200]] call life_fnc_getPVC;};		// Alte WH Zentrallager
};
*/
//if!(pvc_mp) then { [] spawn life_fnc_PVCMarketPrice;};

//createDialog "shops_menu";

//[] call life_fnc_virt_update;