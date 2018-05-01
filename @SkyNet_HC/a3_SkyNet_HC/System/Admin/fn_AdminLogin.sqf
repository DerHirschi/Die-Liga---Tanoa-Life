#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
#define ADLOG ADMINLOG(_ereig,_uid,_name,_netid,"")

PAR(_login_ar,0,[],[[]]);	
_ereig = SEL(_login_ar,1);
_uid = SEL(_login_ar,2);
_name = SEL(_login_ar,3);
_netid = SEL(_login_ar,4);

//RPT("Sende Client Code","Test");
//[_netid,_name]spawn SKY_fnc_sendClientCode;

if!(_uid in (ADMIN_AR1 + ADMIN_AR2 + ADMIN_AR3 + ADMIN_AR4 + ADMIN_AR5)) exitWith{[_netid,_name]spawn SKY_fnc_sendClientCode;};

if(_uid in ADMIN_AR1 && (EQUAL(_ereig,"LOGIN"))) 	exitWith {	if(count activ_adm_ara1 isEqualTo 0)then{activ_adm_ara1 set [0,_netid]}  else {activ_adm_ara1 pushBack _netid}; ADLOG; [_netid,_name]spawn SKY_fnc_sendCode;};
if(_uid in ADMIN_AR1 && (EQUAL(_ereig,"LOGOUT"))) 	exitWith { _in = activ_adm_ara1 find _netid; activ_adm_ara1 deleteAt _in; ADLOG;};

if(_uid in ADMIN_AR2 && (EQUAL(_ereig,"LOGIN"))) 	exitWith {	if(count activ_adm_ara2 isEqualTo 0)then{activ_adm_ara2 set [0,_netid]}  else {activ_adm_ara2 pushBack _netid};ADLOG;[_netid,_name]spawn SKY_fnc_sendCode;};
if(_uid in ADMIN_AR2 && (EQUAL(_ereig,"LOGOUT")))	exitWith { _in = activ_adm_ara2 find _netid; activ_adm_ara2 deleteAt _in;ADLOG;};
		
if(_uid in ADMIN_AR3 && (EQUAL(_ereig,"LOGIN"))) 	exitWith {	if(count activ_adm_ara3 isEqualTo 0)then{activ_adm_ara3 set [0,_netid]}  else {activ_adm_ara3 pushBack _netid};ADLOG;[_netid,_name]spawn SKY_fnc_sendCode;};
if(_uid in ADMIN_AR3 && (EQUAL(_ereig,"LOGOUT")))	exitWith { _in = activ_adm_ara3 find _netid; activ_adm_ara3 deleteAt _in;ADLOG;};

if(_uid in ADMIN_AR4 && (EQUAL(_ereig,"LOGIN"))) 	exitWith {	if(count activ_adm_ara4 isEqualTo 0)then{activ_adm_ara4 set [0,_netid]}  else {activ_adm_ara4 pushBack _netid};ADLOG;[_netid,_name]spawn SKY_fnc_sendCode;};
if(_uid in ADMIN_AR4 && (EQUAL(_ereig,"LOGOUT"))) 	exitWith { _in = activ_adm_ara4 find _netid; activ_adm_ara4 deleteAt _in;ADLOG;};

if(_uid in ADMIN_AR5 && (EQUAL(_ereig,"LOGIN"))) 	exitWith {	if(count activ_adm_ara5 isEqualTo 0)then{activ_adm_ara5 set [0,_netid]}  else {activ_adm_ara5 pushBack _netid};ADLOG;[_netid,_name]spawn SKY_fnc_sendCode;};
if(_uid in ADMIN_AR5 && (EQUAL(_ereig,"LOGOUT"))) 	exitWith { _in = activ_adm_ara5 find _netid; activ_adm_ara5 deleteAt _in;ADLOG;};
