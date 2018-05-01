#define XX 0.75
#define YY 0.59	
#define HH 1
#define WW 0.52 
#define XBTN 0.159
#define YBTN 0.2 + (11 / 250) - YY
#define BTNSP 0.005
#define HBTN ( 1 / 40 )
#define BTNSCHG 0.025
#define BTNTRANS 0.6
#define ICE 0.1

class life_admin_menu {
	
	idd = 2900;
	name= "life_admin_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_adminMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0, 0.15, 0, BTNTRANS};		
			idc = -1;
			x = 0.1 - XX + ICE;
			y = 0.2 - YY;
			w = 0.8 + WW;
			h = (1 / 25);
		};
	/*
		class Backdrop : Life_RscPicture
		{
		idc = -1;
		text = "logo.jpg";
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
		};
	*/
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, BTNTRANS};
			idc = -1;
			x = 0.1 - XX + ICE;
			y = 0.2 + (11 / 250) - YY;
			w = 0.8 + WW;
			h = 0.6 - (2 / 250) + HH;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2901;
			text = "Liga Admin und Support Menü";
			x = 0.1 - XX + ICE;
			y = 0.2 - YY;
			w = 0.6 + WW;
			h = (1 / 25);
		};
		
		class Life_RscTitle1Background:Life_RscText {
			colorBackground[] = {0, 0.15, 0, BTNTRANS};		
			idc = -1;
			x = 0.172 + ICE;
			y =  0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 9) - (BTNSP * 2) ;
			w = (((6.25 / 40) + BTNSP) * 3) - BTNSP;
			h = (1 / 25);
		};
		
		class Title1 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Support Garage ATM usw.";
			class Attributes {    align = "center"; };
			x = 0.172 + ICE;
			y =  0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 9) - (BTNSP * 2) ;
			w = (((6.25 / 40) + BTNSP) * 3) - BTNSP;
			h = (1 / 25);
		};
		
		class PlayerList_Admin : Life_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			onLBSelChanged = "if((call life_adminlevel > 4)) exitWith {[_this] spawn life_fnc_adminQuery};   if!(SKY_HC_aktiv_1)exitWith{};  [_this] spawn life_fnc_adminQuery;[]spawn{ sleep 1; [0,'Spieler Info','','']call life_fnc_toSt;};";
			
			x = 0.12 - XX + ICE; 
			y = 0.26 - YY;
			w = 0.30 + WW - 0.03;
			h = 0.5 + HH;
		};
		
		class PlayerBInfo : Life_RscStructuredText
		{
			idc = 2903;
			text = "";
			x = 0.42 - XX + WW + ICE;
			y = 0.25 - YY;
			w = 0.35;
			h = 0.6 + HH;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			colorBackground[] ={0.2, 0, 0, BTNTRANS};			
			text = "$STR_Global_Close";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "closeDialog 0;";
			x = XBTN + WW + ICE;
			y = YBTN;
			w = (6.25 / 40);
			h = HBTN;
		};
		
		class AdminID : Life_RscButtonMenu {
			idc = 2304;
			colorBackground[] ={0, 0, 0.2, BTNTRANS};
			text = "ID abfrage";
			
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [0,'ID abfrage','','']call life_fnc_toSt; [] call life_fnc_admingetID;";
			x = XBTN + WW + ICE;
			y = YBTN + HBTN + BTNSP;
			w = (6.25 / 40);
			h = HBTN;
		};
		
		class Admin17 : Life_RscButtonMenu {
			colorBackground[] ={0.2, 0.2, 0, BTNTRANS};
			idc = 2305;
			text = "Position";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "hintSilent str getPos player;";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 2);
			w = (6.25 / 40);
			h = HBTN;
			};
			
		class Admin18 : Life_RscButtonMenu {
			colorBackground[] ={0, 0.15, 0, BTNTRANS};
			idc = 2306;
			text = "Airdrop";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [1,'Airdrop ausgeloest','','']call life_fnc_toSt; [] call life_fnc_airdrop;";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 3);
			w = (6.25 / 40);
			h = HBTN;
			};
			
		class Admin19 : Life_RscButtonMenu {
			colorBackground[] ={0, 0.15, 0, BTNTRANS};
			idc = 2307;
			text = "COP Menue";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [1,'Cop Menu','','']call life_fnc_toSt;  closeDialog 0; cop_m = true;";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 4);
			w = (6.25 / 40);
			h = HBTN;		
		};		
		
		class Admin20 : Life_RscButtonMenu {
			colorBackground[] ={0, 0.15, 0.15, BTNTRANS};
			idc = 2308;
			text = "FPS LOG";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "[] execVM ""Liga\ScriptBench.sqf""; hint "" FPS Log gestartet. Laufzeit 5 Minuten!!!"" ";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 5);
			w = (6.25 / 40);
			h = HBTN;		
		};		
		
		class Admin21 : Life_RscButtonMenu {
			colorBackground[] ={0, 0.15, 0.15, BTNTRANS};
			idc = 2309;
			text = "Liga News";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [1,'Liga News','','']call life_fnc_toSt; createDialog ""channel""; ";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 6);
			w = (6.25 / 40);
			h = HBTN;		
		};	
		
		class Admin30 : Life_RscButtonMenu {
			colorBackground[] ={0, 0.15, 0.15, BTNTRANS};
			idc = 2310;
			text = "Debug RPT";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "ad_debugRPT = true;	ad_debugHint = true; ";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 7);
			w = (6.25 / 40);
			h = HBTN;		
		};		
		
		class Admin22 : Life_RscButtonMenu {
			colorBackground[] ={0.6, 0.45, 0.15, BTNTRANS};
			idc = 2311;
			text = "Inv +";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [1,'Inventar','++++','']call life_fnc_toSt; life_maxWeight = 1544; ";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 8);
			w = (6.25 / 40);
			h = HBTN;		
		};		
		
		class Admin23 : Life_RscButtonMenu {
			colorBackground[] ={0.6, 0.7, 0, BTNTRANS};
			idc = 2312;
			text = "Bombe";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [1,'Atom Bombe','','']call life_fnc_toSt; nu_de = true; publicVariable 'nu_de';";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 9);
			w = (6.25 / 40);
			h = HBTN;		
		};	
		
		class Admin24 : Life_RscButtonMenu {
			colorBackground[] ={0.1, 0, 0.6, BTNTRANS};
			idc = 2313;
			text = "Wanted";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [1,'Wanted Menu','','']call life_fnc_toSt; [] call life_fnc_wantedMenu;";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 10);
			w = (6.25 / 40);
			h = HBTN;		
		};	
		
		class Admin25 : Life_RscButtonMenu {
			colorBackground[] ={0.3, 0, 0.6, BTNTRANS};
			idc = 2314;
			text = "Baustelle";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [1,'Baustellen Noti','','']call life_fnc_toSt; [] call life_fnc_BauNoti;";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 11);
			w = (6.25 / 40);
			h = HBTN;		
		};	
		
		class Admin26 : Life_RscButtonMenu {
			colorBackground[] ={0.6, 0.45, 0, BTNTRANS};
			idc = 2315;
			text = "Inv Normal";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [1,'Inventar','Normal','']call life_fnc_toSt; life_maxWeight = 64; ";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 12);
			w = (6.25 / 40);
			h = HBTN;		
		};		
		
		class Admin27 : Life_RscButtonMenu {
			colorBackground[] ={0.81, 0.81, 0.81, BTNTRANS};
			idc = 2316;
			text = "Schnee";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [1,'Schnee','','']call life_fnc_toSt; [] call life_fnc_schnee; ";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 13);
			w = (6.25 / 40);
			h = HBTN;		
		};		

		class Admin28 : Life_RscButtonMenu {
			colorBackground[] ={0.0, 0.0, 1.0, 1.0};
			idc = 2325;
			text = "Airdrop Bug"; 			// Frei belegbar
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			// font = "LucidaConsoleB";
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [1,'Airdrop BUG','','']call life_fnc_toSt; airdrop_enable = true; airdrop_goingon = false; publicVariable 'airdrop_enable';publicVariable 'airdrop_goingon';";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 14);
			w = (6.25 / 40);
			h = HBTN;		
			// onButtonClick = " createDialog 'Wir_lieben_Sie_wirklich';"; // <- Frei belegbar
		};		
		
		class Admin29 : Life_RscButtonMenu {
			colorBackground[] ={0.0, 1.0, 0.0, 1.0};
			idc = 2326;
			text = "Comm Marker"; 			// Com Marker setzen
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			// font = "LucidaConsoleB";
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [1,'COM Marker gesetzt','','']call life_fnc_toSt; []spawn {_marker1 = createMarker ['comrund2', position player];	_marker1 setMarkerColor 'ColorGreen';_marker1 setMarkerType 'Select';	_marker1 setMarkerText ' <-- Community Runde';	_marker1 setMarkerSize [2,2];	while {true} do {_marker1 setMarkerColor 'ColorGreen';	sleep 1.6;_marker1 setMarkerColor 'ColorRed';	sleep 1.6;	_marker1 setMarkerColor 'ColorYellow';	sleep 1.6;	_marker1 setMarkerColor 'ColorPink';sleep 1.6;	_marker1 setMarkerColor 'ColorBlue';sleep 1.6;	};};";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 15);
			w = (6.25 / 40);
			h = HBTN;		
			// onButtonClick = " createDialog 'Wir_lieben_Sie_wirklich';"; // <- Frei belegbar
		};	
		
		class Admin31 : Life_RscButtonMenu {
			colorBackground[] ={1.0, 0.0, 0.0, 1.0};
			idc = 2327;
			text = "Comm Marker"; 			// Com Marker löschen
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			// font = "LucidaConsoleB";
			onButtonClick = "deleteMarker 'comrund2';";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 16);
			w = (6.25 / 40);
			h = HBTN;		
			// onButtonClick = " createDialog 'Wir_lieben_Sie_wirklich';"; // <- Frei belegbar
		};		
		
		class Admin32 : Life_RscButtonMenu {
			colorBackground[] ={1.0, 0.3, 0.6, 1.0};
			idc = 2328;
			text = "Trunk Bug"; 			// Inventar Bug wenn Spieler verbindung verlieren ( Kommen nicht ins Inventa )
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			// font = "LucidaConsoleB";
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [1,'Trunk Bug','Car','']call life_fnc_toSt; [] spawn {   _vehicle = nearestObject [player, 'car'];    hint format ['%1',_vehicle];   _vehicle setVariable['trunk_in_use',false,true];};";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 17);
			w = (6.25 / 40);
			h = HBTN;		
			// onButtonClick = " createDialog 'Wir_lieben_Sie_wirklich';"; // <- Frei belegbar
		};
		
		class Admin33 : Life_RscButtonMenu {
			colorBackground[] ={0.0, 0.0, 1.0, 1.0};
			idc = 2329;
			text = "Disp Scan";  			// Wetter Unterdisplay
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			// font = "LucidaConsoleB";
			
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 18);
			w = (6.25 / 40);
			h = HBTN;		
			onButtonClick = "  if((call life_adminlevel < 5)) exitWith{}; [] remoteExec ['SPY_fnc_menuCheck',ad_targ_uni];    hint 'Los';"; // <- Frei belegbar
		};
		
		class Admin34 : Life_RscButtonMenu {
			colorBackground[] ={0.0, 0.0, 1.0, 1.0};
			idc = 2330;
			text = "House Tr Bug"; 			// Frei belegbar
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			// font = "LucidaConsoleB";
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [0,'Trunk Bug','Haus','']call life_fnc_toSt;  [] spawn {  _vehicle = nearestObject [player, 'House'];    hint format ['%1',_vehicle];    _vehicle setVariable['trunk_in_use',false,true]; };";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 19);
			w = (6.25 / 40);
			h = HBTN;		
			// onButtonClick = " createDialog 'Wir_lieben_Sie_wirklich';"; // <- Frei belegbar
		};
		
		class Admin35 : Life_RscButtonMenu {
			colorBackground[] ={1.0, 0.0, 0.0, 1.0};
			idc = 2333;
			text = "Ich liebe Sie"; 			
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			// font = "LucidaConsoleB";
			onButtonClick = " [0]spawn life_fnc_funcs; ";
			x = XBTN + WW + ICE;
			y = YBTN + ((HBTN + BTNSP) * 25);
			w = (6.25 / 40);
			h = HBTN;		
			// onButtonClick = " createDialog 'Wir_lieben_Sie_wirklich';"; // <- Untermenü der wirklich Liebenden
		};		
		
