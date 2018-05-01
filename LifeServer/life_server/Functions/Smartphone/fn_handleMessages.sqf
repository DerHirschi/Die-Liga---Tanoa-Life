#include "\life_server\Liga_Macros.hpp"
/*

	file: fn_handleMessages.sqf
	Author: Silex

*/	
	
private["_msg","_to","_target","_player","_type"];

_msg = [_this,1,"",[""]] call BIS_fnc_param;
_player = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,-1] call BIS_fnc_param;

switch(_type) do
{
	//normal message
	case 0:
	{
		_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
		if(isNULL _target)  exitWith {};
		_to = call compile format["%1", _target];
		[[_msg,name _player,0],"life_fnc_clientMessage",_to,false] call life_fnc_MP;
		
		private["_query","_pid","_toID"];
		_pid = getPlayerUID _player;
		_toID = getPlayerUID _target;
		_msg = [_msg] call DB_fnc_mresString;
		_fromName = name _player;
		_toName = name _target;
		//_query = format["INSERT INTO messages (fromID, toID, message, fromName, toName) VALUES('%1', '%2', '""%3""', '%4', '%5')",_pid,_toID,_msg,_fromName,_toName];
		_query = format["MSGinsert:%1:%2:%3:%4:%5",_pid,_toID,_msg,_fromName,_toName];
/*
		diag_log "╔══════════════════════════════════════════╗";
		diag_log "║---------------------------  SQL Smartphone DB LOG     ------------------ ";
		diag_log "╠══════════════════════════════════════════╣";
		diag_log format["║Query: %1",_query];
		diag_log "╚══════════════════════════════════════════╝";
*/
		
		[_query,1] call DB_fnc_asyncCall;
	};
	//message to cops
	case 1:
	{	
		//[[_msg,name _player,1,_player],"life_fnc_clientMessage",west,false] call life_fnc_MP;
		if(!isNil "liga_cop_group") then {
			if(!isNull liga_cop_group) then {
				[_msg,name _player,1,_player] remoteExec ["life_fnc_clientMessage",liga_cop_group];
			};
		};
		
	};
	//to admins
	case 2:
	{	
		[[_msg,name _player,2],"life_fnc_clientMessage",true,false] call life_fnc_MP;
	};
	//ems request
	case 3:
	{	
		//[[_msg,name _player,5,_player],"life_fnc_clientMessage",independent,false] call life_fnc_MP;
		if(!isNil "liga_lrk_group") then {
			if(!isNull liga_lrk_group) then {
				[_msg,name _player,5,_player] remoteExec ["life_fnc_clientMessage",liga_lrk_group];
			};
		};				
		
	};
	//adminToPerson
	case 4:
	{
		_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
		_to = call compile format["%1", _target];
		if(isNull _to) exitWith {};
	
		[[_msg,name _player,3],"life_fnc_clientMessage",_to,false] call life_fnc_MP;
	};
	//adminMsgAll
	case 5:
	{
		[[_msg,name _player,4],"life_fnc_clientMessage",true,false] call life_fnc_MP;
	};
	//adac request
	case 6:
	{	
		[[_msg,name _player,6,_player],"life_fnc_clientMessage",east,false] call life_fnc_MP;
	};
	
	case 7: // Ofline MSG
	{
		_target = [_this,0,[],[[]]] call BIS_fnc_param;
		if(_target isEqualTo [])  exitWith {};
		//_to = call compile format["%1", _target];
		//[[_msg,name _player,0],"life_fnc_clientMessage",_to,false] call life_fnc_MP;
		
		private["_query","_pid","_toID"];
		_pid = getPlayerUID _player;
		//_toID = SEL(_target,1);
		//_toID = [SEL(_target,1)] call DB_fnc_mresString;
			
		_toID = SEL(_target,1);
		_msg = [_msg] call DB_fnc_mresString;
		_fromName = name _player;
		_toName = SEL(_target,0);
		//_query = format["INSERT INTO messages (fromID, toID, message, fromName, toName) VALUES('%1', '%2', '""%3""', '%4', '%5')",_pid,_toID,_msg,_fromName,_toName];
		_query = format["MSGinsert:%1:%2:%3:%4:%5",_pid,_toID,_msg,_fromName,_toName];

		diag_log "╔══════════════════════════════════════════╗";
		diag_log "║---------------------------  SQL Smartphone DB LOG     ------------------ ";
		diag_log "╠══════════════════════════════════════════╣";
		diag_log format["║Query: %1",_query];
		diag_log "╚══════════════════════════════════════════╝";

		
		[_query,1] call DB_fnc_asyncCall;
	};	

	case 8: // Lotto Offline MSG
	{
		_target = [_this,0,"",[""]] call BIS_fnc_param;
		if(_target isEqualTo "")  exitWith {};
		//_to = call compile format["%1", _target];
		//[[_msg,name _player,0],"life_fnc_clientMessage",_to,false] call life_fnc_MP;
		
		private["_query","_pid","_toID"];
		_pid = "000000000555";
		//_toID = SEL(_target,1);
		//_toID = [SEL(_target,1)] call DB_fnc_mresString;
			
		_toID =_target;
		_msg = [_msg] call DB_fnc_mresString;
		_fromName = "LoTTo Fee";
		_toName = "Gewinner";
		//_query = format["INSERT INTO messages (fromID, toID, message, fromName, toName) VALUES('%1', '%2', '""%3""', '%4', '%5')",_pid,_toID,_msg,_fromName,_toName];
		_query = format["MSGinsert:%1:%2:%3:%4:%5",_pid,_toID,_msg,_fromName,_toName];

		diag_log "╔══════════════════════════════════════════╗";
		diag_log "║---------------------------  SQL Smartphone DB LOG     ------------------ ";
		diag_log "╠══════════════════════════════════════════╣";
		diag_log format["║Query: %1",_query];
		diag_log "╚══════════════════════════════════════════╝";

		
		[_query,1] call DB_fnc_asyncCall;
	};	
	case 9:
	{
		_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
		if(isNULL _target)  exitWith {};

		[_msg,"LoTTo Fee",0] remoteExec ["life_fnc_clientMessage",_target];
		
		private["_query","_pid","_toID"];
		_pid = "000000000555";
		//_toID = SEL(_target,1);
		//_toID = [SEL(_target,1)] call DB_fnc_mresString;
			
		_toID = getPlayerUID _target;
		_msg = [_msg] call DB_fnc_mresString;
		_fromName = "LoTTo Fee";
		_toName = "Gewinner";
		//_query = format["INSERT INTO messages (fromID, toID, message, fromName, toName) VALUES('%1', '%2', '""%3""', '%4', '%5')",_pid,_toID,_msg,_fromName,_toName];
		_query = format["MSGinsert:%1:%2:%3:%4:%5",_pid,_toID,_msg,_fromName,_toName];

		diag_log "╔══════════════════════════════════════════╗";
		diag_log "║---------------------------  SQL Smartphone DB LOG     ------------------ ";
		diag_log "╠══════════════════════════════════════════╣";
		diag_log format["║Query: %1",_query];
		diag_log "╚══════════════════════════════════════════╝";

		
		[_query,1] call DB_fnc_asyncCall;
	};
	
};