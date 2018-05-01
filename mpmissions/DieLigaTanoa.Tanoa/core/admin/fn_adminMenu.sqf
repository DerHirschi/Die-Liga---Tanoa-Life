#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_adminMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the admin menu, sorry nothing special in here. Take a look for yourself.
*/

private["_display","_list","_side","_list1"];
if(isNil life_adminlevel)exitWith {closeDialog 0;};
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0;};
if(__GETC__(life_adminlevel) < 5 && !SKY_HC_aktiv_1) exitWith {closeDialog 0; hint "HC offline !!!";}; 
#define Btn1 2304	// ID
#define Btn2 2305	// POS
#define Btn3 2306	// Airdrop
#define Btn4 2307	// COP Menü
#define Btn5 2308	// FPS Log
#define Btn6 2309	// LIGA News
#define Btn7 2310	// DEBUG RPT
#define Btn8 2311	// INV +
#define Btn9 2312	// Bombe
#define Btn10 2313	// Wanted
#define Btn11 2314	// Baustelle
#define Btn12 2315	// INV Normal
#define Btn13 2316	// Schnee
#define Btn14 2317	// Garage Supp Air
#define Btn15 2318	// Garage Supp Car
#define Btn16 2319	// Garage Supp Ship
#define Btn17 2320	// Garage Air
#define Btn18 2321	// Garage Car
#define Btn19 2322	// Garage Ship
#define Btn20 2323	// IMP
#define Btn21 2324	// ATM
#define Btn22 2325	// Airdop Bug
#define Btn23 2326	// Comm Marker
#define Btn24 2327	// Comm Marker löschen
#define Btn25 2328	// Trunk Bug
#define Btn26 2329	// Wetter
#define Btn27 2330	// Haus Trunk Bug
#define Btn28 2331	// Chop Shop
//#define Btn29 2332	// 
#define Btn30 2333	// Love U
#define Btn31 2334	// Clan Liz
#define Btn32 2335	// Brett
#define Btn33 2336	// Shop


disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
_Btn11 = _display displayCtrl Btn11;
_Btn12 = _display displayCtrl Btn12;
_Btn13 = _display displayCtrl Btn13;
_Btn14 = _display displayCtrl Btn14;
_Btn15 = _display displayCtrl Btn15;
_Btn16 = _display displayCtrl Btn16;
_Btn17 = _display displayCtrl Btn17;
_Btn18 = _display displayCtrl Btn18;
_Btn19 = _display displayCtrl Btn19;
_Btn20 = _display displayCtrl Btn20;
_Btn21 = _display displayCtrl Btn21;
_Btn22 = _display displayCtrl Btn22;
_Btn23 = _display displayCtrl Btn23;
_Btn24 = _display displayCtrl Btn24;
_Btn25 = _display displayCtrl Btn25;
_Btn26 = _display displayCtrl Btn26;
_Btn27 = _display displayCtrl Btn27;
_Btn28 = _display displayCtrl Btn28;
//_Btn29 = _display displayCtrl Btn29;
_Btn30 = _display displayCtrl Btn30;
_Btn31 = _display displayCtrl Btn31;
_Btn32 = _display displayCtrl Btn32;
_Btn33 = _display displayCtrl Btn33;
//_Btn34 = _display displayCtrl Btn34;
//_Btn35 = _display displayCtrl Btn35;
//_Btn36 = _display displayCtrl Btn36;


_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;
_Btn11 ctrlShow false;
_Btn12 ctrlShow false;
_Btn13 ctrlShow false;
_Btn14 ctrlShow false;
_Btn15 ctrlShow false;
_Btn16 ctrlShow false;
_Btn17 ctrlShow false;
_Btn18 ctrlShow false;
_Btn19 ctrlShow false;
_Btn20 ctrlShow false;
_Btn21 ctrlShow false;
_Btn22 ctrlShow false;
_Btn23 ctrlShow false;
_Btn24 ctrlShow false;
_Btn25 ctrlShow false;
_Btn26 ctrlShow false;
_Btn27 ctrlShow false;
_Btn28 ctrlShow false;
//_Btn29 ctrlShow false;
_Btn30 ctrlShow false;
_Btn31 ctrlShow false;
_Btn32 ctrlShow false;
_Btn33 ctrlShow false;
//_Btn34 ctrlShow false;
//_Btn35 ctrlShow false;
//_Btn36 ctrlShow false;


//Purge List
lbClear _list;
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0;};



if(__GETC__(life_adminlevel) >= 5) exitWith {
_Btn1 ctrlShow true;
_Btn2 ctrlShow true;
_Btn3 ctrlShow true;
_Btn4 ctrlShow true;
_Btn5 ctrlShow true;
_Btn6 ctrlShow true;
_Btn7 ctrlShow true;
_Btn8 ctrlShow true;
_Btn9 ctrlShow true;
_Btn10 ctrlShow true;
_Btn11 ctrlShow true;
_Btn12 ctrlShow true;
_Btn13 ctrlShow true;
_Btn14 ctrlShow true;
_Btn15 ctrlShow true;
_Btn16 ctrlShow true;
_Btn17 ctrlShow true;
_Btn18 ctrlShow true;
_Btn19 ctrlShow true;
_Btn20 ctrlShow true;
_Btn21 ctrlShow true;
_Btn22 ctrlShow true;
_Btn23 ctrlShow true;
_Btn24 ctrlShow true;
_Btn25 ctrlShow true;
_Btn26 ctrlShow true;
_Btn27 ctrlShow true;
_Btn28 ctrlShow true;
//_Btn29 ctrlShow true;
_Btn30 ctrlShow true;
_Btn31 ctrlShow true;
_Btn32 ctrlShow true;
_Btn33 ctrlShow true;
//_Btn34 ctrlShow true;
//_Btn35 ctrlShow true;
//_Btn36 ctrlShow true;
	{
		_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; default {"Unknown"};};
		_list lbAdd format["%1 - (%2) - %3 - (%4) ", _x getVariable["realname",name _x],_side, _x getVariable["Sname",name _x], getPlayerUID _x ];

		_list lbSetdata [(lbSize _list)-1,str(_x)];
		

	} foreach playableUnits;
};

