/*

	[] fnc [SHORTNAME, [PRICEROW], (send?)];
	Edited by: Hirschi Liga-life

*/

private["_shortname","_price","_send"];

_shortname = _this select 0;
_price = _this select 1;
_send = [_this,2,true] call BIS_fnc_param;

{	if((_x select 0) isEqualTo _shortname) exitWith	{		life_market_prices_1 set [_forEachIndex, _price];	 if(_send) then { call life_fnc_MarketSend; };};	}		foreach life_market_prices_1;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		life_market_prices_2 set [_forEachIndex, _price];	 if(_send) then { call life_fnc_MarketSend; };};	}		foreach life_market_prices_2;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		life_market_prices_3 set [_forEachIndex, _price];	 if(_send) then { call life_fnc_MarketSend; };};	}		foreach life_market_prices_3;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		life_market_prices_4 set [_forEachIndex, _price];	 if(_send) then { call life_fnc_MarketSend; };};	}		foreach life_market_prices_4;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		life_market_prices_5 set [_forEachIndex, _price];	 if(_send) then { call life_fnc_MarketSend; };};	}		foreach life_market_prices_5;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		life_market_prices_6 set [_forEachIndex, _price];	 if(_send) then { call life_fnc_MarketSend; };};	}		foreach life_market_prices_6;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		life_market_prices_7 set [_forEachIndex, _price];	 if(_send) then { call life_fnc_MarketSend; };};	}		foreach life_market_prices_7;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		life_market_prices_8 set [_forEachIndex, _price];	 if(_send) then { call life_fnc_MarketSend; };};	}		foreach life_market_prices_8;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		life_market_prices_9 set [_forEachIndex, _price];	 if(_send) then { call life_fnc_MarketSend; };};	}		foreach life_market_prices_9;

 if(_send) then { call life_fnc_MarketSend; };
