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
║ File: LigaHandy.hpp
║ Author: Hirschi - Die Liga
╚══════════════════════════════════════════════════╝
*/

class liga_handy {
	idd = 88888;
	name= "liga_handy";
	movingEnable = true;
	enableSimulation = 0;
		
	class controlsBackground {
			

		class HGbild : Life_RscPicture {
			//colorBackground[] = {0, 0, 0, 0.75};
			text = "";
			idc = 88886;
			   x = 0 ;
			   y = 0 ;
			   w = 0 ;
			   h = 0 ;
		};	

		class HGbild1 : Life_RscPicture {
			//colorBackground[] = {0, 0, 0, 0.75};
			text = "";
			idc = 88880;
			   x = 0 ;
			   y = 0 ;
			   w = 0 ;
			   h = 0 ;
		};	
		
		class HGmain : Life_RscPicture {
			//colorBackground[] = {0, 0, 0, 0.75};
			text = "textures\Handy\Handy-hintergrund1.5.paa";			
			idc = 88889;
			   x = 0 ;
			   y = 0 ;
			   w = 0 ;
			   h = 0 ;
		};			
		class MapKlein : Liga_RscMapControl 
		{
			idc = 88885;			
			   x = safezoneW  ;
			   y = safezoneY ;
			   w = safezoneW * 0.15 ;
			   h = safezoneH * 0.46 ;
			maxSatelliteAlpha = 0.78;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};	

		class Batt : Life_RscPicture {
			colorText[] = { 0,0,0,0 };
			text = "textures\Handy\Batterie\Batterie5.1.paa";
			idc = 88881;
			   x = safezoneW ;
			   y = safezoneY ;
			   w = safezoneW * 0.0319998 ;
			   h = safezoneH * 0.0479998 ;
		};			
		
		
		class LOGO : Life_RscPicture {
			//colorBackground[] = {0,0, 0, 0};	
			colorText[] = { 0,0,0,0 };
			text = "textures\Handy\Logo-transp1.5.paa";			
			idc = 88890;
			   x = safezoneW * 0.295999 ;
			   y = safezoneY * -1.8 ;
			   w = safezoneW * 0.106 ;
			   h = safezoneH * 0.106 ;
		};
		
		class UHR : Life_RscText {
			colorBackground[] 	= { 0,0,0,0 };	
			colorText[] 		= { 0,0,0,0 };
			//text = "textures\Handy\Logo-transp1.5.paa";			
			text = "";
			sizeEx = 0.165;
			idc = 88891;
				x = safezoneW * 0.292 ;
				y = safezoneY * 0.0484 ;
				w = safezoneW * 0.124 ;
				h = safezoneH * 0.0679997 ;
		};	

		class Titel1 : Life_RscText {
			
			colorBackground[] 	= { 0,0,0,0 };	
			colorText[] 		= { 0,0,0,0 };
			//text = "textures\Handy\Logo-transp1.5.paa";			
			text = "";	
			//class Attributes {	align = "center"; };
			sizeEx = 0.04;
			idc = 88892;
			   x = safezoneW * 0.249995 ;
			   y = safezoneY * -0.3 ;
			   w = safezoneW * 0.154399 ;
			   h = safezoneH * 0.0235973 ;
		};		

/// BG STR TEXTE 

		class BANK : Life_RscStructuredText {
			idc = 88923;
			text = "";
			colorBackground[] = {0,0,0,0};

		};
		
		class CASH : Life_RscStructuredText {
			idc = 88924;
			text = "";
			colorBackground[] = {0,0,0,0};

		};

		class WETTER : Life_RscPicture {
			idc = 88925;
			text = "";

		};		
			
	};
	
	class controls {
		
		class ScrollRechtsLiga : Liga_RscListBox
		{
			idc = 88900;
			
			colorBackground[] ={0,0,0,0};
			onLBSelChanged = "if(handy_actApp isEqualTo 2) exitWith{};[lbData [88900,(lbCurSel 88900)]]spawn liga_fnc_APPload;  ";
			//sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			//onLBDblClick = "systemChat str ['onLBDblClick',_this]; false";  
			  sizeEx = 0.045;
			   x = safezoneW * 0.403998 ;
			   y = safezoneY * -0.3 ;
			   w = safezoneW * 0.0429198 ;
			   h = safezoneH * 0.378803 ;
		};	

