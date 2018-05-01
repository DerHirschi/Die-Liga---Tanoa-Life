#include "..\..\..\Liga_script_macros.hpp"
/*
	File: fn_searchVehAction.sqf
	Edit: Hirschi - Die Liga
*/
private["_vehicle","_data","_tuv"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{
	if(life_blacklisted != 0 && !(_vehicle isKindOf "Air")) exitWith {hint "Das Ding hat kein Propeller dran ... Mach die Augen auf Junge ...  ";};
	_owners = _vehicle GVAR "vehicle_info_owners";
	if(isNil {_owners}) exitWith {hint localize "STR_NOTF_VehCheat"; /*deleteVehicle _vehicle;*/};
	life_action_inUse = true;
	hint localize "STR_NOTF_Searching";
	sleep 3;
	life_action_inUse = false;
	if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {hint localize "STR_NOTF_SearchVehFail";};
	//_inventory = [(_vehicle getVariable "vehicle_info_inv")] call fnc_veh_inv;
	//if(isNil {_inventory}) then {_inventory = "Nothing in storage."};
	_owners = [_owners] call life_fnc_vehicleOwners;
	_tuv = _vehicle GVAR ["tuv",[0,0]];
	_rep = SEL(_tuv,1);
	_tuv = SEL(_tuv,0);
	if(_vehicle isKindOf "Air") then {_tuv = 7 - _tuv;} else {_tuv = 14 - _tuv;};
		
	if(_owners isEqualTo "any<br/>") then
	{
		_owners = "No owners, impound it<br/>";
	};
	if!(EQUAL(typeOf _vehicle,"Land_Research_house_V1_F") || EQUAL(typeOf _vehicle,"Land_Tank_rust_F")) then {
		if ( playerSide isEqualTo east) exitWith {
			hint parseText format ["<t color='#FFBF00'><t size='2.2'><t align='center'>Fahrzeug Information<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Halter: <t color='#ffffff'>%1<br/><img size='12' align='center' color='#FFFFFF' image='textures\tuv.jpg'/><br/><t color='#33CC33'>naechster TUEV in: <t color='#ffffff'>%2 Monaten<br/><br/><t color='#33CC33'>Anzahl der Reparaturen:<t color='#ffffff'>%3 mal<br/>",_owners,_tuv,_rep];
		};
		if!( life_blacklisted isEqualTo 0) exitWith {
			hint parseText format ["<t color='#FFBF00'><t size='2.2'><t align='center'>Fahrzeug Information<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Halter: <t color='#ffffff'>%1<br/><img size='12' align='center' color='#FFFFFF' image='textures\tuv.jpg'/><br/><t color='#33CC33'>naechster B-Check in: <t color='#ffffff'>%2 Monaten<br/><br/><t color='#33CC33'>Anzahl der Reparaturen:<t color='#ffffff'>%3 mal<br/>",_owners,_tuv,_rep];
		};
		
		if ( side player isEqualTo civilian) exitWith {
			hint parseText format ["<img size='12' align='center' color='#FFFFFF' image='textures\tuv.jpg'/><br/><t color='#33CC33'>naechster TUEV in: <t color='#ffffff'>%1 Monate(n)<br/><br/>",_tuv];
		};
		
		if ( side player isEqualTo west) exitWith {
			hint parseText format ["<t color='#FFBF00'><t size='2.2'><t align='center'>Fahrzeug Information<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Halter: <t color='#ffffff'>%1<br/><img size='12' align='center' color='#FFFFFF' image='textures\tuv.jpg'/><br/><t color='#33CC33'>naechster TUEV in: <t color='#ffffff'>%2 Monaten<br/><br/>",_owners,_tuv];
		};
	}else{
		hint parseText format ["<t color='#FFBF00'><t size='2.2'><t align='center'>Bohrturm Information<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Besitzer: <t color='#ffffff'>%1<br/><br/>",_owners];

	};
};
