/*
╔══════════════════════════════════════════════════╗
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
╠══════════════════════════════════════════════════╝
║ File: fn_ComBaustellLOG.sqf
║ Author: Hirschi Liga-Life
║
║ Description:
║ Liga Baustelle Loggen für Preisgewinn
╚══════════════════════════════════════════════════╝
*/

//private["_it_1","_var_2","_var_3","_query","_var_4","_it_2","_it_3","_it_4"];

//_array,_uid,_row 
//["a5","stt","cement","glass"]; 
_var_1 = _this select 0;

_var_3 = _this select 1;
_var_4 = _this select 2;

_it_1 = _var_1 select 0;
_it_2 = _var_1 select 1;
_it_3 = _var_1 select 2;
_it_4 = _var_1 select 3;
        
        //_query = format["INSERT INTO baulog (uid, spplatten_a5 , sttraeger_stt, cement, glass ,gesamtmenge) VALUES('%1', '%2', '%3', '%4',  '%5',  '%6')",_var_3,_it_1,_it_2,_it_3,_it_4,_var_4];
        _query = format["BaustLOG:%1:%2:%3:%4:%5:%6",_var_3,_it_1,_it_2,_it_3,_it_4,_var_4];
        diag_log format["Query: %1",_query];
      //  
        [_query,1] call DB_fnc_asyncCall;