		class ScrollMainLigaTelbuch : Liga_RscListBox_S
		{
			idc = 88901;
			
			colorBackground[] ={0, 0, 0, 0};
			onLBSelChanged = "if (handy_menuOpen)then{[0]spawn liga_fnc_Menu_u;};";
			//sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			onLBDblClick = "[1]spawn liga_fnc_newMsg;[0]spawn liga_fnc_telBuch;";  
			  sizeEx = 0.045;
				   x = safezoneW * 0.25 ;
				   y = safezoneY * -0.405201 ;
				   w = safezoneW * 0.1544 ;
				   h = safezoneH * 0.355919 ;		   

		};	
	// Nachricht lesen ///////////////////////

		class TextShow : Liga_RscControlsGroup {
			idc = 88920;
			//colorBackground[] ={0, 0, 0, 0};	
			x = safezoneW ;
			y = safezoneY ;
			w = safezoneW * 0.1486 ;
			h = safezoneH * 0.345919  ;
				   
				   
			class LigaScrollBarH : LigaHScrollBar {
				height = 0;

			};
			

			class controls {
				
				
				class ScrollMainLigaMessi : Liga_RscListNBox_S
					{
						idc = 88918;
						
						colorBackground[] ={0, 0, 0, 0};

						onLBSelChanged = "if (handy_menuOpen)then{[0]spawn liga_fnc_Menu_u;}; life_smartphoneTarget = [lnbData [88918,[(lbCurSel 88918),0]],lnbData [88918,[(lbCurSel 88918),1]]];";
						//sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
						onLBDblClick = "[lbData [88918,(lbCurSel 88918)]]spawn liga_fnc_DblMenAct;";  
						sizeEx = 0.045;
		
							   x = 0 ;
							   y = 0 ;
							   w = safezoneW * 0.13556 ;
							   h = safezoneH * 3  ;				   
							 
					};					
				
					class ScrollMainLigaMessi_S : Liga_RscListNBox_S
					{
						idc = 88919;
						
						colorBackground[] ={0, 0, 0, 0};
						//text = "sssssfafsfs4sa4s4 44 a4 4 w 4 44  ";
						onLBSelChanged = "if (handy_menuOpen)then{[0]spawn liga_fnc_Menu_u;}; life_smartphoneTarget = [lnbData [88919,[(lbCurSel 88919),0]],lnbData [88919,[(lbCurSel 88919),1]]];";
						//sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
						onLBDblClick = "[lbData [88919,(lbCurSel 88919)]]spawn liga_fnc_DblMenAct;";  
						  sizeEx = 0.032;
							   x = 0 ;
							   y = 0 ;
							   w = safezoneW * 0.13556 ;
							   h = safezoneH * 3  ;				   
							 
					};	
					class MessiShowText : Life_RscStructuredText {
						idc = 88922;
						text = "";
						colorBackground[] = {0.0,0.28,0.0,0.2};
						size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	
					};	
					
					/*
					class SettSideMenu : Liga_SideSlider {
						idc = 88926;
						text = "";
						colorBackground[] = {0.0,0.28,0.0,0.2};
						size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	
					};
					
					class Settbalken : Life_RscStructuredText {
						idc = 88927;
						text = "";
						colorBackground[] = {0.0,0.28,0.0,0.2};
						size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	
					};					
					*/
			};
		};
		
	// Nachricht schreiben ///////////////////////
	class TextWrite : Liga_RscControlsGroup {
		idc = 88921;
		colorBackground[] ={0, 0, 0, 0};		
		x = safezoneW  ;
		y = safezoneY  ;
		w = safezoneW * 0.13556 ;
		h = safezoneH * 1 ;
		
