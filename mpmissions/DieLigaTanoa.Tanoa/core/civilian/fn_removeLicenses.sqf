/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;

switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		
		lci_driv = false;
		lci_hero = false;
		lci_mari = false;
		lci_cok = false;
	};
	
	//Jail licenses
	case 1:
	{
		lci_gun = false;
		lci_driv = false;
	};
	
	//Remove motor vehicle licenses
	case 2:
	{
		if(lci_driv OR lci_air OR lci_lkw OR lci_boat) then {
			lci_driv = false;
			lci_air = false;
			lci_lkw = false;
			lci_boat = false;
			hint localize "STR_Civ_LicenseRemove_1";
		};
	};
	
	//Killing someone while owning a gun license
	case 3:
	{
		if(lci_gun) then {
			lci_gun = false;
			hint localize "STR_Civ_LicenseRemove_2";
		};
	};
};