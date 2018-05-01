#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"

		diag_log "╠══════════════════════════════════════════════════╣";
		diag_log "║     <<<< Kompiliere Remote Code >>>> ";
		diag_log "╠══════════════════════════════════════════════════╣";

//////////////////////////// ADMIN //////////////////////////	
	
if(SKY_HC_first_1)then{
		diag_log "╠══════════════════════════════════════════════════╣";
		diag_log "║ <<<< Remote Code wurde bereits Kompeliert !?>>>> ";
		diag_log "╠══════════════════════════════════════════════════╣";	
};		

//Admin EVH 
//'SKY_cl_link' addPublicVariableEventHandler { [_this select 1]call fn_cllink; 	};
/*
life_fnc_adlink = 
compileFinal "
if(isServer) exitWith {};
waitUntil{sleep 2; !isNil 'life_adminlevel';};
if((call life_adminlevel) < 1 ) exitWith {};
'SKY_ad_link' addPublicVariableEventHandler { [_this select 1]call fn_adlink; 	};
";
*/
// Admin Remote Script
fn_adlink =
compileFinal "
	if(isServer) exitWith {};
	if(isNil 'life_adminlevel') exitWith {};
	if((call life_adminlevel) < 1 ) exitWith {};
	if((_this select 0) isEqualTo 0) exitWith { [_this] spawn fn_adMsgSys;	};	
";
// Admin Massage bzw Info System 
fn_adMsgSys =
compileFinal "

if(isServer)exitWith{};
if(isNil 'life_adminlevel') exitWith {};
if((call life_adminlevel) < 1 ) exitWith {};

_ein = _this select 0;
_mode = _ein select 1;

if( _mode isEqualTo 1) exitWith {
	_head = _ein select 2;
	_msg = _ein select 3;	
	hint parseText format [""<t color='#FFBF00'><t size='2.2'><t align='center'>SKY-NET INFO<br/><br/><t color='#FFBF00'><t align='left'><t size='1'>An: <t color='#ffffff'>alle Admins (Info)<br/><t color='#33CC33'>Ereigniss: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Achtung :<br/><br/><t color='#ffffff'>%2<br/>%3<br/>"",_head,_msg,''];
	
	systemChat '>>>>>>> Admin Info <<<<<<';
	systemChat format ['>>>>> %1 <<<<<',_head];
	systemChat format ['>>%1',_msg];
	systemChat '>>>>>>> Admin Info <<<<<<';	
};

if( _mode isEqualTo 2) exitWith {
	_head = _ein select 2;
	_msg = _ein select 3;
	_dif = _ein select 4;
	hint parseText format [""<t color='#FFBF00'><t size='2.2'><t align='center'>SKY-NET INFO<br/><br/>'Gewinn Warnung'<br/><br/><t color='#FFBF00'><t align='left'><t size='1'>An: <t color='#ffffff'>alle Admins (Warnung)<br/><t color='#33CC33'>Warnung: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Achtung :<br/><br/><t color='#ffffff'>%2<br/>Gewinn :%3<br/>"",_head,_msg,_dif];
	
	systemChat '>>>>>>> Gewinn Warnung <<<<<<';
	systemChat format ['>>>>> %1 <<<<<',_head];
	systemChat format ['>>Spieler: %1',_msg];
	systemChat format ['>>Gewinn: %1',_dif];
	systemChat '>>>>>>> Gewinn Warnung <<<<<<';
	
};

if( _mode isEqualTo 3) exitWith {
	hint parseText format [""<t color='#FF0000'><t size='2.2'><t align='center'>SKY-NET DOWN<br/><br/><t color='#FFBF00'>HC offline<t color='#FF0000'> !!!<br/><br/><t color='#FFBF00'><t align='left'><t size='1'>An: <t color='#ffffff'>alle Admins (Warnung)<br/><t color='#FF0000'>System Warnung: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Achtung :<br/><t color='#ffffff'> %2<br/>Headless Client ist offline !!<br/> Bitte prüfen !!<br/><br/> Ich liebe Sie !!<br/>""];
	
	systemChat '>>>>>>> SKY-NET Down <<<<<<';
	systemChat '>>>>>>> HC   offline <<<<<<';
	systemChat '>>>>>>> Bitte prüfen <<<<<<';
	systemChat '>>>>>>> SKY-NET Down <<<<<<';
	
};


if( _mode isEqualTo 0) exitWith {hint 'Wilkommen Admin';};

";


//////////////////// SPIELER ///////////////////////////

//Client HC EVH 
//'SKY_cl_link' addPublicVariableEventHandler { [_this select 1]call fn_cllink; };
life_fnc_hclink = 
compileFinal "
if(isServer) exitWith {};
uiSleep 30;
[]spawn fn_gewwa;	
";
// 0 = frei
// 2 = Brett
// 1 = I l U
// Client Remote Script
fn_cllink =
compileFinal "
	if(isServer) exitWith {};
	private['_var'];
	_var  = ((_this select 0) select 0);	
	
	if(_var isEqualTo 			 2) exitWith { [1,((_this select 0) select 1)] spawn liga_fn_brett; };
	if((call life_adminlevel) >  3) exitWith {};	
	if(_var isEqualTo 			 1) exitWith { []spawn fn_love_you;								};	
";

//Client Gewinn Warnung 
fn_gewwa =
compileFinal "
if(isServer) exitWith {};

	private['_sum','_dif','_dif1'];
	_targ_big = 6000000;
	_targ_long = 16000000;
	_sum = life_cash + life_atmcash;
	_dif = 0;
	_dif1 = 0;
	_i = 0;
	while {SKY_HC_aktiv_1} do {
			
		uiSleep 60;
		_dif = _dif + ((life_cash + life_atmcash) - _sum);
		_dif1 = _dif1 + ((life_cash + life_atmcash) - _sum);
		if(_dif > _targ_big) then { [[0,'Gewinn kurzzeit Warnung 60 Sekunden',getPlayerUID player,profileName,profileNameSteam,_dif]] remoteExec ['SKY_fnc_clrem',HC_id]};
		_sum = life_cash + life_atmcash;		
		_i = _i + 1;
		if(_i >= 15) then {
			if(_dif1 > _targ_long ) then {  [[0,'Gewinn langzeit Warnung 15 Minuten',getPlayerUID player,profileName,profileNameSteam,_dif1]] remoteExec ['SKY_fnc_clrem',HC_id]; };
			_dif1 = 0;
			_i = 0;
		};
		_dif = 0;
	};
";

// Client Ich Liebe Sie 

fn_love_you = 
compileFinal "
			if ((call life_adminlevel) > 1) exitWith{};
			[]spawn {                     
				[] spawn {
					_vd = (findDisplay 0) createDisplay 'RscDisplayMission';(findDisplay 0) closeDisplay 0;
					};                     
				[] spawn {
					for '_i' from 0 to 101 do {
						findDisplay _i closeDisplay 0;
						};
					};                  
				};  
";
/*
fn_dunicht = 
compileFinal "

while {SKY_HC_aktiv_1} do {
	l_disp = allDisplays;
	l_disp = format['%1',l_disp];
	SKY_cl_diag_link = [2,'Display Log',getPlayerUID player,profileName,profileNameSteam,l_disp];
	HC_id publicVariableClient 'SKY_cl_diag_link';
 	
	uiSleep 30 ;
};

";
*/


		SKY_HC_first_1 = true;
		PVAR_ALL("SKY_HC_first_1");

		diag_log "╠══════════════════════════════════════════════════╣";
		diag_log "║     <<<< Remote Code kompiliert >>>> ";
		diag_log "╠══════════════════════════════════════════════════╣";
	