		class LigaScrollBarH : LigaHScrollBar {
				height = 0;
		};
		class controls {	
			class MainLigaText : Liga_RscEdit
			{
				idc = 88913;
				text = "";
				//colorBackground[] ={0, 0, 0, 0};
				//onLBSelChanged = "[2] spawn life_fnc_smartphone;";
				//sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
				//onLBDblClick = "systemChat str ['onLBDblClick',_this]; false";  
				//  sizeEx = 0.045;
				   x = 0;
				   y = 0.001 ;
				   w = safezoneW * 0.13556 ;
				   h = safezoneH * 1 ;

			};	
		};
	};	
		class SendButtonPic : Life_RscPicture
		{
			idc = 88914;
			text = "textures\Handy\Icons\msg\BriefundPfeil.paa";
			//colorBackground[] ={0, 0, 0, 0};
			//onLBSelChanged = "[2] spawn life_fnc_smartphone;";
			//sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			//onLBDblClick = "systemChat str ['onLBDblClick',_this]; false";  
			//  sizeEx = 0.045;
				   x = 0 ;
				   y = 0 ;
				   w = 0 ;
				   h = 0 ;

		};			
		
		class SendButton : Liga_RscButtonMenuUns
		{
			idc = 88915;
			//text = "";
			//colorBackground[] ={0, 0, 0, 0};
			//onLBSelChanged = "[2] spawn life_fnc_smartphone;";
			//sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			//onLBDblClick = "systemChat str ['onLBDblClick',_this]; false";  
			//  sizeEx = 0.045;
				   x = safezoneW * 0.409915 ;
				   y = safezoneY * -1.74919 ;
				   w = safezoneW * 0.0289207 ;
				   h = safezoneH * 0.0362007 ;
		};			
	// Nachricht schreiben  ENDE ///////////////////////		
	
	// Sett Menü
	class SettMenVariabel : Liga_RscControlsGroup {
		idc = 88700;
		colorBackground[] ={0, 0, 0, 0};		
		x = safezoneW  ;
		y = safezoneY  ;
		w = safezoneW * 0.15 ;
		h = safezoneH * 0.345919;
		
		class LigaScrollBarH : LigaHScrollBar {
				height = 0;
		};
		

		class controls {				

		
			class HGAuswahl : Liga_RscListBox {
				idc = 88701;
				//onLBSelChanged = "hint format['%1',_this];";
				onLBDblClick =  "[1,lbData [88701,(lbCurSel 88701)]]spawn liga_fnc_setHGsett;";

				colorBackground[] 	= { 0.8,0.8,0.8,0.6 };
				colorScrollbar[] = {0, 0, 0, 0.1}; 
				colorText[] = { 0,0,0,0.8 };
				colorPicture[] = {1,1,1,0.3};
				rowHeight = 0.12;
				sizeEx = 0.053;
				//text = "textures\Handy\Icons\msg";	
				//text = "afefqf";
				
					x = safezoneW * 0.00687977 ;
					y = safezoneY * -0.52 ;
					w = safezoneW * 0.13 ;
					h = safezoneH * 0.212 ;
			};
		
		
			class SideMenTitel : Life_RscText {
				
			colorBackground[] 	= { 0,0,0,0 };	
			colorText[] 		= { 0,0,0,0 };				
				text = "";				
				sizeEx = 0.04;
				idc = 88702;
				   x = safezoneW * 0.00199977 ;
				   y = safezoneY * -0.385201 ;
				   w = 0 ;
				   h = 0 ;
				}; 
		
		
			class TranzSlide : Liga_SideSlider {	
				idc = 88703;
				   onSliderPosChanged = "[2,'']call liga_fnc_setHGsett;";

				   x = safezoneW * 0.00687977 ;
				   y = safezoneY * -0.1584 ;
				   w = 0 ;
				   h = 0 ;
			};		
			class TranzTitel : Life_RscText {
				
			colorBackground[] 	= { 0,0,0,0 };	
			colorText[] 		= { 0,0,0,0 };		
				text = "";	
				sizeEx = 0.04;
				idc = 88704;
				   x = safezoneW * 0.00199977 ;
				   y = safezoneY * -0.0312 ;
				   w = 0 ;
				   h = 0 ;
			}; 	

