/*

	Get market price, otherwise returns -1
	
	INT getPrice [SHORTNAME]
	Edited by Hirschi - Die Liga

*/

private["_shortname","_ret","_F"];

_shortname = _this select 0;
_ret = -1;
_F = 1.5;
	
{	if( (_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x select 1;		_ret = _ret * _F;	_ret;};}		foreach life_market_prices_1;
{	if( (_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x select 1;		_ret = _ret * _F;	_ret;};}		foreach life_market_prices_2;
{	if( (_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x select 1;		_ret = _ret * _F;	_ret;};}		foreach life_market_prices_3;
{	if( (_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x select 1;		_ret = _ret * _F;	_ret;};}		foreach life_market_prices_4;
{	if( (_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x select 1;		_ret = _ret * _F;	_ret;};}		foreach life_market_prices_5;
{	if( (_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x select 1;		_ret = _ret * _F;	_ret;};}		foreach life_market_prices_6;
{	if( (_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x select 1;		_ret = _ret * _F;	_ret;};}		foreach life_market_prices_7;
{	if( (_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x select 1;		_ret = _ret * _F;	_ret;};}		foreach life_market_prices_8;
{	if( (_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x select 1;		_ret = _ret * _F;	_ret;};}		foreach life_market_prices_9;

_ret;