/*
	Author: Hirschi
*/
private["_data","_dialog","_mstatus"];

disableSerialization;

if((lbCurSel 3502) isEqualTo -1) exitWith {};

_data 	= lbData [3502, (lbCurSel 3502)] ;
_data	= call compile format["%1",_data];

if!((count _data) isEqualTo 5) exitWith {};

_dialog 		= findDisplay 88888;

	
for "_i" from 1 to 35 do {			
	_mstatus 	= (findDisplay 88888) displayCtrl (89100 + _i);
	_mstatus ctrlSetStructuredText parseText format["",0];
};

for "_i" from 0 to 4 do {
	_dialog displayCtrl (88900 + _i) ctrlSetText "";
};


{
	_mstatus 	= _dialog displayCtrl (89100 + _x);
	_mstatus ctrlSetStructuredText parseText format["<img size='1.4' image='textures\lotto\kreu.paa'/> ",0];
	
	_dialog displayCtrl (88900 + _forEachIndex) ctrlSetText (str _x);
	
}forEach _data;