//#define GVAR_UINS uiNamespace getVariable
#define COUNTEAST east countSide playableUnits
#define COUNTWEST west countSide playableUnits
#define COUNTIND independent countSide playableUnits
#define COUNTCIV civilian countSide playableUnits

#define CHECKARR [life_atmcash,life_cash,COUNTWEST,COUNTEAST,COUNTIND,COUNTCIV,life_hunger,life_thirst]
#define EQCHECK CHECKARR isEqualTo _checkAr
//#define GVAR_UINS uiNamespace getVariable
//#define LIFEctrl(ctrl) ((GVAR_UINS ["Liga_handy_side_m",displayNull]) displayCtrl ctrl)
/*
	File: fn_hudSetup.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Hirschi - Die Liga
	
	Description:
	Setups the hud for the player?

private["_display","_version"];
disableSerialization;
_display = findDisplay 46;
_version = _display displayCtrl 1000;

2 cutRsc ["playerHUD","PLAIN"];
_version ctrlSetText format["BETA: 0.%1.%2",(productVersion select 2),(productVersion select 3)];
*/

//[1]spawn liga_fnc_handy;
if(ctrlVisible 88887)exitWith{};
if(visibleGPS) then 
{
	2 cutText ["", "PLAIN"]; 
	2 cutRsc["Liga_handy_side_gps_m"	,"PLAIN",0];
}else{
	2 cutText ["", "PLAIN"]; 
	2 cutRsc["Liga_handy_side_m"	,"PLAIN",0];
};

[] call life_fnc_hudUpdate;




