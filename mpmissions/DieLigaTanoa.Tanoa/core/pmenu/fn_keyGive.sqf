#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_keyGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a copy of the key for the selected vehicle to the selected player.
	Player must be within range.
*/
private["_dialog","_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_plist = _dialog displayCtrl 2702;

_sel = lbCurSel _list;
_vehicle = _list lbData _sel;
_vehicle = life_vehicles select parseNumber(_vehicle);

if(EQUAL((lbCurSel 2702),-1)) exitWith {hint "Du hast kein Spieler ausgewaehlt.";};


_sel = lbCurSel _plist;
_unit = _plist lbData _sel;
_unit = call compile format["%1", _unit];
if(isNull _unit OR isNil "_unit") exitWith {}; 
if(EQUAL(_unit,player)) exitWith {};

_action = [									
			'Willst du den Schluessel wirklich weitergeben ??',
			'Schluessel weitergeben',
			'JA',
			'NEIN'
			] call BIS_fnc_guiMessage;
if(_action) then {
	_uid = getPlayerUID _unit;
	_owners = _vehicle GVAR "vehicle_info_owners";
	_index = [_uid,_owners] call TON_fnc_index;
	if(EQUAL(_index,-1)) then  {
		_owners pushBack [_uid,_unit GVAR["realname",name _unit]];
		_vehicle SVAR["vehicle_info_owners",_owners,true];
	};

	hint format["Du hast %1 die Schluessel fuer %2 gegeben.",_unit GVAR["realname",name _unit],typeOf _vehicle];
	[_vehicle,_unit,profileName] remoteExecCAll ["TON_fnc_clientGetKey",_unit];
	closeDialog 0;
};