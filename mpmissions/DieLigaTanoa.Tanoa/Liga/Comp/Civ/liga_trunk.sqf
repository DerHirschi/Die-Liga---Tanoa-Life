#include "..\..\..\Liga_script_macros.hpp"
	closeDialog 0;
	_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
	if((KIND_TRUNK_KH(_curTarget)) && player distance _curTarget < 10 && vehicle player isEqualTo player && alive _curTarget) then
	{
		if(_curTarget in life_vehicles OR {!(_curTarget getVariable ["locked",true])}) then
		{
			[_curTarget] spawn life_fnc_openInventory;
		};	
	};	
