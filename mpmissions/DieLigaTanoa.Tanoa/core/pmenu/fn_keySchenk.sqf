#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi - Die Liga
	Vorlage: Bryan "Tonic" Boardwine
	LIFE_fnc_keySchenk
*/
private["_dialog","_list","_sel","_vehicle","_impounded","_owners","_index","_index2","_i"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_plist = _dialog displayCtrl 2702;
_sel = lbCurSel _list;



if(EQUAL((lbCurSel 2702),-1)) exitWith {hint "Du hast kein Spieler ausgewaehlt.";};
if(EQUAL(_sel,-1)) exitWith {hint "Nichts ausgewaehlt";};

_vehicle = _list lbData _sel;
_vehicle = life_vehicles select parseNumber(_vehicle);

if(_vehicle isKindOf "House_F") exitWith {hint "Du kannst deine Hausschluessel nicht verschenken!"};

_action = [									
			'Willst du das Fahrzeug wirklich verschenken ??',
			'Fahrzeug verschenken',
			'JA',
			'NEIN'
		] call BIS_fnc_guiMessage;

if(_action) then {
		
	_sel 	= lbCurSel _plist;
	_unit 	= _plist lbData _sel;
	_unit 	= call compile format["%1", _unit];
	if(isNull _unit OR isNil "_unit") exitWith {}; 
	if(EQUAL(_unit,player)) exitWith {};

	_uid = getPlayerUID _unit;
	_owners = _vehicle GVAR "vehicle_info_owners";
	_index 	= [_uid,_owners] call TON_fnc_index;
	if(EQUAL(_index,-1)) then  {
		_owners pushBack [_uid,_unit GVAR["realname",name _unit]];
		_vehicle SVAR["vehicle_info_owners",_owners,true];
	};

	life_vehicles = life_vehicles - [_vehicle];

	_index2 = [(getPlayerUID player),_owners] call TON_fnc_index;
	if!(EQUAL(_index2,-1)) then  {
		_owners set[_index2,-1];
		_owners = _owners - [-1];
	};	
	_vehicle SVAR["vehicle_info_owners",_owners,true];

	hint format["Du hast %1 die Schluessel fuer %2 geschenkt.",_unit GVAR["realname",name _unit],typeOf _vehicle];
	[_vehicle,_unit,(getPlayerUID player),profileName] remoteExecCAll ["TON_fnc_clientKeyGesch",_unit];


	[] spawn life_fnc_keyMenu;
	closeDialog 0;
};