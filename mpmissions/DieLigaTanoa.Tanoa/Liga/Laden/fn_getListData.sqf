#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi - Die Liga
	
	Get ListData

*/
private["_ctrl","_num"];
disableSerialization;
_textctr = SEL(_this,0);
_ctrl_n = SEL(_this,1);
_ctrl_ind = SEL(_this,2);

if(isNull life_trunk_vehicle)exitWith{};
_preistab 	= life_trunk_vehicle GVAR ["kasspreis",[]];
if(EQUAL((count _preistab),0))exitWith	{};
if(!alive player) exitwith {closeDialog 0;};
if(EQUAL((lbCurSel 3502),-1)) exitWith {hint localize "STR_Global_NoSelection";};

_ctrl 	= lbData [3502, (lbCurSel 3502)] ;

_num 	= ctrlText _textctr;
lbClear ((findDisplay 3500) displayCtrl _ctrl_n);

if(!([_num] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num 	= parseNumber(_num);
if(EQUAL(_num,0)) exitWith {hint localize "STR_MISC_Under1";};

_var  = [_ctrl,0] call life_fnc_varHandle;
_name = [_var] call life_fnc_varToStr;
_icon = [_var] call life_fnc_itemIcon;
((findDisplay 3500) displayCtrl _ctrl_n) lbAdd format	["[%1 $] - %2",_num,_name];
((findDisplay 3500) displayCtrl _ctrl_n) lbSetData 	[(lbSize ((findDisplay 3500) displayCtrl _ctrl_n))-1,_ctrl];
((findDisplay 3500) displayCtrl _ctrl_n) lbSetPicture [(lbSize ((findDisplay 3500) displayCtrl _ctrl_n))-1,_icon];

ctrlSetText[_textctr,(str _num)];

diag_log str _ctrl;

_preistab set [_ctrl_ind,[_ctrl,_num]];

life_trunk_vehicle SVAR ["kasspreis",_preistab,true];
