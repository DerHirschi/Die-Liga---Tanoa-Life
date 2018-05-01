/*

	VOID marketShortView [ [SHORTNAMES] ];
	Edited by: Hirschi Liga-life	
	shows list of current market values

*/

private["_items", "_shortname", "_price", "_globalchange", "_lastchange", "_row", "_text", "_resname", "_didanything"];

_items = _this select 0;

if(count _items == 0) exitWith {};

_text = "<t size='1.5' color='#00FF00'>Liga Börse</t><br/>";

_didanything = false;
_array = ["life_market_shortnames_1"," life_market_shortnames_2","life_market_shortnames_3","life_market_shortnames_4","life_market_shortnames_5","life_market_shortnames_6","life_market_shortnames_7","life_market_shortnames_8","life_market_shortnames_9"];
{
	if(_x in []) then {
	_didanything = true;

	_row = [_x] call life_fnc_marketGetPriceRow;
	
	_price = _row select 1;
	_globalchange = _row select 2;
	_lastchange = _row select 3;
	
	_resname = [_x, 0] call life_fnc_varHandle;
	_resname = [_resname] call life_fnc_varToStr;
	
	_text = format["%1<br/><t size='1.2'>%2</t><br/><t size='1.3' color='#FFFF00'>$%3</t><br/>", _text,_resname, [_price] call life_fnc_numberText];
	
	if(_globalchange >= 0) then
	{	_text = format["%1<img size='2' image='icons\trendup.paa'/> $%2 <br/>", _text, _globalchange];	}
	else
	{	_text = format["%1<img size='2' image='icons\trenddown.paa'/> $%2 <br/>", _text, _globalchange];	};
	
	if(_lastchange >= 0) then
	{_text = format["%1<img size='2' image='icons\trendup.paa'/> $%2 <br/>", _text, _globalchange];	}
	else
	{	_text = format["%1<img size='2' image='icons\trenddown.paa'/> $%2 <br/>", _text, _globalchange];	};	
	};
}
foreach _items;

//Show everyting
if(_didanything) then {hintSilent parseText _text;};