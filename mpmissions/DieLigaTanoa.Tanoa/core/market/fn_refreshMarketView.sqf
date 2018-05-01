/*

	Refreshes current dialog
	Edited by: Hirschi Liga-life

*/

private["_display", "_selectedindex", "_index", "_shortname"];

disableSerialization;
if(!dialog) exitWith {hint "Could not find dialog.";}; //cancel if no dlg

_display = findDisplay 39500;

if(isNull _display) exitWith {hint "Dialog not open!"; };

//Selected index
_selectedindex = lbCurSel 1500;

//If selected index is -1, set it to 0 (triggers refresh)
if(_selectedindex isEqualTo -1) then
{
	lbSetCurSel [1500, 0];
	
	lbClear 1500;
	
	//Recreate listbox items

	if!(pvc_mp) then { [] spawn life_fnc_PVCMarketPrice;};
	
	{	_index = lbAdd [1500, [ [_x select 0, 0] call life_fnc_varHandle ] call life_fnc_varToStr ];	lbSetData [1500, _index, _x select 0];	}	foreach life_market_resources_1; 
	{	_index = lbAdd [1500, [ [_x select 0, 0] call life_fnc_varHandle ] call life_fnc_varToStr ];	lbSetData [1500, _index, _x select 0];	}	foreach life_market_resources_2;
	{	_index = lbAdd [1500, [ [_x select 0, 0] call life_fnc_varHandle ] call life_fnc_varToStr ];	lbSetData [1500, _index, _x select 0];	}	foreach life_market_resources_3;
	{	_index = lbAdd [1500, [ [_x select 0, 0] call life_fnc_varHandle ] call life_fnc_varToStr ];	lbSetData [1500, _index, _x select 0];	}	foreach life_market_resources_4;
	{	_index = lbAdd [1500, [ [_x select 0, 0] call life_fnc_varHandle ] call life_fnc_varToStr ];	lbSetData [1500, _index, _x select 0];	}	foreach life_market_resources_5;
	{	_index = lbAdd [1500, [ [_x select 0, 0] call life_fnc_varHandle ] call life_fnc_varToStr ];	lbSetData [1500, _index, _x select 0];	}	foreach life_market_resources_6;
	{	_index = lbAdd [1500, [ [_x select 0, 0] call life_fnc_varHandle ] call life_fnc_varToStr ];	lbSetData [1500, _index, _x select 0];	}	foreach life_market_resources_7;
	{	_index = lbAdd [1500, [ [_x select 0, 0] call life_fnc_varHandle ] call life_fnc_varToStr ];	lbSetData [1500, _index, _x select 0];	}	foreach life_market_resources_8;	
	{	_index = lbAdd [1500, [ [_x select 0, 0] call life_fnc_varHandle ] call life_fnc_varToStr ];	lbSetData [1500, _index, _x select 0];	}	foreach life_market_resources_9;
	}