if(__GETC__(life_adminlevel) >= 4) exitWith {
_Btn1 ctrlShow true;
_Btn2 ctrlShow true;
_Btn3 ctrlShow true;
_Btn4 ctrlShow true;
_Btn5 ctrlShow true;
_Btn6 ctrlShow true;
_Btn7 ctrlShow true;
//_Btn8 ctrlShow true;
//_Btn9 ctrlShow true;
_Btn10 ctrlShow true;
_Btn11 ctrlShow true;
//_Btn12 ctrlShow true;
//_Btn13 ctrlShow true;
_Btn14 ctrlShow true;
_Btn15 ctrlShow true;
_Btn16 ctrlShow true;
_Btn17 ctrlShow true;
_Btn18 ctrlShow true;
_Btn19 ctrlShow true;
_Btn20 ctrlShow true;
_Btn21 ctrlShow true;
_Btn22 ctrlShow true;
_Btn23 ctrlShow true;
_Btn24 ctrlShow true;
_Btn25 ctrlShow true;
//_Btn26 ctrlShow true;
_Btn27 ctrlShow true;
_Btn28 ctrlShow true;
//_Btn29 ctrlShow true;
//_Btn30 ctrlShow true;
_Btn31 ctrlShow true;
_Btn32 ctrlShow true;
_Btn33 ctrlShow true;
//_Btn34 ctrlShow true;
//_Btn35 ctrlShow true;
//_Btn36 ctrlShow true;


	{
		_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; case east: {"ALAC"}; default {"Unknown"};};
		_list lbAdd format["%1 - (%2) - %3 - (%4) ", _x getVariable["realname",name _x],_side, _x getVariable["Sname",name _x], getPlayerUID _x ];

		_list lbSetdata [(lbSize _list)-1,str(_x)];
		

	} foreach playableUnits;
};

if(__GETC__(life_adminlevel) >= 3) exitWith {

_Btn6 ctrlShow true;
//	_Btn9 ctrlShow true; 
_Btn11 ctrlShow true;
//	_Btn13 ctrlShow true;
_Btn14 ctrlShow true;
_Btn15 ctrlShow true;
_Btn16 ctrlShow true;
_Btn17 ctrlShow true;
_Btn18 ctrlShow true;
_Btn19 ctrlShow true;
_Btn20 ctrlShow true;
_Btn21 ctrlShow true;
//_Btn22 ctrlShow true;
_Btn23 ctrlShow true;
_Btn24 ctrlShow true;
_Btn25 ctrlShow true;
//_Btn26 ctrlShow true;
_Btn27 ctrlShow true;
_Btn28 ctrlShow true;
//_Btn29 ctrlShow true;
//_Btn30 ctrlShow true;
_Btn31 ctrlShow true;
_Btn32 ctrlShow true;
//_Btn33 ctrlShow true;
//_Btn34 ctrlShow true;
//_Btn35 ctrlShow true;
//_Btn36 ctrlShow true;
	{
		_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"LRK"};case east: {"ALAC"}; default {"Unknown"};};
		_list lbAdd format["%1 - (%2) - %3", _x getVariable["realname",name _x],_side, getPlayerUID _x];

		_list lbSetdata [(lbSize _list)-1,str(_x)];
		

	} foreach playableUnits;
};

if(__GETC__(life_adminlevel) >= 2) exitWith {
	
//	_Btn6 ctrlShow true;
	_Btn14 ctrlShow true;
	_Btn15 ctrlShow true;
	_Btn16 ctrlShow true;
	_Btn20 ctrlShow true;
	_Btn21 ctrlShow true;
//	_Btn22 ctrlShow true;
//	_Btn23 ctrlShow true;
//	_Btn24 ctrlShow true;
	_Btn25 ctrlShow true;
//	_Btn26 ctrlShow true;
	_Btn27 ctrlShow true;
	_Btn28 ctrlShow true;
//	_Btn29 ctrlShow true;
//	_Btn30 ctrlShow true;
	_Btn31 ctrlShow true;
	_Btn32 ctrlShow true;
//	_Btn33 ctrlShow true;
//	_Btn34 ctrlShow true;
//	_Btn35 ctrlShow true;
//	_Btn36 ctrlShow true;
	
	{
		_side = switch(side _x) do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"Medic"}; case east: {"ALAC"}; default {"Unknown"};};
		_list lbAdd format["%1 - %2", _x getVariable["realname",name _x],_side];

		_list lbSetdata [(lbSize _list)-1,str(_x)];
		

	} foreach playableUnits;
	
};


if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0;};