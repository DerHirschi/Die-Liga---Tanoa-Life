//onPlayerConnected {	if!(SKY_HC_aktiv_1) exitWith{}; SKY_srvdiag_link = [1,"LOGIN",_uid,_name,_owner];
//HC_id publicVariableClient "SKY_srvdiag_link";};

_onConnect = ["SERV_onClientConnect","onPlayerConnected",{	
		[_uid,_name]spawn life_fnc_wantedProfUpdate;
		_owner spawn {
			uiSleep 20;
			Liga_Laden = Liga_Laden - [ObjNull];
			[Liga_Laden] remoteExec ["LIGACL_fnc_addLadenAction",_this];	
		};

				
//		if!((_uid in getArray(configFile >> "CfgServerSettings" >> "Settings" >> "SKY_WL")) || (["HC",_uid] call BIS_fnc_inString) )then {
//			sky_flt remoteExec ["SPY_fnc_variableCheck",_owner];			
//		};
		if!(SKY_HC_aktiv_1) exitWith{};
		SKY_srvdiag_link = [1,"LOGIN",_uid,_name,_owner];
		HC_id publicVariableClient "SKY_srvdiag_link";
}] call BIS_fnc_addStackedEventHandler;


 
/*
 
onPlayerDisconnected { if!(SKY_HC_aktiv_1) exitWith{};	SKY_srvdiag_link = [1,"LOGOUT",_uid,_name,_owner];
HC_id publicVariableClient "SKY_srvdiag_link";

 };
*/