private["_cash","_vehicle"];
_cash = [_this,0,10000,[0]] call BIS_fnc_param;
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param;
 
life_action_inUse = false;

if!(isNull _vehicle) then {/*hint "Da ist was schief gelaufen.. bitte beim Admin melden ...";*/ deleteVehicle _vehicle;};

life_cash = life_cash + _cash;

hint format ["Du hast %1 $ fuer die Karre bekommen..",_cash]; 
