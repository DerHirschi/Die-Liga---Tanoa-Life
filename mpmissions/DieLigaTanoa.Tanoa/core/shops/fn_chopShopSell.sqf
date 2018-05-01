#include "..\..\Liga_script_macros.hpp"
#define TEXTCHOP "Ist das dein Ernst ?? Ich kaufe nur richtige Autos und keine Gehhilfen ...."
/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles"];
_control = CONTROL(39400,39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck","Air"],25];
_vehicle = SEL(_nearVehicles,_vehicle);
if(isNull _vehicle) exitWith {};
if(_vehicle isKindOf "C_Van_01_transport_F")exitWith {hint TEXTCHOP;};

hint localize "STR_Shop_ChopShopSelling";
life_action_inUse = true;
_price2 = CASH + _price;

[player,_vehicle,_price,_price2] remoteExecCall ["TON_fnc_chopShopSell",RSERV];
closeDialog 0;
[] call life_fnc_hudUpdate;
[]spawn{
	uiSleep 2;
	life_action_inUse = false;
};