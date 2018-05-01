#define XX 0.55
#define YY 0.4
#define WW (XX * 2) - 0.17
#define HH 0.6
#define VER 0.009
#define VER1 0.065
#define VERU 0.2
#define VER2 0.14
#define BTNU 0.0135

class Liga_Brett1 {
	idd = 88888;
	name = "Liga_Brett";
	movingEnable = false;
	enableSimulation = false;
	onLoad = "if!(SKY_HC_aktiv_1)exitWith{closeDialog 0; hint 'Das Liga-Brett wird aufgrund hoher Beanspruchung ueberholt.. Versuche es spaeter nocheinmal ..';}; SKY_cl_diag_link = [1,1,player,life_id];	HC_id publicVariableClient 'SKY_cl_diag_link';";
	//onLoad = "[1]execVM 'fn_brett.sqf';";
	
class controlsBackground {
/*
	class HauptHG:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.0};
			idc = -1;
			x = 0.1 - XX + VER + VER1;
			y = 0.2 + (11 / 250) - YY + VERU;
			w = 0.95 + WW - (VER * 2) - VER1 - 0.1;
			h = 0.7 - (22 / 250)+ HH - VERU;
		};
	*/	
	class Backdrop : Life_RscPicture
		{
		idc = -1;
		text = "textures\brett.jpg";
			x = 0.1 - XX;
			y = 0.2 + (11 / 250) - YY;
			w = 0.95 + WW;
			h = 0.7 - (22 / 250)+ HH;
		};
				
   /*     
    class loBalken:Life_RscText {
			colorBackground[] = {0, 0.17, 0, 0.7};
			idc = -1;
			x = 0.11 - XX;
			y = 0.25 - YY;
			w = 0.2 + WW;
			h = (1 / 25);
		};
	
	class oBalken:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.5};
			idc = -1;
			x = 0.1 - XX + VER + VER1;
			y = 0.25 - YY + VERU;
			w = 0.95 + WW - (VER * 2) - VER1;
			h = (1 / 25) * 2;
		};

	class uBalken:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.5};
			idc = -1;
			x = 0.1 - XX + VER + VER1;
			y = 0.25 + 0.3 + (1 / 25) - YY + (HH /  2 );
			w = 0.95 + WW - (VER * 2) - VER1;
			h = (1 / 25) * 2;
		};
		*/
	};
	
	class controls {
		