			class ONOFF : Liga_RscListBox {
				idc = 88705;
				onLBSelChanged = "[0,lbData [88705,(lbCurSel 88705)]]spawn liga_fnc_setHGsett;";
				onLBDblClick =  "[0,lbData [88705,(lbCurSel 88705)]]spawn liga_fnc_setHGsett;";
				
				colorBackground[] 	= { 0.0,0.0,0.0,0.6 };
				colorScrollbar[] = {0, 0, 0, 0.1}; 
				colorText[] = { 0.8,0.8,0.8,0.8 };
				colorPicture[] = {1,1,1,0.3};
				rowHeight = 0.158;		
				sizeEx = 0.04;
				
				   x = safezoneW * 0.00199977 ;
				   y = safezoneY * -1.5288;
				   w = safezoneW * 0.13;
				   h = safezoneH * 0.1  ;
			}; 	

		
		};					
	};	
	
	// Sett Menü ENDE
	
	
	
	
	/// Disp Oben Lang ...
		/*
		class ScrollObenLiga : Liga_RscListBox
		{
			idc = 88902;
			
			colorBackground[] ={0, 0, 0, 0};
			//onLBSelChanged = "[2] spawn life_fnc_smartphone;";
			//sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			//onLBDblClick = "systemChat str ['onLBDblClick',_this]; false";  
			sizeEx = 0.115;
			   x = safezoneW * 0.249239 ;
			   y = safezoneY * 0.0776002 ;
			   w = safezoneW * 0.162481 ;
			   h = safezoneH * 0.0854801 ;	   

		};	
		*/

		class Oben1 : Liga_RscListBox_O {
			idc = 88903;
			//shortcuts[] = {0x00050000 + 2};
			//text = "textures\Handy\Icons\Fav.mittelgross.1.0.paa";
			//class Attributes {	align = "center"; };
			colorBackground[] ={0, 0, 0, 0};
			sizeEx = 0.115;
			onLBSelChanged = "[lbData [88903,(lbCurSel 88903)]]spawn liga_fnc_oben";
			onLBDblClick = "[lbData [88903,(lbCurSel 88903)]]spawn liga_fnc_oben";
				x = safezoneW * 0.25068 ;
				y = safezoneY * 0.0391999 ;
				w = safezoneW * 0.0417597 ;
				h = safezoneH * 0.0676398 ;
		};		
		
		class Oben2 : Liga_RscListBox_O {
			idc = 88904;
			//shortcuts[] = {0x00050000 + 2};
			//text = "textures\Handy\Icons\Telefonbuch.mittelgross.1.0.paa";
			//class Attributes {	align = "center"; };
			//colorBackground[] ={0, 0, 0, 0};
			onLBSelChanged = "[lbData [88904,(lbCurSel 88904)]]spawn liga_fnc_oben";
			onLBDblClick = "[lbData [88904,(lbCurSel 88904)]]spawn liga_fnc_oben";
			sizeEx = 0.115;
			   x = safezoneW * 0.291801 ;
			   y = safezoneY * 0.0416007 ;
			   w = safezoneW * 0.0415601 ;
			   h = safezoneH * 0.0676401 ;
		};

		class Oben3 : Liga_RscListBox_O {
			idc = 88905;
			//shortcuts[] = {0x00050000 + 2};
			//text = "textures\Handy\Icons\Telefonbuch.mittelgross.1.0.paa";
			//class Attributes {	align = "center"; };
			//colorBackground[] ={0, 0, 0, 0};
			onLBSelChanged = "[lbData [88905,(lbCurSel 88905)]]spawn liga_fnc_oben";
			onLBDblClick = "[lbData [88905,(lbCurSel 88905)]]spawn liga_fnc_oben";
			sizeEx = 0.115;
			   x = safezoneW * 0.3334 ;
			   y = safezoneY * 0.0391999 ;
			   w = safezoneW * 0.0417597 ;
			   h = safezoneH * 0.0676398 ;
		};	

