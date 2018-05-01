#include "..\Liga_script_macros.hpp"

/*
	File: fn_notifyAdmins.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Checks if player is admin and notifies them that of the
	flagged person.
*/
private["_pName","_pReason","_pUID","_pMSG"];
_pName 		= SEL(_this,0);
_pUID 		= SEL(_this,1);
_pReason 	= SEL(_this,2);
_pMSG 		= SEL(_this,3);


if(isNil "life_adminlevel") exitWith {};
if!(EQUAL(typeName life_adminlevel,"CODE")) exitWith {};
if(__GETC__(life_adminlevel) < 1) exitWith {};
hint parseText format["<t align='center'><t color='#FF0000'><t size='3'>SKY-NET</t></t><br/>!!! AH Warnung !!!</t><br/><br/><t align='center'><t color='#F7FE2E'><t size='2.1'>Grund: %3</t></t></t><br/><br/>Name: %1<br/>UID: %2<br/>Detection: %4",_pName,_pUID,_pReason];
systemChat '>>>>>>> AH Warnung !! <<<<<<';
systemChat format ['>>>>> %1 <<<<<',_pReason];
systemChat format ['>>%1',_pName];
systemChat format ['>>%1',_pUID];
systemChat format ['>>%1',_pMSG];
systemChat '>>>>>>> AH Warnung !! <<<<<<';		
	
	
diag_log "╔══════════════════════════════════════════════════╗";
diag_log "║	SKY-NET detecion ... ";
diag_log "╠══════════════════════════════════════════════════╝";
diag_log format ["║ SpielerName	: %1",_pName];	
diag_log format ["║ UID			: %1",_pUID];	
diag_log format ["║ Grund 		:%1",_pReason];	
diag_log format ["║ %1",_pMSG];	
diag_log "╚══════════════════════════════════════════════════╝";
