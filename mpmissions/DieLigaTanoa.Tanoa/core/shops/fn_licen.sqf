#include "..\..\Liga_script_macros.hpp"
private["_display","_listbox","_shortname","_longname","_price","_hasLicense","_displayname"];
disableSerialization;

_buyables 	= M_CONFIG(getArray,"LigaLicense","LicShop",SEL(_this,3));

if(!dialog) then{if(!(createDialog "LicenseShop")) exitWith {};};

_display 	= findDisplay 5546;
if(isNull _display) exitWith {};
_listbox 	= _display displayCtrl 55126;
_mylic 		= _display displayCtrl 55131;

{
	_shortname 		= _x;
	_longname 		= ([_shortname, 0] call life_fnc_licenseType) select 0;
	_displayname 	= ([_shortname, 0] call life_fnc_licenseType) select 1;
	_price 			= [_shortname] call life_fnc_licensePrice;
	_hasLicense 	= GVAR_MNS [_longname,true];
	if(!_hasLicense) then {
		_listbox lbAdd format["%1 ($%2)", _displayname, _price];
		_listbox lbSetData [(lbSize _listbox) - 1, _shortname];
	}else{
		_mylic lbAdd format["%1", _displayname];
		_mylic lbSetData [(lbSize _mylic) - 1, _shortname];
	};
}foreach _buyables;