/*
	Author: Hirschi
*/
private["_dialog","_mstatus"];
disableSerialization;

createDialog "Lotto_schein";
waitUntil{!isNull findDisplay 88888};

_dialog 		= findDisplay 88888;
Liga_LottoArr 	= [];



for "_i" from 1 to 35 do {		
	(_dialog displayCtrl (89000 + _i)) buttonSetAction format["%1 call LIGACL_fnc_LottoMkCross", str _i];
};

// Fun with Lopp´s ... YEAHH // Hirschi

for "_a" from 1 to 2 do {
	for "_i" from 1 to 35 do {		
		uiSleep 0.005;
		_mstatus 	= _dialog displayCtrl (89100 + _i);
		_mstatus ctrlSetStructuredText parseText format["<img size='1.4' image='textures\lotto\kreu.paa'/> ",0];

		if(_i isEqualTo 17) then {
			[] spawn {
				disableSerialization;
				for "_i" from 1 to 35 do {		
					uiSleep 0.005;
					_mstatus 	= (findDisplay 88888) displayCtrl (89100 + _i);
					_mstatus ctrlSetStructuredText parseText format["",0];
				};
			};
		};
	};
};