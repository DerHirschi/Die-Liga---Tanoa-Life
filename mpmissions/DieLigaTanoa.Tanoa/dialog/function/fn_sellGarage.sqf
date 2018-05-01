#include "..\..\Liga_script_macros.hpp"
#define TEXTBASAR "!!!!!!! Nix Da !!!!!!! , das ist doch kein Basar hier !!! Nächstes Fahrzeug in %1:%2"
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_sellPrice"];
disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = steamid;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if(isNil "life_cgar_inUse") then {life_cgar_inUse = time - 301;};
if(life_cgar_inUse + (300) >= time) exitWith {closeDialog 0; hint format[TEXTBASAR,4 - floor ((time - life_cgar_inUse) / 60),59 - round (time - life_cgar_inUse - (floor ((time - life_cgar_inUse) / 60)) * 60)];};

if(!isClass (missionConfigFile >> CONFIG_LIGA_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

_sellPrice = switch(side player) do {
	case civilian: {SEL(M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,_vehicleLife,"garageSell"),0)};
	case west: {SEL(M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,_vehicleLife,"garageSell"),1)};
	case independent: {SEL(M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,_vehicleLife,"garageSell"),2)};
	case east: {SEL(M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,_vehicleLife,"garageSell"),3)};
};

//if!((side player) isEqualTo civilian) then { _price = _price * 0.01;};
//if(_price isEqualTo -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_sell) select _price) select 1;};
if(!(EQUAL(typeName _sellPrice,typeName 0)) OR _sellPrice < 1) then {_sellPrice = 1000};

[_vid,_pid,_sellPrice,player,life_garage_type] remoteExecCall ["TON_fnc_vehicleDelete",RSERV];
hint format[localize "STR_Garage_SoldCar",[_sellPrice] call life_fnc_numberText];
ADD(BANK,_sellPrice);

closeDialog 0;