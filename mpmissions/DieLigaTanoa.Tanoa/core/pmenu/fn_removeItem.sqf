/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hint "Du hast nichts ausgewaehlt was entfernt werden soll .";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hint "Du hast keine korrekte Zahl eingegeben !!"};
if(parseNumber(_value) <= 0) exitWith {hint "Du musst eine Zahl eingeben um das wegzuwerfen !!."};
_ind = [_data,life_illegal_items] call TON_fnc_index;
if(_ind != -1 && ([west,getPos player,100] call life_fnc_nearUnits)) exitWith {titleText["This is an illegal item and cops are near by, you cannot dispose of the evidence","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Du kannst nichts wegwerfen wenn du in einem Fahrzeug sitzt !!","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hint "Du kannst nicht so viel wegschmeissen. Vielleicht hast du nicht so viel ?"};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Du hast %1 %2 weggeworfen !!!",(parseNumber _value), _type];
	
[] call life_fnc_p_updateMenu;