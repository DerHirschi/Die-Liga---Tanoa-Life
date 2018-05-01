
/*
	File: fn_cookieJar.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Reports to the RPT of a confirmed cheater for external programs
	to parse,log or ban automatically.
*/
private["_pName","_pUID","_pReason","_pMSG","_ban","_mode"];
_pName 		= [_this,0,"",[""]] call BIS_fnc_param;
_pUID 		= [_this,1,"",[""]] call BIS_fnc_param;
_pReason 	= [_this,2,"",[""]] call BIS_fnc_param;
_pMSG		= [_this,3,"",[""]] call BIS_fnc_param;
//_ban		= [_this,4,ObjNull,[ObjNull]] call BIS_fnc_param;
_ban		= ObjNull;

if(_pName == "" OR _pUID == "" OR _pReason == "" ) exitWith {}; //Bad params passed..

//diag_log format["SPYGLASS-FLAG:%1:%2:%3",_pName,_pUID,_pReason,_pMSG]; //Outputs to RPT for external programs to parse,log,react to.

diag_log "╔══════════════════════════════════════════════════╗";
diag_log "║	################################################";
diag_log "║	!!!!!!!!!!!!  SKY-NET detecion ... !!!!!!!!!!!!!";
diag_log "║	################################################";
diag_log "╠══════════════════════════════════════════════════╣";
diag_log format ["║ SpielerName	: %1",_pName];	
diag_log format ["║ UID			: %1",_pUID];	
diag_log format ["║ Grund 		:%1",_pReason];	
diag_log format ["║ %1",_pMSG];	


if(isNil "sky_newmsgAd") then {sky_newmsgAd = []; };
sky_newmsgAd pushBack [_pName,_pUID,_pReason];
_mode = 8;
if!(isNull _ban) then {
	_mode = 9;
	(owner _ban) spawn {
		uiSleep 2;
		(call FN_GET_SERVERPW) serverCommand format ['#exec ban %1',_this];
	};	
	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log "║	################################################";
	diag_log "║	!!! Auto - Ban !!!! Auto-Ban !!!! Auto - Ban !!!";
	diag_log "║	################################################";
	diag_log "║	!!! Auto - Ban !!!! Auto-Ban !!!! Auto - Ban !!!";
	diag_log "║	################################################";	

};
if(SKY_HC_aktiv_1) then {
	HC_id publicVariableClient "sky_newmsgAd";
	[_mode,_pName,_pUID,_pReason,_pMSG] remoteExec ["SKY_fnc_DBlogSys",HC_id];
}else{
	[_pName,_pUID,_pReason,_pMSG] remoteExec ["SPY_fnc_notifyAdmins",0];
};
diag_log "╚══════════════════════════════════════════════════╝";