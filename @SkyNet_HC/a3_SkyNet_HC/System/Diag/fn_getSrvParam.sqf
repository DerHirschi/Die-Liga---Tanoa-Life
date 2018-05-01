#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"


"SKY_srvdiag_link" addPublicVariableEventHandler {SRVDIAGLOG;};


srv_diag_run = false;
publicVariableServer "srv_diag_run";
uiSleep 50;
/*
TON_fnc_diag = compileFinal "
	
	[]spawn{
		while {srv_diag_run} do {
				uiSleep 45;
				SKY_srvdiag_link = [0,(count diag_activeSQFScripts),diag_fps,diag_fpsMin,(count playableUnits)];
				HC_id publicVariableClient 'SKY_srvdiag_link';
		};
	};
";
*/
srv_diag_run = true;
publicVariableServer "srv_diag_run";
//publicVariableServer "TON_fnc_diag";
/*
sleep 5;

[[],"TON_fnc_diag",false,false] call SKY_fnc_MPsrv;
*/