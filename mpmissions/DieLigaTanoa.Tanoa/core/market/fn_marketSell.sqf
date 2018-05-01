#include "..\..\Liga_script_macros.hpp"
/*

	Sell [SHORTNAME, AMOUNT, israw, send?]
	Edited by: Hirschi Liga-life
*/

private["_shortname","_amount","_gew","_price","_modifier","_globalprice","_min","_dir","_israw","_arr_resource","_arr_price","_modifier","_send","_relamount","_max"];

_shortname = _this select 0;
_amount = _this select 1;
_israw = [_this, 2, false] call BIS_fnc_param;
_send = [_this, 3, true] call BIS_fnc_param;

//Get all necessary arrays
_arr_resource = [_shortname] call life_fnc_marketGetRow;
_arr_price = [_shortname] call life_fnc_marketGetPriceRow;

//Calculate the new price of the product
_price = _arr_price select 1; //current price
_globalprice = _arr_price select 2; //current change rate
if(!_israw) then { 
	_modifier = (_amount * (_arr_resource select 4));
	_gew = [_shortname] call life_fnc_itemweight;
	_modifier = _modifier * _gew;
 } else { _modifier = _amount ;};//calculate modifier
// stck ( stck * 0,5)
// preis - mod
_price = _price - _modifier;
_globalprice = _globalprice - _modifier;

//Check borders
if(_price < 0) then {_price = 0;};

_max = _arr_resource select 3;
_min = _arr_resource select 2;

if( _price > _max)then {_price = _max;};
if( _price < _min)then {_price = _min;};

//insert into new array
[_shortname, [_shortname,_price,_globalprice,-(_modifier)], false ] call life_fnc_marketSetPriceRow; //dont broadcast!


[_shortname,_price] remoteExecCall ["DB_fnc_marketInsert",RSERV];

/////Change related prices
if(!_israw) then
{
	{
		if((count _x) isEqualTo 2) then
		{
		    _relamount = ceil (_amount * _gew * (_x select 1));
		
		    if(_relamount > 0) then
		    {
			[_x select 0, _relamount, true, false] call life_fnc_marketBuy; //Make prices higher, no broadcast!
		    }
		    else
		    {
			_relamount = -(_relamount);
			[_x select 0, _relamount, true, false] call life_fnc_marketSell; //Make prices higher, no broadcast!
		    };
		}
		else
		{
		    
		};
		
	}
	foreach (_arr_resource select 6); //in change array
};

//Broadcast now if can send
 if(_send) then { [] spawn life_fnc_MarketSend; };
