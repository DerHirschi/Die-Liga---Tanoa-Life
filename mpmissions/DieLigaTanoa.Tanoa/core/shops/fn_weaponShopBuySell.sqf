#include "..\..\Liga_script_macros.hpp"
#define WAP_WH if(!([_item,true]call life_fnc_ligaWeapWH select 0)) exitWith { hint "Es ist nicht genug im Warenahaus";}
/*
	File: fn_weaponShopBuySell.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Master handling of the weapon shop for buying / selling an item.
*/
disableSerialization;
private["_price","_item","_itemInfo","_bad"];
if((lbCurSel 38403) == -1) exitWith {hint localize "STR_Shop_Weapon_NoSelect"};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
//diag_log format ["Item: %1",_item]; //"Item: arifle_MX_F"


_itemInfo = [_item] call life_fnc_fetchCfgDetails;

_bad = "";

if((SEL(_itemInfo,6)) != "CfgVehicles") then
{
	if((SEL(_itemInfo,4)) in [4096,131072]) then
	{
		if(!(player canAdd _item) && (GVAR_UINS["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = (localize "STR_NOTF_NoRoom")};
	};
};

if(_bad != "") exitWith {hint _bad};

if((GVAR_UINS["Weapon_Shop_Filter",0]) == 1) then
{
	life_cash = life_cash + _price;
	[_item,false] call life_fnc_handleItem;
	hint parseText format[localize "STR_Shop_Weapon_Sold",SEL(_itemInfo,1),[_price] call life_fnc_numberText];
	[nil,(GVAR_UINS["Weapon_Shop_Filter",0])] call life_fnc_weaponShopFilter; //Update the menu.
}
	else
{
	private["_hideout"];
	_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
	if(!isNil "_hideout" && {!isNil {grpPlayer GVAR "gang_bank"}} && {(grpPlayer GVAR "gang_bank") >= _price}) then {
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(grpPlayer GVAR "gang_bank")] call life_fnc_numberText,
				[life_cash] call life_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			WAP_WH;
			hint parseText format[localize "STR_Shop_Weapon_BoughtGang",SEL(_itemInfo,1),[_price] call life_fnc_numberText];
			_funds = GANG_FUNDS;
			_funds = _funds - _price;
			grpPlayer SVAR["gang_bank",_funds,true];
			[_item,true] spawn life_fnc_handleItem;			
			[1,grpPlayer] remoteExecCall ["TON_fnc_updateGang",RSERV];
			
		} else {
			if(_price > life_cash) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
			WAP_WH;
			hint parseText format[localize "STR_Shop_Weapon_BoughtItem",SEL(_itemInfo,1),[_price] call life_fnc_numberText];
			__SUB__(life_cash,_price);
			[_item,true] spawn life_fnc_handleItem;
		};
	} else {
		if(_price > life_cash) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};
		WAP_WH;
		hint parseText format[localize "STR_Shop_Weapon_BoughtItem",SEL(_itemInfo,1),[_price] call life_fnc_numberText];
		life_cash = life_cash - _price;
		[_item,true] spawn life_fnc_handleItem;
	};
};
[] call life_fnc_saveGear;
[] call life_fnc_hudUpdate;