// Gross Knöppe unten .,.. 

		class uAdmin1 : Life_RscButtonMenu {
			colorBackground[] ={0.81, 0.81, 0.81, BTNTRANS};
			idc = 2317;
			text = "Air";
			class Attributes {    align = "center"; };
			//size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};  [[getPlayerUID ad_targ_uni,side ad_targ_uni,'Air',player],'TON_fnc_getVehiclesSupp',false,false] call life_fnc_MP; createDialog 'Life_impound_menu';	disableSerialization; ctrlShow[2804,false];ctrlShow[2805,false];if!(SKY_HC_aktiv_1)exitWith{hint 'HC nicht online !!'; ctrlShow[2806,false];}; ctrlShow[2806,true]; ";
			x = 0.172 + ICE;
			y =  0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 8) - BTNSP;
			w = (6.25 / 40);
			h = (1 / 25);		
		};	

		class uAdmin2 : Life_RscButtonMenu {
			colorBackground[] ={0.81, 0.81, 0.81, BTNTRANS};
			idc = 2318;
			text = "Car";
			class Attributes {    align = "center"; };
			//size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};  [[getPlayerUID ad_targ_uni,side ad_targ_uni,'Car',player],'TON_fnc_getVehiclesSupp',false,false] call life_fnc_MP; createDialog 'Life_impound_menu';	disableSerialization; ctrlShow[2804,false];ctrlShow[2805,false];  if!(SKY_HC_aktiv_1)exitWith{hint 'HC nicht online !!'; ctrlShow[2806,false]; };   ctrlShow[2806,true]; ";
			x = 0.172 + (6.25 / 40) + BTNSP + ICE;
			y =  0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 8) - BTNSP ;
			w = (6.25 / 40);
			h = (1 / 25);		
		};	
		
		class uAdmin3 : Life_RscButtonMenu {
			colorBackground[] ={0.81, 0.81, 0.81, BTNTRANS};
			idc = 2319;
			text = "Ship";
			class Attributes {    align = "center"; };
			//size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [[getPlayerUID ad_targ_uni,side ad_targ_uni,'Ship',player],'TON_fnc_getVehiclesSupp',false,false] call life_fnc_MP; createDialog 'Life_impound_menu';	disableSerialization; ctrlShow[2804,false];ctrlShow[2805,false]; if!(SKY_HC_aktiv_1)exitWith{ctrlShow[2806,false];}; ctrlShow[2806,true]; ";
			x = 0.172 + (((6.25 / 40) + BTNSP) * 2) + ICE;
			y =  0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 8) - BTNSP;
			w = (6.25 / 40);
			h = (1 / 25);		
		};		
		
		
		
		class uAdmin4 : Life_RscButtonMenu {
			colorBackground[] ={1, 0.3, 0, BTNTRANS};
			idc = 2320;
			text = "Air";
			class Attributes {    align = "center"; };
			//size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; [[getPlayerUID ad_targ_uni,side ad_targ_uni,'Air',player],'TON_fnc_getVehicles',false,false] call life_fnc_MP; createDialog 'Life_impound_menu';	disableSerialization; ctrlShow[2804,false];ctrlShow[2805,false]; ctrlShow[2806,false]; [1,'Garage abgefragt','AIR','']call life_fnc_toSt; ";
			x = 0.172 + ICE;
			y =  0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 6) - BTNSP;
			w = (6.25 / 40);
			h = (1 / 25);		
		};	

		class uAdmin5 : Life_RscButtonMenu {
			colorBackground[] ={1, 0.3, 0, BTNTRANS};
			idc = 2321;
			text = "Car";
			class Attributes {    align = "center"; };
			//size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};  [[getPlayerUID ad_targ_uni,side ad_targ_uni,'Car',player],'TON_fnc_getVehicles',false,false] call life_fnc_MP; createDialog 'Life_impound_menu';	disableSerialization; ctrlShow[2804,false];ctrlShow[2805,false]; ctrlShow[2806,false]; [1,'Garage abgefragt','CAR','']call life_fnc_toSt;";
			x = 0.172 + (6.25 / 40) + BTNSP + ICE;
			y =  0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 6) - BTNSP ;
			w = (6.25 / 40);
			h = (1 / 25);		
		};	
		
		class uAdmin6 : Life_RscButtonMenu {
			colorBackground[] ={1, 0.3, 0, BTNTRANS};
			idc = 2322;
			text = "Ship";
			class Attributes {    align = "center"; };
			//size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};  [[getPlayerUID ad_targ_uni,side ad_targ_uni,'Ship',player],'TON_fnc_getVehicles',false,false] call life_fnc_MP; createDialog 'Life_impound_menu';	disableSerialization; ctrlShow[2804,false];ctrlShow[2805,false]; ctrlShow[2806,false]; [1,'Garage abgefragt','Ship','']call life_fnc_toSt;";
			x = 0.172 + (((6.25 / 40) + BTNSP) * 2) + ICE;
			y =  0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 6) - BTNSP;
			w = (6.25 / 40);
			h = (1 / 25);		
		};	

		class uAdmin7 : Life_RscButtonMenu {
			colorBackground[] ={1, 0.3, 0, BTNTRANS};
			idc = 2323;
			text = "IMP";
			class Attributes {    align = "center"; };
			//size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};   [[getPlayerUID ad_targ_uni,side ad_targ_uni,'IMP',player],'TON_fnc_getVehicles',false,false] call life_fnc_MP; createDialog 'Life_impound_menu'; disableSerialization;	ctrlShow[2804,false];ctrlShow[2805,false]; ctrlShow[2806,false];";
			x = 0.172 + (((6.25 / 40) + BTNSP) * 2) + ICE;
			y =  0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 4) - BTNSP;
			w = (6.25 / 40);
			h = (1 / 25);		
		};	
		
		
		class uAdmin8 : Life_RscButtonMenu {
			colorBackground[] ={0, 0.8, 0, BTNTRANS};
			idc = 2324;
			text = "Supp ATM";
			class Attributes {    align = "center"; };
			//size = BTNSCHG;
			onButtonClick = " if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};  []spawn life_fnc_SuppATM; ";
			x = 0.172 + ((6.25 / 40) + BTNSP) + ICE;
			y =  0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 7) - BTNSP;
			w = (6.25 / 40);
			h = (1 / 25);		
		};	

		class uAdmin9 : Life_RscButtonMenu {
			colorBackground[] ={0, 0, 0.8, BTNTRANS};
			idc = 2334;
			text = "Clan Liz";
			class Attributes {    align = "center"; };
			//size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};  closeDialog 0; [0]spawn life_fnc_adumenu; ";
			x = 0.172 + ICE;
			y = 0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 7) - BTNSP;
			w = (6.25 / 40);
			h = (1 / 25);		
		};		
		
		class uAdmin10 : Life_RscButtonMenu {
			colorBackground[] ={0.1, 1, 0, BTNTRANS};
			idc = 2335;
			text = "Brett";
			class Attributes {    align = "center"; };
			//size = BTNSCHG;
			onButtonClick = "createDialog 'Liga_Brett1'; ";
			x = 0.172 + ICE;
			y = 0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 5) - BTNSP;
			w = (6.25 / 40);
			h = (1 / 25);		
		};	
		
		class uAdmin11 : Life_RscButtonMenu {
			colorBackground[] ={0.8, 0.3, 0, BTNTRANS};
			idc = 2336;
			text = "Shop" ;
			class Attributes {    align = "center"; };
			//size = BTNSCHG;
			onButtonClick = " if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};}; createDialog 'shops_menu'; [] call life_fnc_SuppShop; ";
			x = 0.172 + ((6.25 / 40) + BTNSP) + ICE;
			y =  0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 5) - BTNSP;
			w = (6.25 / 40);
			h = (1 / 25);		
		};		

		class uAdmin12 : Life_RscButtonMenu {
			colorBackground[] ={1, 0.3, 0, BTNTRANS};
			idc = 2331;
			text = "CHOP";
			class Attributes {    align = "center"; };
			//size = BTNSCHG;
			onButtonClick = "if((call life_adminlevel < 5)) then {if!(SKY_HC_aktiv_1)exitWith{};};   [[getPlayerUID ad_targ_uni,side ad_targ_uni,'CHOP',player],'TON_fnc_getVehicles',false,false] call life_fnc_MP; createDialog 'Life_impound_menu'; disableSerialization;	ctrlShow[2804,false];ctrlShow[2805,false]; ctrlShow[2806,false];";
			x = 0.172 + (((6.25 / 40) + BTNSP) * 2) + ICE;
			y =  0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 5) - BTNSP;
			w = (6.25 / 40);
			h = (1 / 25);		
		};			

// unten rechts klein .. 
/*
		class urAdmin1 : Life_RscButtonMenu {
			colorBackground[] ={0, 0.81, 0, BTNTRANS};
			idc = 2324;
			text = "Supp ATM";
			class Attributes {    align = "center"; };
			size = BTNSCHG;
			onButtonClick = " ";
			x = XBTN + WW;
			y =  0.2 + (11 / 250) - YY + 1.592 - (((1 / 25)+ BTNSP) * 8) - BTNSP;
			w = (6.25 / 40);
			h = HBTN;		
		};	
*/		
	};
};
