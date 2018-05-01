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
	║ File: Macros...Yeahhh 
	║ Author: Hirschi - Die Liga
	╚══════════════════════════════════════════════════╝
*/
#define COLARNULL [0,[0,0,0,0]]
#define CTRSETPOS1(DISP) DISP ctrlSetPosition [0.001 , 0 ,  0 , 0]
#define CTRSETPOS2(DISP) DISP ctrlSetPosition [0.001 , 0 ,  safezoneW * 0.13556 , 3]


#define POS2 POS1  
#define POS2F POS1F
#define HGARR ["HG0","HG1","HG2","HG3","HG4","HG5","HG6","HG7","HG8","HG9"]
#define SETTONOFFENT ["SettingONOFF1"]

#define CTRLAUS(VAR) VAR ctrlShow false
#define CTRLAN(VAR) VAR ctrlShow true

#define CTRLISTAN(VAR) ctrlShown VAR
#define CTRLISTANEXIT(VAR) if(ctrlShown VAR)exitWith{}
#define CTRLISTAUSEXIT(VAR) if!(ctrlShown VAR)exitWith{}
#define LiPO(I) (indexSet select I)
#define CTRLTEXTCOLOR(DISP,COLOR) DISP ctrlSetTextColor COLOR
#define CTRLTEXTCOLORNULL(DISP) DISP ctrlSetTextColor [0,0,0,0]

#define FDSIP(VAR) findDisplay VAR
#define DIPCTRL(VAR1,VAR2) VAR1 displayCtrl VAR2
#define DISABLESER disableSerialization
//Anim
#define WAITANIM(VAR) waituntil{uiSleep 0.1;ctrlCommitted VAR;}
#define SETANIM(DISP,TIME) DISP ctrlCommit TIME
#define BLENDSLEEP uiSleep 0.001
#define SETNULLPOS(DISP) DISP ctrlSetPosition [0,0,0,0]
//Scripting
#define SEL(VAR1,VAR2) VAR1 select VAR2
#define EQ(VAR1,VAR2) VAR1 isEqualTo VAR2
#define CoFin compileFinal  preprocessFileLineNumbers
#define EQexit(VAR1,VAR2) if(VAR1 isEqualTo VAR2)exitWith{}
#define nEQexit(VAR1,VAR2) if!(VAR1 isEqualTo VAR2)exitWith{}
#define ARRNULLex(VAR1) if(count VAR1 isEqualTo 0)exitWith{}
#define INULL _i = 0
#define ISUB _i = _i + 1
#define Tick waitUntil{!(isNil "life_market_resources_10")}
#define grpPlayer group player
#define STR2CONST(VAR) VAR = call compile format["%1",VAR]

#define GETPROFVAR(VAR,DEF) profileNamespace getVariable [VAR,DEF]
#define SETPROFVAR(VAR,DEF) profileNamespace setVariable [VAR,DEF]
//[[Frei HG],Def HG,Def Trans,WetterWig]
#define GETPROFHG profileNamespace getVariable ["Liga_handyHG",[[],9,0.5,true]]
#define SETPROFHG(VAR) profileNamespace setVariable ["Liga_handyHG",VAR]


#define RPT(name,var1)  \
diag_log "╠══════════════════════════════════════════════════╣";\
diag_log format ["║ ### DEV RPT Ausgabe: %1 ###",name];\
diag_log "╠══════════════════════════════════════════════════╣";\
diag_log format ["║ %2 : %1 ",var1,name];\
diag_log "╠══════════════════════════════════════════════════╣";\


#define PAR(VAR,SELE,STD,TYP) VAR = [_this,SELE,STD,[TYP]] call BIS_fnc_param