		class oBalkenText : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88886;
			text = "";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2)";
			x = 0.1 - XX + VER + VER1;
			y = 0.25 - YY + VERU;
			w = 0.95 + WW - (VER * 2) - VER1;
			h = (1 / 25) * 2;
		};
		
		class uBalkenText : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88890;
			text = "Nachricht";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2)";
			x = 0.1 - XX + VER + VER1;
			y = 0.25 + 0.3 + (1 / 25) - YY + (HH /  2 ) ;
			w = 0.95 + WW - (VER * 2) - VER1;
			h = (1 / 25) * 2;
		};
		/*
		class ListeL : Life_RscListBox
		{
			idc = 98881;
			onLBSelChanged = "[2] spawn life_fnc_smartphone;";
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			x = 0.11 - XX;
			y = 0.25 + (1 / 25) - YY;
			w = 0.2 ;
			h = 0.5 + HH;
		};
		*/
		class ListeO : Life_RscListNBox
		{
			idc = 88882;
		//	onLBSelChanged = "[(lbCurSel 88882)] call life_fnc_showMsg;";
			onLBSelChanged = "[2,(lbCurSel 88882)]call liga_fn_brett";
			//sizeEx = 0.04;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)";
			colorBackground[] = {0, 0, 0, 0.0};
			columns[] = {0,0.3};
			x = 0.1 - XX + VER + VER1 + VER2;
			y = 0.25 + (1 / 25) - YY + VERU + 0.05;
			w = 0.95 + WW - (VER * 2) - VER1 - VER2;
			h = 0.3 + (HH / 2) - ( VERU + 0.05 ) - 0.026;
		};

		class ListeU : Life_RscControlsGroup {
			x = 0.1 - XX + VER + VER1 + VER2;
			y =  0.25 + 0.3 + (1 / 25) + (1 / 25) - YY + (HH /  2 ) + 0.05;
			w = 0.95 + WW - (VER * 2) - VER1 - VER2;
			h =  0.15 + (HH /  2 ) - 0.05 ;
			class HScrollbar : HScrollbar {
				height = 0;
			};
			class controls {
				class showText : Life_RscStructuredText {
					idc = 88887;
					text = "";
					colorBackground[] = {0.0,0.0,0.0,0.0};
					size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)";
					shadow = 1;
					x = 0;
					y = 0;
					w = 0.95 + WW - (VER * 2) - VER1 - 0.2;//w = 0.7;
					h = 1 + HH;//h = 2.15;
				};
			};
		};
		
		class Schreiben : Life_RscButtonMenu {
			idc = 887892;
			text = "Neu";
			onButtonClick = "createDialog ""Brett_schreiben""; ";
			class Attributes {
				font 	= "TahomaB";
				align 	= "center";
				size 	= "0.8";
			};			
			colorBackground[] = {0, 0.0, 0, 0.0};			
			x = 0.1 - XX + VER + 1.58;
			y = 0.25 + (1 / 25) + 0.51 - YY + HH - BTNU;
			w = 0.065;
			h = 0.03;
		};
		
		
		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "Schliessen";
			colorBackground[] ={0.0, 0, 0, 0.0};
			class Attributes {
				font 	= "TahomaB";
				align 	= "center";
				size 	= "0.8";
			};	
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH)) - XX + 0.01;
			y = 0.25 + (1 / 25) + 0.51 - YY + HH - BTNU;
			w = (6.25 / 40) - 0.002;
			h = 0.03;
		};
		

		class DeleteMessages : Life_RscButtonMenu {
			idc = -1;
			
			text = "löschen";
			onButtonClick = "closeDialog 0; SKY_cl_diag_link = [1,2,player];	HC_id publicVariableClient 'SKY_cl_diag_link';";
			
			
			class Attributes {
				font 	= "TahomaB";				
				align 	= "center";
				size 	= "0.8";
			};
			colorText[] = { 1.0, 0.0, 0.0, 1.0 };
			colorBackground[] = { 0.0, 0.0, 0.0, 0.0 };
			x = 0.7 - (6.25 / 40) - XX + 1.333;
			y = 0.25 + (1 / 25) + 0.51 - YY + HH - BTNU;
			w = (6.25 / 20) / 2 - 0.048;
			h = 0.03;
		};
	};
};
class Brett_schreiben
{
	idd = 88883;
	name = "Brett_schreiben";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "[0,(lbData[88881,(lbCurSel 88881)])] spawn life_fnc_newMsg;";
#define SYY 0.1	

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0, 0.15, 0, 0.6};	
			idc = -1;
			x = 0.1;
			y = 0.2 - SYY;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.5};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250) - SYY;
			w = 0.6;
			h = 0.21 + SYY;
		};
		
	};
	class controls {
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 88886;
			text = "Mitteilung schreiben";
			x = 0.11;
			y = 0.2 - SYY;
			w = 0.95;
			h = (1 / 25);
		};
		
		class Title1 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Betreff:";
			x = 0.11;
			y = 0.3 - 0.048 + 0.01 - (SYY / 2) -0.042;
			w = 0.95;
			h = (1 / 25);
		};
		
		class Title2 : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Mitteilung:";
			x = 0.11;
			y = 0.34 - 0.048 + 0.04 -0.042;
			w = 0.95;
			h = (1 / 25);
		};
		
		class Absenden : Life_RscButtonMenu {
			idc = 88885;
			text = "Schreiben";
			onButtonClick = "[(ctrlText 88884),(ctrlText 88891)]call liga_fn_BrettPit;";
			colorBackground[] = {0, 0.25, 0, 0.7};
			class Attributes {		align 	= "center";		};
			x = 0.6 - (6.25 / 40) + 0.088;
			y = 0.41 + (1 / 25)  - 0.048;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Close : Life_RscButtonMenu {
			idc = -1;
			colorBackground[] ={0.2, 0, 0, 0.7};
			text = "Schliessen";
			onButtonClick = "closeDialog 0;";
			class Attributes {		align 	= "center";		};
			x = 0.11;
			y = 0.41 + (1 / 25)  - 0.048;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class textEdit : Life_RscEdit {
			idc = 88884;
			text = "";
			sizeEx = 0.040;
			x = 0.11; y = 0.3 - 0.048 + 0.01 - (SYY / 2);
			w = 0.58; h = 0.04;
		};
		
		class textEdit1 : Life_RscEdit {
			idc = 88891;
			text = "";
			sizeEx = 0.040;
			x = 0.11; y = 0.34 - 0.048 + 0.04;
			w = 0.58; h = 0.04;
		};	
	};	
};
