#include "..\..\Liga_script_macros.hpp"
//#define IDD_LIFE_MAIN_DISP 2203
//#define IDC_LIFE_BAR_FOOD 2200


#define IDC_LIFE_FOOD_TEXT 1000
#define IDC_LIFE_WATER_TEXT 1001
#define IDC_LIFE_HEALTH_TEXT 1002
#define IDC_LIGA_BANK_TEXT 1003
#define IDC_LIGA_BANK_CASH 1004
#define IDC_LIGA_COPON_TEXT 1005
#define IDC_LIGA_ALACON_TEXT 1006
#define IDC_LIGA_MEDON_TEXT 1007
#define IDC_LIGA_PICTURE_CIVON 1008

#define COUNTEAST east countSide playableUnits
#define COUNTWEST west countSide playableUnits
#define COUNTIND independent countSide playableUnits
#define COUNTCIV civilian countSide playableUnits

#define LIFEctrl(ctrl) ((GVAR_UINS ["Liga_handy_side_m",displayNull]) displayCtrl ctrl)
#define LIGAdisplay (GVAR_UINS ["Liga_handy_side_m",displayNull]) 
/*
File: fn_hudUpdate.sqf
Author: Dillon "Itsyuka" Modine-Thuen
Edited: Hirschi - Die Liga

Description:
Updates the HUD when it needs to.
*/

disableSerialization;
if!(liga_handy_kl)exitWith{};
if(isNull LIGAdisplay && !visibleMap) then {[] call life_fnc_hudSetup;};
//LIFEctrl(IDC_LIFE_BAR_FOOD) progressSetPosition (1 / (100 / life_hunger));
//LIFEctrl(IDC_LIFE_BAR_WATER) progressSetPosition (1 / (100 / life_thirst));
//LIFEctrl(IDC_LIFE_BAR_HEALTH) progressSetPosition (1 - (damage player));

LIFEctrl(IDC_LIGA_BANK_TEXT) ctrlsetText format["%1 $", [BANK] call life_fnc_numberText];
LIFEctrl(IDC_LIGA_BANK_CASH) ctrlsetText format["%1 $", [CASH] call life_fnc_numberText];
LIFEctrl(IDC_LIGA_COPON_TEXT) ctrlsetText format["%1", COUNTWEST];
LIFEctrl(IDC_LIGA_ALACON_TEXT) ctrlsetText format["%1", COUNTEAST];
LIFEctrl(IDC_LIGA_PICTURE_CIVON) ctrlsetText format["%1", COUNTCIV];
LIFEctrl(IDC_LIGA_MEDON_TEXT) ctrlsetText format["%1", COUNTIND];	
LIFEctrl(IDC_LIFE_FOOD_TEXT) ctrlsetText format["%1", life_hunger];
LIFEctrl(IDC_LIFE_WATER_TEXT) ctrlsetText format["%1", life_thirst];
LIFEctrl(IDC_LIFE_HEALTH_TEXT) ctrlsetText format["%1", round((1 - (damage player)) * 100)];