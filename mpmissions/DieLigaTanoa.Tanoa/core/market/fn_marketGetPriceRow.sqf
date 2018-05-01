/*

	[PRICE-ROW] marketGetModifiers [SHORTNAME];
	Edited by: Hirschi Liga-life
*/

private["_ret","_shortname"];

_shortname = _this select 0;
_ret = [0,0,0,0];


{	if((_x select 0) isEqualTo _shortname) exitWith	{	_ret = _x; _ret;	};}	foreach life_market_prices_1;
{	if((_x select 0) isEqualTo _shortname) exitWith	{	_ret = _x; _ret;	};}	foreach life_market_prices_2;
{	if((_x select 0) isEqualTo _shortname) exitWith	{	_ret = _x; _ret;	};}	foreach life_market_prices_3;
{	if((_x select 0) isEqualTo _shortname) exitWith	{	_ret = _x; _ret;	};}	foreach life_market_prices_4;
{	if((_x select 0) isEqualTo _shortname) exitWith	{	_ret = _x; _ret;	};}	foreach life_market_prices_5;
{	if((_x select 0) isEqualTo _shortname) exitWith	{	_ret = _x; _ret;	};}	foreach life_market_prices_6;
{	if((_x select 0) isEqualTo _shortname) exitWith	{	_ret = _x; _ret;	};}	foreach life_market_prices_7;
{	if((_x select 0) isEqualTo _shortname) exitWith	{	_ret = _x; _ret;	};}	foreach life_market_prices_8;
{	if((_x select 0) isEqualTo _shortname) exitWith	{	_ret = _x; _ret;	};}	foreach life_market_prices_9;

_ret;