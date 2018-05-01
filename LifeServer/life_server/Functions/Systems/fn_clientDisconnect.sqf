#define PVAR_ALL(var) publicVariable var
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When a player disconnect it goes through the all the dead bodies
	and removes bodies owned by the server. This is built for the new
	medical / EMS system.
*/
private["_uid","_name"];
_uid = _this select 0;
_unit = _this select 1;
_name = _this select 2;

_owner = owner _unit;
if(_uid isEqualTo HC_UID) exitWith {	
	HC_UID = -1;
	HC_id = -1;
	PVAR_ALL("HC_id");
	SKY_HC_aktiv_1 = false;
	PVAR_ALL("SKY_HC_aktiv_1");
	diag_log "╔══════════════════════════════════════════════════╗";
	diag_log "║    <<<< SKY-NET ** HC - Diconnect ** >>>>";
	diag_log "╟──────────────────────────────────────────────────╢";
	[] execVM "\life_server\initHC.sqf";
	SKY_ad_link = [0,3]; 
	PVAR_ALL("SKY_ad_link");
};

{
	_pid = _x getVariable["steam64ID",""];
	if(_uid isEqualTo _pid OR _pid isEqualTo "" OR owner _x < 3) then {
		_containers = nearestObjects[_x,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
		{deleteVehicle _x;} foreach _containers; //Delete the containers.
		deleteVehicle _x; //Get rid of the corpse.
	};
} foreach allDeadMen;

{
	_pid = _x getVariable["steam64ID",""];
	
	if(_uid isEqualTo _pid OR _pid isEqualTo "" OR owner _x < 3) then {
		_containers = nearestObjects[_x,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
		{deleteVehicle _x;} foreach _containers; //Delete the containers.
		deleteVehicle _x; //Get rid of the corpse.
	}
} foreach playableUnits;

_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
{deleteVehicle _x;} foreach _containers; //Delete the containers.
deleteVehicle _unit; //Get rid of the corpse.


_uid spawn TON_fnc_houseCleanup;
_uid spawn TON_fnc_cleanupLaden;

if!(SKY_HC_aktiv_1) exitWith{};	
SKY_srvdiag_link = [1,"LOGOUT",_uid,_name,_owner];
HC_id publicVariableClient "SKY_srvdiag_link";