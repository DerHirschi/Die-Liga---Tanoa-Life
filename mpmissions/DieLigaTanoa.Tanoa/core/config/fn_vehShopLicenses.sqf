/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.
	
	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.

switch (life_veh_shop select 0) do
{
	case "med_shop": {_ret = true;};
	case "kart_shop": {_ret = lci_driv;};
	case "med_air_hs": {_ret = lme_air;};
	case "civ_car": {_ret = lci_driv;};
	case "uhr_car": {_ret = lci_driv;};
	case "civ_ship": {_ret = lci_boat;};
	case "uhr_ship": {_ret = lci_boat;};
	case "uhr_air": {_ret = lci_air;};
	case "uhr_fly": {_ret = lci_air;};
	case "civ_fly": {_ret = lci_air;};
	case "civ_air": {_ret = lci_air;};
	case "cop_air": {_ret = lco_air;};
	case "cop_airhq": {_ret = lco_air;};
	case "uhr_truck":	{_ret = lci_lkw;};
	case "civ_truck":	{_ret = lci_lkw;};
	case "reb_ship": {_ret = lci_reb;};
	case "reb_car": {_ret = lci_reb;};
	case "reb_air": {_ret = lci_reb;};
	case "adac_car": {_ret = lada_car;};
    case "adac_air": {_ret = lada_air;};
	case "pod_cargo": {_ret = true;};
	case "cop_car": {_ret = true;};
	case "civ_cargo": {_ret = true;};
	case "civ_bohrt": {_ret = lci_bohrt;};
	case "flusi_car": {if!(life_blacklisted isEqualTo 0)exitWith{_ret = true;_ret;};};
	case "cop_ship": 
	{
		if(_veh == "B_Boat_Armed_01_minigun_F") then
		{
			_ret = lco_cg;
		}
			else
		{
			_ret = true;
		};
	};
};

_ret;