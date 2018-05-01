#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_licenseCheck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the licenses to the cop.
*/
private["_cop"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {}; //Bad entry

_licenses = "";
//Licenses
{
	if(GVAR_MNS (SEL(_x,0)) && _x select 1 == "civ") then
	{
		_licenses = _licenses + ([SEL(_x,0)] call life_fnc_varToStr) + "<br/>";
	};
} foreach life_licenses;

if(EQUAL(_licenses,"")) then {_licenses = (localize "STR_Cop_NoLicensesFound");};



[profileName,_licenses] remoteExecCall ["life_fnc_licensesRead",_cop];
