#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi
*/

_win 	= [_this,0,0 ,[0 ]] call BIS_fnc_param;
_mode 	= [_this,1,0 ,[0 ]] call BIS_fnc_param;
_class 	= [_this,2,"",[""]] call BIS_fnc_param;
	
if(EQUAL(_win,0)) exitWith {};



switch (_mode) do {
	
	case 0: {	
		life_cash = life_cash + _win;
		hint format["Glueckwunsch. Du hast %1 $ erhalten.",([_win] call life_fnc_numberText)];	
	};
	case 1: {	
		life_atmcash = life_atmcash + _win;
		if!( EQUAL(_class,"") ) then {
			_vehicleInfo = [_class] call life_fnc_fetchVehInfo;
			hint format["Du hast %1 $ für deinen alten %2 erhalten.",([_win] call life_fnc_numberText),SEL(_vehicleInfo,3)];	
		};
	};
	case 2: {	
		life_cash = life_cash - _win;
		if!( EQUAL(_class,"") ) then {
			_vehicleInfo = [_class] call life_fnc_fetchVehInfo;
			hint format["Du hast %1 $ für einen gebrauchten %2 bezahlt.",([_win] call life_fnc_numberText),SEL(_vehicleInfo,3)];	
		};
	};	
};


[] call life_fnc_hudUpdate;