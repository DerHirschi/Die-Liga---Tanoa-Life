/*
	File: fn_RigGather.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi Liga-Life
	
	Description:
	Öl Rig Farming gedöhns .... 	
*/
private["_vendor","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_diff","_gather","_val"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR  (player distance _vendor > 10)) exitWith {};
if(vehicle player != player) exitWith {hint "Steig aus du fauler Sack !!!"};

_puVal = missionNamespace getVariable (["rip",0] call life_fnc_varHandle);
if( _puVal == 0 ) exitWith {hint "Du benoetigst eine Oel Pumpe !!! Der Schlosser baut die vielleicht eine...";};

_gather = "rio";
_val = 4;
_upp = "Foerdere Oel";

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff <= 0) exitWith {hint "Dein Inventar ist voll."};

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

	while{true} do
	{
		sleep  0.04; 
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {hint "Du musst innerhalb von 10m bleiben, um abbauen zu können."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	};
	
if(player distance _vendor > 10) exitWith {hint "Du musst innerhalb von 10m bleiben, um abbauen zu können."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["Du hast %1 mal Offshore Oel gefoerdert",_diff],"PLAIN"];
};	

sleep 1;

	_gather = "rig";
	_val = 5;

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff <= 0) exitWith {
	hint "Dein Inventar ist voll.";
	5 cutText ["","PLAIN"];
	life_is_processing = false;
		
};

if(([true,_gather,_diff] call life_fnc_handleInv)) exitWith
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["Du hast %1 mal Methangas gefoerdert",_diff],"PLAIN"];
	5 cutText ["","PLAIN"];
	life_is_processing = false;
		
};	
	
life_is_processing = false;
5 cutText ["","PLAIN"];
