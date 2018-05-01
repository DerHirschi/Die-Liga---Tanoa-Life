/*
	Author: Hirschi
*/
private["_dialog","_mstatus"];
closeDialog 0;
_inArray 	= [_this,0,[],[[]]] call BIS_fnc_param;
_pot	 	= [_this,1,0 ,[0] ] call BIS_fnc_param;
//_winner	 	= [_this,2,[],[[]]] call BIS_fnc_param;
//_inArray 	= [	[[14,23,1,5,8],5],[[16,3,11,15,18],3],[[14,22,16,5,6],2],[[11,21,1,31,8],5],[[1,2,3,5,6],1]			];

//if((count _inArray) isEqualTo 0) exitWith {hint "Du besitzt noch kein Lotterielos...";};


disableSerialization;
createDialog "Lotto_schein_ub";
waitUntil{!isNull findDisplay 88888};

_dialog 		= findDisplay 88888;



// Fun with Lopp´s ... YEAHH // Hirschi


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

ctrlSetText[88700,(format["%1 ",([_pot] call life_fnc_numberText)])];

lbClear (_dialog displayCtrl 3502);

{		
	(_dialog displayCtrl 3502) lbAdd format["%1 Tage",(_x select 1)];
	(_dialog displayCtrl 3502) lbSetData [(lbSize (_dialog displayCtrl 3502))-1, str (_x select 0)];
	/*
	if((_x select 0) in _winner) then {
		(_dialog displayCtrl 3502) lbSetColor	[(lbSize (_dialog displayCtrl 3502))-1,[0, 1 , 0, 0.7]];
		(_dialog displayCtrl 3502) lbSetPicture [(lbSize (_dialog displayCtrl 3502))-1,"icons\Money.paa"];
	};
	*/
}forEach _inArray;




