/*
	[MARKET-ROW] marketGetModifiers [SHORTNAME];
	Edited by: Hirschi Liga-life
*/

private["_ret","_shortname"];

_shortname = _this select 0;
_ret = [];


{	if((_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x;	_ret;};}		foreach life_market_resources_1;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x;	_ret;};}		foreach life_market_resources_2;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x;	_ret;};}		foreach life_market_resources_3;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x;	_ret;};}		foreach life_market_resources_4;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x;	_ret;};}		foreach life_market_resources_5;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x;	_ret;};}		foreach life_market_resources_6;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x;	_ret;};}		foreach life_market_resources_7;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x;	_ret;};}		foreach life_market_resources_8;
{	if((_x select 0) isEqualTo _shortname) exitWith	{		_ret = _x;	_ret;};}		foreach life_market_resources_9;


_ret;