		class Oben4 : Liga_RscListBox_O {
			idc = 88906;
			//shortcuts[] = {0x00050000 + 2};
			//text = "textures\Handy\Icons\Telefonbuch.mittelgross.1.0.paa";
			//class Attributes {	align = "center"; };
			//colorBackground[] ={0, 0, 0, 0};
			onLBSelChanged = "[lbData [88906,(lbCurSel 88906)]]spawn liga_fnc_oben";
			onLBDblClick = "[lbData [88906,(lbCurSel 88906)]]spawn liga_fnc_oben";
			sizeEx = 0.115;
			   x = safezoneW * 0.374522 ;
			   y = safezoneY * 0.0416007 ;
			   w = safezoneW * 0.0415601 ;
			   h = safezoneH * 0.0676401 ;
		};	
		class OptionMenu : Liga_RscListBox_U {
			idc = 88907;
			//shortcuts[] = {0x00050000 + 2};
			//text = "textures\Handy\Icons\Telefonbuch.mittelgross.1.0.paa";
			//class Attributes {	align = "center"; };
			//colorBackground[] ={0, 0, 0, 0};
			//onButtonClick = "[]spawn liga_fnc_Menu_u;";
			onLBSelChanged = "[_this]spawn liga_fnc_OptMenu;";
			sizeEx = 0.042;
			   x = safezoneW ;
			   y = safezoneY ;
			   w = safezoneW * 0.172 ;
			   h = safezoneH * 0.341999 ;
		};	
		class OptionMenuFrame : Life_RscPicture {
			idc = 88908;
			//shortcuts[] = {0x00050000 + 2};
			text = "textures\Handy\Frames\Rahmen.paa";	
			//class Attributes {	align = "center"; };
			//colorBackground[] ={0, 0, 0, 0};
			//onButtonClick = "[]spawn liga_fnc_Menu_u;";
			//sizeEx = 0.042;
			   x = safezoneW ;
			   y = safezoneY ;
			   w = safezoneW ;
			   h = safezoneH ;
		};		

		class MenuButtonU : Liga_RscButtonMenuUns {
			idc = 88910;
			//shortcuts[] = {0x00050000 + 2};
			//text = "textures\Handy\Icons\Telefonbuch.mittelgross.1.0.paa";
			//class Attributes {	align = "center"; };
			colorBackground[] ={0, 0, 0, 0};
			onButtonClick = "[1]spawn liga_fnc_Menu_u;";

			//sizeEx = 0.115;
			   x = safezoneW * 0.29212 ;
			   y = safezoneY * -2.0552 ;
			   w = safezoneW * 0.0275198 ;
			   h = safezoneH * 0.0333998 ;
		};		

		class BackButtonU : Liga_RscButtonMenuUns {
			idc = 88911;
			//shortcuts[] = {0x00050000 + 2};
			//text = "textures\Handy\Icons\Telefonbuch.mittelgross.1.0.paa";
			//class Attributes {	align = "center"; };
			colorBackground[] ={0, 0, 0, 0};
			onButtonClick = "[]spawn liga_fnc_BackBut;";
			//sizeEx = 0.115;
			   x = safezoneW * 0.392079 ;
			   y = safezoneY * -2.0552 ;
			   w = safezoneW * 0.0275198 ;
			   h = safezoneH * 0.0333998 ;
		};	

		class HomeButtonU : Liga_RscButtonMenuUns {
			idc = 88912;
			//shortcuts[] = {0x00050000 + 2};
			//text = "textures\Handy\Icons\Telefonbuch.mittelgross.1.0.paa";
			//class Attributes {	align = "center"; };
			colorBackground[] ={0, 0, 0, 0};
			onButtonClick = "[2]spawn liga_fnc_HomeScr;";
			//sizeEx = 0.115;
			   x = safezoneW * 0.339279 ;
			   y = safezoneY * -2.0376 ;
			   w = safezoneW * 0.0327998 ;
			   h = safezoneH * 0.0404398 ;
		};			

		class Frame : Life_RscPicture {
			idc = 88887;
			text = "textures\Handy\Handy6.0.paa";
			   x = 0 ;
			   y = 0 ;
			   w = 0 ;
			   h = 0 ;
		};				
	};

};	