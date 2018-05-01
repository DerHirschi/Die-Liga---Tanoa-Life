#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Main functionality for pickaxe in mining.
*/
if (life_action_inUse) exitWith {};
if(life_action_gathering) exitWith {};
if(vehicle player != player) exitWith {};
private["_mine","_itemWeight","_diff","_itemName","_val","_F","_resourceZones","_zone","_diff_1"];

_resourceZones = M_CONFIG(getArray,"LigaGather","Zones","pickaxe");
_zone = "";

{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(EQUAL(_zone,"")) exitWith {
	hint localize "STR_NOTF_notNearResource";
	//life_action_gathering 	= false;
	//life_action_inUse 		= false;
};

_ent = switch(playerSide) do {
	case civilian 		: {"CIVpick"};
	case independent 	: {"UHRpick"};
};
_arr	= M_CONFIG(getArray,"LigaGather",_ent,_zone);
_mine 	= SEL(_arr,0);
_val 	= SEL(_arr,1);

_F = 1;
//Mine check
_guVal 		= GVAR_MNS (["pickaxe",0] call life_fnc_varHandle);
_guVal_1 	= GVAR_MNS (["a9",0] call life_fnc_varHandle);	//Presslufthammer ???
if( _guVal == 0  && _guVal_1 == 0 ) exitWith {hint "Ohne eine Spitzhacke oder einen Presslufthammer wird das nichst!!!";};
if(  _guVal_1 >= 1) then {_F = 2;};
_val = _val *_F;
_val = round random _val;

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {/*hint localize "STR_NOTF_InvFull"*/};
life_action_inUse = true;
life_action_gathering = true;
	playSound "puse";
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;

	if(EQUAL(_i,1)) then {
		if(_zone in (M_CONFIG(getArray,"LigaGather","Zones","schwefelZone")))then {
			_gather = "c3";
		//	_val    = floor random [3,0,7];	
			_diff_1 	= [_gather,(floor random [3,0,7]),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
			if!(EQUAL(_diff_1,0)) then {
				if(([true,_gather,_diff_1] call life_fnc_handleInv)) then
				{			
					_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
					titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff_1],"PLAIN"];
				};
			};
		};
	};
	
	
	
	

};

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];
};
life_action_gathering = false;
life_action_inUse = false;
