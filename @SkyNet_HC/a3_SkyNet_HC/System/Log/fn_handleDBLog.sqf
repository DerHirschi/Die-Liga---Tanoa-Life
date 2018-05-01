#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"

/*
    file: fn_handleDBLog.sqf
    Author: Nukefliege
*/    
 
private["_betrag","_target","_player","_type"];
_test = _this select 0;

_player = [_test,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_target = [_test,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_betrag = [_test,2,-1] call BIS_fnc_param;
_type     = [_test,3,-1] call BIS_fnc_param;
_atm     = [_test,4,-1] call BIS_fnc_param;
_cash     = [_test,5,-1] call BIS_fnc_param;

switch(_type) do
{
    //Geld Überweisung
    case 0:
    {
        if(isNULL _target)  exitWith {};
        
        private["_query","_pid","_toID","_textType"];
        _pid = getPlayerUID _player;
        _toID = getPlayerUID _target;
        _fromName = name _player;
        _toName = name _target;
        _textType = "ATM Ueberweisung";
        
        _query = format["Geldlog:%1:%2:%3:%4:%5:%6:%7:%8",_pid,_toID,_betrag,_textType,_fromName,_toName,_cash,_atm];
        diag_log format["Query: %1",_query];
        
        DBCALL(1);
    };
    //Geld Bar
    case 1:
    {    
        if(isNULL _target)  exitWith {};
        
        private["_query","_pid","_toID","_textType"];
        _pid = getPlayerUID _player;
        _toID = getPlayerUID _target;
        _fromName = name _player;
        _toName = name _target;
        _textType = "BAR";
        
        _query = format["Geldlog:%1:%2:%3:%4:%5:%6:%7:%8",_pid,_toID,_betrag,_textType,_fromName,_toName,_cash,_atm];
        diag_log format["Query: %1",_query];
        
        DBCALL(1);
    };
    //Geld drop
    case 2:
    {    
        if(isNULL _target)  exitWith {};
        
        private["_query","_pid","_toID","_textType"];
        _pid = getPlayerUID _player;
        _toID = getPlayerUID _target;
        _fromName = name _player;
        _toName = name _target;
        _textType = "DROP";
        
        _query = format["Geldlog:%1:%2:%3:%4:%5:%6:%7:%8",_pid,_toID,_betrag,_textType,_fromName,_toName,_cash,_atm];
        diag_log format["Query: %1",_query];
        
        DBCALL(1);
    };
    //Geld Pickup
    case 3:
    {    
        if(isNULL _target)  exitWith {};
        
        private["_query","_pid","_toID","_textType"];
        _pid = getPlayerUID _player;
        _toID = getPlayerUID _target;
        _fromName = name _player;
        _toName = name _target;
        _textType = "PICKUP";
        
        _query = format["Geldlog:%1:%2:%3:%4:%5:%6:%7:%8",_pid,_toID,_betrag,_textType,_fromName,_toName,_cash,_atm];
        diag_log format["Query: %1",_query];
        
        DBCALL(1);
    };
    //Geld Robbed
    case 4:
    {    
        if(isNULL _target)  exitWith {};
        
        private["_query","_pid","_toID","_textType"];
        _pid = getPlayerUID _player;
        _toID = getPlayerUID _target;
        _fromName = name _player;
        _toName = name _target;
        _textType = "RAUB";
        
        _query = format["Geldlog:%1:%2:%3:%4:%5:%6:%7:%8",_pid,_toID,_betrag,_textType,_fromName,_toName,_cash,_atm];
        diag_log format["Query: %1",_query];
        
        DBCALL(1);
    };
	  
	  case 5:
    {    
        //if(_target isEqualTo "")  exitWith {};
        
        private["_query","_pid","_toID","_textType"];
        _pid = getPlayerUID _player;
        _toID = 0;
        _fromName = name _player;
        _toName = _betrag select 0;
        _textType = "VERKAUF";
		_betrag = _betrag select 1;
        
        _query = format["Geldlog:%1:%2:%3:%4:%5:%6:%7:%8",_pid,_toID,_betrag,_textType,_fromName,_toName,_cash,_atm];
        diag_log format["Query: %1",_query];
        
        DBCALL(1);
    };
	
	case 6:
    {    
        //if(_target isEqualTo "")  exitWith {};
        
        if(isNULL _target)  exitWith {};
        
        private["_query","_pid","_toID","_textType"];
        _pid = getPlayerUID _player;
        _toID = getPlayerUID _target;
        _fromName = name _player;
        _toName = name _target;
        _textType = "Kontobewegung ATM";
        
        _query = format["Geldlog:%1:%2:%3:%4:%5:%6:%7:%8",_pid,_toID,_betrag,_textType,_fromName,_toName,_cash,_atm];
        diag_log format["Query: %1",_query];
        
        DBCALL(1);
    };
	
	case 7:
    {    
        //if(_target isEqualTo "")  exitWith {};
        
        if(isNULL _target)  exitWith {};
        
        private["_query","_pid","_toID","_textType"];
        _pid = getPlayerUID _player;
        _toID = getPlayerUID _target;
        _fromName = name _player;
        _toName = name _target;
        _textType = "Kontobewegung Gang";
        
        _query = format["Geldlog:%1:%2:%3:%4:%5:%6:%7:%8",_pid,_toID,_betrag,_textType,_fromName,_toName,_cash,_atm];
        diag_log format["Query: %1",_query];
        
        DBCALL(1);
    };
	
	case 8:
    {    
        //if(_target isEqualTo "")  exitWith {};
        
        if(isNULL _target)  exitWith {};
        
        private["_query","_pid","_toID","_textType"];
        _pid = getPlayerUID _player;
        _toID = getPlayerUID _target;
        _fromName = name _player;
        _toName = name _target;
        _textType = "Haus ver- kaufe";
        
        _query = format["Geldlog:%1:%2:%3:%4:%5:%6:%7:%8",_pid,_toID,_betrag,_textType,_fromName,_toName,_cash,_atm];
        diag_log format["Query: %1",_query];
        
        DBCALL(1);
    };
	case 9:
    {    
        //if(_target isEqualTo "")  exitWith {};
        
        if(isNULL _target)  exitWith {};
        
        private["_query","_pid","_toID","_textType"];
        _pid = _player;
        _toID = _target;
        _fromName = name _player;
        _toName = name _target;
        _textType = "Kill LOGtrap";
        
        _query = format["Geldlog:%1:%2:%3:%4:%5:%6:%7:%8",_pid,_toID,_betrag,_textType,_fromName,_toName,_cash,_atm];
        diag_log format["Query: %1",_query];
        
        DBCALL(1);
    };
};