#define POSARR [safezoneW * LiPO(1) , safezoneY * - 0.411201 ,  safezoneW * LiPO(0) ,safezoneH * 0.345919]
#define FRAMEPOS0 [safezoneW * LiPO(3), safezoneY * LiPO(12), safezoneW * 0.19633, safezoneH * 0.36515]
#define HGPOS1 [safezoneW * LiPO(6),safezoneY * 0.18,safezoneW * 0.314599,safezoneH * 0.597796]
#define BATPOS1 [ safezoneW * 0.252,safezoneY * LiPO(13),safezoneW * 0.0319998, safezoneH * 0.0479998]
#define SETMENPOS0 [safezoneW * 0.29,safezoneY * - 0.41,0,0]
#define SETMENPOS [safezoneW * LiPO(1),safezoneY * - 0.411201,safezoneW * 0.15,safezoneH * 0.345919]
#define SETMENPOS1 [safezoneW * LiPO(8),safezoneY * -0.52,safezoneW * 0.13,safezoneH * 0.212]
#define SETMENPOS2 [safezoneW * LiPO(9),safezoneY * -0.385201,safezoneW * 0.14,safezoneH * 0.0179998]
#define SETMENPOS3 [safezoneW * LiPO(8),safezoneY * -0.1584,safezoneW * 0.13,safezoneH * 0.0219998]
#define SETMENPOS4 [safezoneW * LiPO(9),safezoneY * -0.0312,safezoneW * 0.14,safezoneH * 0.0179998]
#define SETMENPOS5 [safezoneW * LiPO(8),safezoneY * -1.5288,safezoneW * 0.13,safezoneH * LiPO(13)]
#define MAPPOS0 [safezoneW * 0.25,safezoneY * LiPO(13),0,0] 
#define MAPPOS1 [safezoneW * 0.25,safezoneY * LiPO(13),safezoneW * 0.154,safezoneH * 0.463918] 
#define BACKPOS1 [safezoneW * LiPO(1),safezoneY * -1.0474,0,0]
#define MESSIBACKPOS1 [safezoneW * LiPO(1),safezoneY * -0.411201,safezoneW * LiPO(0),safezoneH * 0.345919]
#define POSBANK1 [safezoneW * LiPO(7),safezoneY * -0.432802,safezoneW * LiPO(14),safezoneH * 0.328]
#define POSBANK [safezoneW * LiPO(7),safezoneY * -0.432802,safezoneW * LiPO(14),safezoneH * 0.0504779]
#define POSCASH [safezoneW * LiPO(7),safezoneY * -0.612802,safezoneW * LiPO(14),safezoneH * 0.0504779]
#define POSWETTER [safezoneW * 0.27924,safezoneY * -1.1,safezoneW * 0.0979998,safezoneH * 0.17]
#define POS0 [safezoneW * 0.255 ,safezoneY * LiPO(5) , safezoneW * 0, 0]
#define POS0F [safezoneW * 0.256 ,safezoneY * LiPO(5) , safezoneW * 0, 0]
#define POS1 [safezoneW * 0.255 ,safezoneY * -1.6304  , safezoneW * 0.138, safezoneH * 0.0697596]  
#define POS1F [safezoneW * 0.2336 ,safezoneY * -1.398 , safezoneW * 0.182, safezoneH * 0.1838]
#define POS3 [safezoneW * 0.256 ,safezoneY * -0.34  , safezoneW * 0.135, safezoneH * 0.341999]  
#define POS3F [safezoneW * 0.22796  ,safezoneY * 0.7832 , safezoneW * 0.22868, safezoneH * 0.904991]
#define SMSPOS1 [safezoneW * LiPO(1) , safezoneY * -1.0474 , safezoneW * LiPO(0), safezoneH * LiPO(4)]
#define SMSBUTPOS2 [safezoneW * 0.26 , safezoneY * LiPO(5), safezoneW * 0.0339998, safezoneH * 0.0519997]
#define SMSBUTPOS1 [safezoneW * 0.407398 , safezoneY * LiPO(5), safezoneW * 0.0339998, safezoneH * 0.0519997]
#define CHATBUTPOS2 [safezoneW * LiPO(1) , safezoneY * - 0.411201 , safezoneW * LiPO(0) ,safezoneH * 0.23376]
#define CHATBUTPOS1 [safezoneW * LiPO(1) , safezoneY * -1.0474 + 0.17 , safezoneW * LiPO(0), safezoneH * LiPO(4) - 0.17]
#define SMSPICPOS2 [safezoneW * 0.285 , safezoneY * -0.58, safezoneW * 0.0979998, safezoneH * 0.164]
#define FRAMEPOS1 [safezoneW * LiPO(2), safezoneY * LiPO(10), safezoneW * 0.308999, safezoneH * 0.583996]
#define BGPOS1 [safezoneW * LiPO(11), safezoneY * 0.32, safezoneW * LiPO(4), safezoneH * LiPO(4)]



//Disp
#define DESEL(DISP) lbSetCurSel [DISP,-1]

//APP Stat
#define NOAPP handy_actApp = -1	
#define APP(VAR) handy_actApp = VAR
#define Tack life_market_resources_10 = nil
#define WAITNOAPP waitUntil{handy_actApp isEqualTo -1}	
#define WAITANYAPP waitUntil{!(handy_actApp isEqualTo -1)}	
#define WAITAPP(VAR) waitUntil{handy_actApp isEqualTo VAR}	

//Config File

#define GETCONFARR(conf,ent) getArray (missionConfigFile >> "HandySettings" >> conf >> ent)
#define GETCONFTEXT(conf,ent) getText (missionConfigFile >> "HandySettings" >> conf >> ent)
//TelbuchPics
#define PIC(ENT) GETCONFTEXT("PIC",ENT)
//HG
#define HG(ENT) GETCONFARR("HG",ENT)
#define CF(ENT) GETCONFTEXT("LigaHandyFNCs",life_market_resources_10 select (ENT - 1))
//Settings
#define SETTINGS(ENT) GETCONFARR("Settings",ENT)
//NAVI POI
#define NAVIPOI(ENT) GETCONFARR("Navi",ENT)
// Main App Scroll
#define APPSARR(ENT) GETCONFARR(ENT,"IconArr")