//Otherwise set data to selected entry
	else
	
	{
	_shortname = lbData [1500, _selectedindex];
	
	ctrlSetText [1000, lbText [1500, _selectedindex] ]; //Set name
	
{	if((_x select 0) isEqualTo _shortname) exitWith
		{	
			ctrlSetText [1001, format["$%1", [_x select 1] call life_fnc_numberText ] ];
			//Trend Global
			ctrlSetText [1004, format["$%1", [_x select 2] call life_fnc_numberText ] ];
			if((_x select 2) >= 0) then {	ctrlSetText [1200, "icons\trendup.paa"];	}
			else
			{	ctrlSetText [1200, "icons\trenddown.paa"];};
			//Trend local
			ctrlSetText [1005, format["$%1", [_x select 3] call life_fnc_numberText ] ];
			if((_x select 3) >= 0) then{	ctrlSetText [1201, "icons\trendup.paa"];
			}
			else
			{	ctrlSetText [1201, "icons\trenddown.paa"];	};	};	}	foreach life_market_prices_1;
{	if((_x select 0) isEqualTo _shortname) exitWith
		{	
			ctrlSetText [1001, format["$%1", [_x select 1] call life_fnc_numberText ] ];
			//Trend Global
			ctrlSetText [1004, format["$%1", [_x select 2] call life_fnc_numberText ] ];
			if((_x select 2) >= 0) then {	ctrlSetText [1200, "icons\trendup.paa"];	}
			else
			{	ctrlSetText [1200, "icons\trenddown.paa"];};
			//Trend local
			ctrlSetText [1005, format["$%1", [_x select 3] call life_fnc_numberText ] ];
			if((_x select 3) >= 0) then{	ctrlSetText [1201, "icons\trendup.paa"];
			}
			else
			{	ctrlSetText [1201, "icons\trenddown.paa"];	};	};	}	foreach life_market_prices_2;
		
{		if((_x select 0) isEqualTo _shortname) exitWith
		{	
			ctrlSetText [1001, format["$%1", [_x select 1] call life_fnc_numberText ] ];
			//Trend Global
			ctrlSetText [1004, format["$%1", [_x select 2] call life_fnc_numberText ] ];
			if((_x select 2) >= 0) then {	ctrlSetText [1200, "icons\trendup.paa"];	}
			else
			{	ctrlSetText [1200, "icons\trenddown.paa"];};
			//Trend local
			ctrlSetText [1005, format["$%1", [_x select 3] call life_fnc_numberText ] ];
			if((_x select 3) >= 0) then{	ctrlSetText [1201, "icons\trendup.paa"];
			}
			else
			{	ctrlSetText [1201, "icons\trenddown.paa"];	};	};	}	foreach life_market_prices_3;
		
{		if((_x select 0) isEqualTo _shortname) exitWith
		{	
			ctrlSetText [1001, format["$%1", [_x select 1] call life_fnc_numberText ] ];
			//Trend Global
			ctrlSetText [1004, format["$%1", [_x select 2] call life_fnc_numberText ] ];
			if((_x select 2) >= 0) then {	ctrlSetText [1200, "icons\trendup.paa"];	}
			else
			{	ctrlSetText [1200, "icons\trenddown.paa"];};
			//Trend local
			ctrlSetText [1005, format["$%1", [_x select 3] call life_fnc_numberText ] ];
		if((_x select 3) >= 0) then{	ctrlSetText [1201, "icons\trendup.paa"];
			}
			else
			{	ctrlSetText [1201, "icons\trenddown.paa"];	};	};	}	foreach life_market_prices_4;
		
{		if((_x select 0) isEqualTo _shortname) exitWith
		{	
			ctrlSetText [1001, format["$%1", [_x select 1] call life_fnc_numberText ] ];
			//Trend Global
			ctrlSetText [1004, format["$%1", [_x select 2] call life_fnc_numberText ] ];
			if((_x select 2) >= 0) then {	ctrlSetText [1200, "icons\trendup.paa"];	}
			else
			{	ctrlSetText [1200, "icons\trenddown.paa"];};
			//Trend local
			ctrlSetText [1005, format["$%1", [_x select 3] call life_fnc_numberText ] ];
			if((_x select 3) >= 0) then{	ctrlSetText [1201, "icons\trendup.paa"];
			}
			else
			{	ctrlSetText [1201, "icons\trenddown.paa"];	};	};	}	foreach life_market_prices_5;
		
{		if((_x select 0) isEqualTo _shortname) exitWith
		{	
			ctrlSetText [1001, format["$%1", [_x select 1] call life_fnc_numberText ] ];
			//Trend Global
			ctrlSetText [1004, format["$%1", [_x select 2] call life_fnc_numberText ] ];
			if((_x select 2) >= 0) then {	ctrlSetText [1200, "icons\trendup.paa"];	}
			else
			{	ctrlSetText [1200, "icons\trenddown.paa"];};
			//Trend local
			ctrlSetText [1005, format["$%1", [_x select 3] call life_fnc_numberText ] ];
			if((_x select 3) >= 0) then{	ctrlSetText [1201, "icons\trendup.paa"];
			}
			else
			{	ctrlSetText [1201, "icons\trenddown.paa"];	};	};	}	foreach life_market_prices_6;
		
{		if((_x select 0) isEqualTo _shortname) exitWith
		{	
			ctrlSetText [1001, format["$%1", [_x select 1] call life_fnc_numberText ] ];
			//Trend Global
			ctrlSetText [1004, format["$%1", [_x select 2] call life_fnc_numberText ] ];
			if((_x select 2) >= 0) then {	ctrlSetText [1200, "icons\trendup.paa"];	}
			else
			{	ctrlSetText [1200, "icons\trenddown.paa"];};
			//Trend local
			ctrlSetText [1005, format["$%1", [_x select 3] call life_fnc_numberText ] ];
			if((_x select 3) >= 0) then{	ctrlSetText [1201, "icons\trendup.paa"];
			}
			else
			{	ctrlSetText [1201, "icons\trenddown.paa"];	};	};	}	foreach life_market_prices_7;
		
{		if((_x select 0) isEqualTo _shortname) exitWith
		{	
			ctrlSetText [1001, format["$%1", [_x select 1] call life_fnc_numberText ] ];
			//Trend Global
			ctrlSetText [1004, format["$%1", [_x select 2] call life_fnc_numberText ] ];
			if((_x select 2) >= 0) then {	ctrlSetText [1200, "icons\trendup.paa"];	}
			else
			{	ctrlSetText [1200, "icons\trenddown.paa"];};
			//Trend local
			ctrlSetText [1005, format["$%1", [_x select 3] call life_fnc_numberText ] ];
			if((_x select 3) >= 0) then{	ctrlSetText [1201, "icons\trendup.paa"];
			}
			else
			{	ctrlSetText [1201, "icons\trenddown.paa"];	};	};	}	foreach life_market_prices_8;
	
{		if((_x select 0) isEqualTo _shortname) exitWith
		{	
			ctrlSetText [1001, format["$%1", [_x select 1] call life_fnc_numberText ] ];
			//Trend Global
			ctrlSetText [1004, format["$%1", [_x select 2] call life_fnc_numberText ] ];
			if((_x select 2) >= 0) then {	ctrlSetText [1200, "icons\trendup.paa"];	}
			else
			{	ctrlSetText [1200, "icons\trenddown.paa"];};
			//Trend local
			ctrlSetText [1005, format["$%1", [_x select 3] call life_fnc_numberText ] ];
			if((_x select 3) >= 0) then{	ctrlSetText [1201, "icons\trendup.paa"];
			}
			else
			{	ctrlSetText [1201, "icons\trenddown.paa"];	};	};	}	foreach life_market_prices_9;			
};