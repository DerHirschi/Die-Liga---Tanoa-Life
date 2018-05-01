#include "..\..\Liga_script_macros.hpp"
/*
	Author	: RyanTT
	Quelle	: native-network.net
	Edit	: Hirschi - Die Liga
*/
_mode = [_this,0,-1] call BIS_FNC_PARAM;
_info = [_this,1,-1] call BIS_FNC_PARAM;

switch (_mode) do
{
	case 0:
	{
		_item = SEL(_info,0);
		_price = SEL(_info,1);
		_seller = SEL(_info,2);
		hint parseText format
		[
			"Du hast:<br/><br/>
			<t color='#FF0000'>%1</t> for<br/>
			<t color='#228B22'>%3%2</t><br/>
			von %4 gekauft",
			(([_item] call life_fnc_fetchCfgDetails) select 1),_price,"$",name _seller
		];
		life_atmcash = life_atmcash - _price;
		[_item,true] spawn life_fnc_handleItem;
		[1] call SOCK_fnc_updatePartial;
		closeDialog 0;
	};
	case 1:
	{
		_seller = SEL(_info,0);
		_price = SEL(_info,1);
		hint parseText format
		[
			"%1 akzeptierte eines deiner Angebote, du erhälst<br/><t color='#228B22'>%3%2</t><br/>", name _seller,_price,"$"
		];
		life_atmcash = life_atmcash + _price;
		[1] call SOCK_fnc_updatePartial;
	};
	case 2:
	{
		AH_offers = _info;
		AH_loaded = true;
	};
	case 3: {hint "Bei dem Versuch das Angebot zu kaufen ist ein Fehler aufgetreten";};
};