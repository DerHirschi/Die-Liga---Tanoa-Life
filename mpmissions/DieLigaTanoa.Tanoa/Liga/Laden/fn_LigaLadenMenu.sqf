#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi - Die Liga
	
	Laden Menu
	

*/
private["_fnc_findEinInArray","_icon","_var","_val","_name","_flag","_i","_tInv"];


/*
	Findet passende Einrichtung im Array
*/

_fnc_findEinInArray = {
	private["_r"];
	_kassObj 	= [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
	_house 		= nearestObject [(getPosATL player), "House_F"];
	_allObj		= _house   GVAR ["kassen",[]];
	if( EQUAL(_allObj,[]) ) exitWith {};
	
	{
		if(_kassObj in _x)exitWith {_r = SEL(_x,1);};
	}forEach _allObj;
	_r;
};


/*
	ENDE
	Findet passende Einrichtung im Array
*/

if(dialog) exitWith {};
_kassObj 	= [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_house		= nearestObject [(getPosATL player), "House_F"];

if(!createDialog "LadenMenu") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?
disableSerialization;

_kassinh 	= _kassObj GVAR ["kassinh",-1];
_preistab 	= _kassObj GVAR ["kasspreis",[]];
_extra	 	= _house   GVAR "ladextra";

life_trunk_vehicle = _kassObj;
if(EQUAL(_kassinh,-1) || EQUAL(_preistab,[]) || (isNil "_extra") || (isNull _kassObj)) exitWith {};


_house spawn
{
	waitUntil {isNull (findDisplay 3500)};

	uiSleep 1;
	[_this] remoteExecCall ["TON_fnc_updateKass",RSERV];		
};

//_tInv = (findDisplay 3500) displayCtrl 3502;//Ges
ctrlSetText[3501,SEL(_extra,0)];
ctrlSetText[3503,(format["%1 - [$%2]",SEL(_extra,0),([_kassinh] call life_fnc_numberText)])];

if(EQUAL(SEL(_extra,1),1))then {	
	((findDisplay 3500) displayCtrl 3551)ctrlSetBackgroundColor [0, 0.3, 0, 0.5];
}else{
	((findDisplay 3500) displayCtrl 3551)ctrlSetBackgroundColor [0.3, 0, 0, 0.5];	
};	
if(EQUAL(SEL(_extra,2),1))then {
	((findDisplay 3500) displayCtrl 3552)ctrlSetBackgroundColor [0, 0.3, 0, 0.5];
}else{
	((findDisplay 3500) displayCtrl 3552)ctrlSetBackgroundColor [0.3, 0, 0, 0.5];	
};	

		
lbClear ((findDisplay 3500) displayCtrl 3502);
lbClear ((findDisplay 3500) displayCtrl 3504);//It1;
lbClear ((findDisplay 3500) displayCtrl 3505);//It1;
lbClear ((findDisplay 3500) displayCtrl 3506);//It1;
/*Kohle*/
ctrlSetText[3507,([_kassinh] call life_fnc_numberText)];

/*Akt Item´s 1 - 3*/
{
	_ctrl_n = (3504 + _forEachIndex);
	_ctrl_b = (3514 + _forEachIndex);
	
	_val 	= SEL(_x,1);
	if(_val > 0) then
	{
		
		_var  = [SEL(_x,0),0] call life_fnc_varHandle;
		_name = [_var] call life_fnc_varToStr;
		_icon = [_var] call life_fnc_itemIcon;
		((findDisplay 3500) displayCtrl _ctrl_n) lbAdd format	["[%1 $] - %2",_val,_name];
		((findDisplay 3500) displayCtrl _ctrl_n) lbSetData 	[(lbSize ((findDisplay 3500) displayCtrl _ctrl_n))-1,SEL(_x,0)];
		((findDisplay 3500) displayCtrl _ctrl_n) lbSetPicture [(lbSize ((findDisplay 3500) displayCtrl _ctrl_n))-1,_icon];
		ctrlSetText[_ctrl_b,(str _val)];
	};	
	
}forEach _preistab;


/*Gesamt Bestand*/
_data 		= [];
{
	_flag = _x GVAR ["Trunk",[]];
	if(EQUAL(count _flag,0)) then {_x SVAR["Trunk",[[],0],true]; _flag = [];} else {_flag = SEL(_flag,0);};

	_data pushBack _flag;
}forEach ([_kassObj] call _fnc_findEinInArray); 



/*Gesamt BEST BOX*/
_i = 1;
{
	
	
	if!(EQUAL(count _x,0)) then {
		((findDisplay 3500) displayCtrl 3502) lbAdd format["### REGAL Nr.: %1 ###",_i];
		_i = _i + 1;
		{
			if!(EQUAL(count _x,0)) then {
				_val = SEL(_x,1);
				if(_val > 0) then
				{
					_var  = [SEL(_x,0),0] call life_fnc_varHandle;
					_name = [_var] call life_fnc_varToStr;
					_icon = [_var] call life_fnc_itemIcon;
					((findDisplay 3500) displayCtrl 3502) lbAdd format["[%1] - %2",_val,_name];
					((findDisplay 3500) displayCtrl 3502) lbSetData [(lbSize ((findDisplay 3500) displayCtrl 3502))-1,SEL(_x,0)];
					((findDisplay 3500) displayCtrl 3502) lbSetPicture [(lbSize ((findDisplay 3500) displayCtrl 3502))-1,_icon];
				};
			};	
		}forEach _x;
	};
} foreach _data;


