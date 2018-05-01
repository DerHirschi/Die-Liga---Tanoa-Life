#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi - Die Liga
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout","_marketprice"];
if((lbCurSel 2401) isEqualTo -1) exitWith {closeDialog 0; hint localize "STR_Shop_Virt_Nothing"};
//if (life_shop_type isEqualTo "spantank") exitWith {closeDialog 0; hint " Jung, wir brauchen das Zeug. Wir verkaufen nichts !!!!"; };
_type = lbData[2401,(lbCurSel 2401)];
//_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;

//_exit = false;
_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;

////Marktsystem Anfang////
//_marketprice = [_type] call life_fnc_marketGetBuyPrice;
//if!(_marketprice isEqualTo -1) then {_price = _marketprice;}else{_price = [_type,true]call life_fnc_ligaWHcalcPreis;};
_price = [_type,true]call life_fnc_ligaWHcalcPreis;

////Marktsystem Ende////

if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);

if(_diff <= 0) exitWith {hint localize "STR_NOTF_NoSpace"};
_amount = _diff;


	
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > life_cash && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};


if(([true,_type,_amount] call life_fnc_handleInv)) then{
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>$%2</t>",
				[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				[life_cash] call life_fnc_numberText
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint format[localize "STR_Shop_Virt_BoughtGang",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer SVAR["gang_bank",_funds,true];
			
			[1,grpPlayer] remoteExecCall ["TON_fnc_updateGang",RSERV];
		} else {
			if((_price * _amount) > life_cash) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint localize "STR_NOTF_NotEnoughMoney";};
			if(([_type,_amount,true,true]call life_fnc_ligaWHbuy)) exitWith{[false,_type,_amount] call life_fnc_handleInv;};
			//[_amount,_type,false]call life_fnc_ligaWHcalc;
			//Icon Abfrage ?
			//_icon = format["<img image='%1'/>",[([_type,0] call life_fnc_varHandle)] call life_fnc_itemIcon];
			hint parseText format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			__SUB__(life_cash,_price * _amount);
		};
	} else {
		if((_price * _amount) > life_cash) exitWith {hint localize "STR_NOTF_NotEnoughMoney"; [false,_type,_amount] call life_fnc_handleInv;};
		if(([_type,_amount,true,true]call life_fnc_ligaWHbuy)) exitWith{[false,_type,_amount] call life_fnc_handleInv;};
		//[_amount,_type,false]call life_fnc_ligaWHcalc;
		hint format[localize "STR_Shop_Virt_BoughtItem",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
		__SUB__(life_cash,(_price * _amount));
		
		 
	};
	// !Market	
	[] call life_fnc_virt_update;
	//[] spawn life_fnc_virt_update;
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
[] call life_fnc_hudUpdate;