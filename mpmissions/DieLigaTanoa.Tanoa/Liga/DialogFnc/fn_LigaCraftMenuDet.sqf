//#include "Liga_script_macros.hpp"
#include "..\..\Liga_script_macros.hpp"
/*
	Author: Hirschi - Die Liga
*/

disableSerialization;
private ["_FrakSel","_SelRez","_multi"];
if(isNull (findDisplay 3500) ) exitWith {}; 
_mode			= SEL(_this,0);
_dialog 		= findDisplay 3500;
_ItemDet		= _dialog displayCtrl 3501;

if(EQUAL((lbCurSel 3503),-1) ) then { 
	_FrakSel = ["Zivilist","CIVpro"];
}else{
	_FrakSel = lbData [3503,lbCurSel 3503];
	_FrakSel = call compile format["%1",_FrakSel];
};
if(EQUAL((lbCurSel 3502),-1) ) then {
	_SelRez		= "anakons";
}else{
	_SelRez 	= lbData [3502,lbCurSel 3502];
};

ctrlSetText[3510,format["Crafting Rezepte : %1 ",  SEL(_FrakSel,0) ]];

_RezArr 	= M_CONFIG(getArray,"LigaProcess",SEL(_FrakSel,1),_SelRez);
if(EQUAL(_mode,0))then {
	ctrlSetText[3504,str SEL(SEL(_RezArr,3),0)];
	_multi 	= 1;
}else{
	_multi	= ctrlText 3504;
	if(!([_multi] call TON_fnc_isnumber)) exitWith {hint "Du hast keine Zahl eingegeben!!";};
	_multi	= parseNumber(_multi);
	if(_multi <= 0) exitWith {hint "Du musst einen positive Zahl eingeben!";};
	
	_multi 	=  (_multi /  SEL(SEL(_RezArr,3),0) );
	_multi 	= 1 max _multi;
};	

_text1 	= "<t size='1.25' color='#FF9A00' >Ausgangsprodukt(e)</t><br/>";
_text2	= "<br/>";
{
	_val 	= SEL(SEL(_RezArr,1),_forEachIndex);
	_val 	= _val * _multi;
	_shrt 	= [_x,0] call life_fnc_varHandle;
	_str 	= [_shrt] call life_fnc_varToStr;	
	_icon 	= [_shrt] call life_fnc_itemIcon;
 
	_flag	= format["<img image='%1' /><t size='1' color='#FFFFFF' > (%2 Stk.) - %3</t> <br/>",_icon,_val,_str]; ;
	_text2	= _text2 + _flag;
}forEach SEL(_RezArr,0);
_text2	= _text2 + "<t size='1.25' color='#FF9A00' >________________________</t><br/>";
_text2	= _text2 + "<t size='1.25' color='#FF9A00' >Endprodukt(e)</t><br/><br/>";

{
	_val 	= SEL(SEL(_RezArr,3),_forEachIndex);
	_val 	= _val * _multi;
	_shrt 	= [_x,0] call life_fnc_varHandle;
	_str 	= [_shrt] call life_fnc_varToStr;	
	_icon 	= [_shrt] call life_fnc_itemIcon;
 
	_flag	= format["<img image='%1' /><t size='1' color='#FFFFFF' > (%2 Stk.) - %3</t> <br/>",_icon,_val,_str]; ;
	_text2	= _text2 + _flag;
}forEach SEL(_RezArr,2);


_text = _text1 + _text2;
_ItemDet ctrlSetStructuredText parseText _text;