//#define INFINITE 1e+1000

class Lotto_schein {
	idd = 88888;
	name = "Lotto_schein";
	movingEnable = false;
	enableSimulation = false;
	
	//duration = INFINITE;
	//fadein = 0;
	//fadeout = 0;
	//onLoad = "if!(SKY_HC_aktiv_1)exitWith{closeDialog 0; hint 'Das Liga-Brett wird aufgrund hoher Beanspruchung ueberholt.. Versuche es spaeter nocheinmal ..';}; SKY_cl_diag_link = [1,1,player,life_id];	HC_id publicVariableClient 'SKY_cl_diag_link';";
	//onLoad = "[1]execVM 'fn_brett.sqf';";
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
	║	File: lotto.hpp	
	║		
	║	Author:  Hirschi - Die Liga	
	║	Vorlage: Tonic´s Altis Life R.P.G. Ver.:4.3	
	╠══════════════════════════════════════════════════╗
	║
	║	Danke ArmA GUI-EDITOR ...
	║	Trotzdem noch 5 ver*** Std. Arbeit.
	║	
	║	Ich hasse Displays !!!
	║
	╚══════════════════════════════════════════════════╝
*/	
	class controlsBackground {

		class Backdrop : Life_RscPicture
		{
//		
			idc = -1;
			text = "textures\lotto\Lotto_0.jpg";
			x = 0.29375 * safezoneW + safezoneX ;
			y = 0.291 * safezoneH + safezoneY ;
			w = 0.4125 * safezoneW ;
			h = 0.429 * safezoneH;
		};		

		
		class LottoKreuz01 : Life_RscStructuredText {
			
			idc = 89101;
			text = "  ";
			
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class LottoKreuz02 : Life_RscStructuredText {
			
			idc = 89102;
			text = "  ";
			
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoKreuz03 : Life_RscStructuredText {
			
			idc = 89103;
			text = "  ";
			
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz04 : Life_RscStructuredText {
			
			idc = 89104;
			text = "  ";
			
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};			
		class LottoKreuz05 : Life_RscStructuredText {
			
			idc = 89105;
			text = "  ";
			
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoKreuz06 : Life_RscStructuredText {
			
			idc = 89106;
			text = "  ";
			
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz07 : Life_RscStructuredText {
			
			idc = 89107;
			text = "  ";
			
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};			
	
		class LottoKreuz08 : Life_RscStructuredText {
			
			idc = 89108;
			text = "  ";
			
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz09 : Life_RscStructuredText {
			
			idc = 89109;
			text = "  ";
			
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz10 : Life_RscStructuredText {
			
			idc = 89110;
			text = "  ";
			
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz11 : Life_RscStructuredText {
			
			idc = 89111;
			text = "  ";
			
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoKreuz12 : Life_RscStructuredText {
			
			idc = 89112;
			text = "  ";
			
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};			
		class LottoKreuz13 : Life_RscStructuredText {
			
			idc = 89113;
			text = "  ";
			
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz14 : Life_RscStructuredText {
			
			idc = 89114;
			text = "  ";
			
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		
		class LottoKreuz15 : Life_RscStructuredText {
			
			idc = 89115;
			text = "  ";
			
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz16 : Life_RscStructuredText {
			
			idc = 89116;
			text = "  ";
			
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoKreuz17 : Life_RscStructuredText {
			
			idc = 89117;
			text = "  ";
			
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoKreuz18 : Life_RscStructuredText {
			
			idc = 89118;
			text = "  ";
			
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz19 : Life_RscStructuredText {
			
			idc = 89119;
			text = "  ";
			
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz20 : Life_RscStructuredText {
			
			idc = 89120;
			text = "  ";
			
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz21 : Life_RscStructuredText {
			
			idc = 89121;
			text = "  ";
			
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		
		class LottoKreuz22 : Life_RscStructuredText {
			
			idc = 89122;
			text = "  ";
			
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz23 : Life_RscStructuredText {
			
			idc = 89123;
			text = "  ";
			
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class LottoKreuz24 : Life_RscStructuredText {
			
			idc = 89124;
			text = "  ";
			
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoKreuz25 : Life_RscStructuredText {
			
			idc = 89125;
			text = "  ";
			
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz26 : Life_RscStructuredText {
			
			idc = 89126;
			text = "  ";
			
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz27 : Life_RscStructuredText {
			
			idc = 89127;
			text = "  ";
			
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};			
		class LottoKreuz28 : Life_RscStructuredText {
			
			idc = 89128;
			text = "  ";
			
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		
		class LottoKreuz29 : Life_RscStructuredText {
			
			idc = 89129;
			text = "  ";
			
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoKreuz30 : Life_RscStructuredText {
			
			idc = 89130;
			text = "  ";
			
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz31 : Life_RscStructuredText {
			
			idc = 89131;
			text = "  ";
			
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};			
		class LottoKreuz32 : Life_RscStructuredText {
			
			idc = 89132;
			text = "  ";
			
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoKreuz33 : Life_RscStructuredText {
			
			idc = 89133;
			text = "  ";
			
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz34 : Life_RscStructuredText {
			
			idc = 89134;
			text = "  ";
			
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoKreuz35 : Life_RscStructuredText {
			
			idc = 89135;
			text = "  ";
			//colorText[] = {0,0,0,1};
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		
		
	};
	
	class controls {
	
		
		class Schein_Text1 : Life_RscTitle
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = 88900;
			text = "";
			SizeEX = 0.07;
			x = 0.332916 * safezoneW + safezoneX;
			y = 0.670556 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Schein_Text2 : Life_RscTitle
		{
			
			colorBackground[] = {0, 0, 0, 0};
			idc = 88901;
			text = "";
			SizeEX = 0.07;
			x = 0.392708 * safezoneW + safezoneX;
			y = 0.670556 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class Schein_Text3 : Life_RscTitle
		{
			
			colorBackground[] = {0, 0, 0, 0};
			idc = 88902;
			text = "";
			SizeEX = 0.07;
			x = 0.451563 * safezoneW + safezoneX;
			y = 0.670556 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};				
		class Schein_Text4 : Life_RscTitle
		{
			
			colorBackground[] = {0, 0, 0, 0};
			idc = 88903;
			text = "";
			SizeEX = 0.07;
			x = 0.510938 * safezoneW + safezoneX;
			y = 0.670556 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class Schein_Text5 : Life_RscTitle
		{
			
			colorBackground[] = {0, 0, 0, 0};
			idc = 88904;
			text = "";
			SizeEX = 0.07;
			x = 0.568229 * safezoneW + safezoneX;
			y = 0.670556 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};		
	
	/*										*/
	/*										*/
	/*										*/
		class LottoButton01 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89001;
			text = "";
			onButtonClick = "  ";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};
		
		
		class LottoButton02 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89002;
			text = "";
			onButtonClick = "  ";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoButton03 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89003;
			text = "";
			onButtonClick = "  ";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton04 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89004;
			text = "";
			onButtonClick = "  ";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};			
		class LottoButton05 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89005;
			text = "";
			onButtonClick = "  ";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoButton06 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89006;
			text = "";
			onButtonClick = "  ";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton07 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89007;
			text = "";
			onButtonClick = "  ";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};			
	
		class LottoButton08 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89008;
			text = "";
			onButtonClick = "  ";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton09 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89009;
			text = "";
			onButtonClick = "  ";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton10 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89010;
			text = "";
			onButtonClick = "  ";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton11 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89011;
			text = "";
			onButtonClick = "  ";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoButton12 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89012;
			text = "";
			onButtonClick = "  ";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};			
		class LottoButton13 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89013;
			text = "";
			onButtonClick = "  ";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton14 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89014;
			text = "";
			onButtonClick = "  ";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		
		class LottoButton15 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89015;
			text = "";
			onButtonClick = "  ";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton16 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89016;
			text = "";
			onButtonClick = "  ";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoButton17 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89017;
			text = "";
			onButtonClick = "  ";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoButton18 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89018;
			text = "";
			onButtonClick = "  ";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton19 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89019;
			text = "";
			onButtonClick = "  ";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton20 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89020;
			text = "";
			onButtonClick = "  ";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton21 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89021;
			text = "";
			onButtonClick = "  ";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		
		class LottoButton22 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89022;
			text = "";
			onButtonClick = "  ";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton23 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89023;
			text = "";
			onButtonClick = "  ";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class LottoButton24 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89024;
			text = "";
			onButtonClick = "  ";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoButton25 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89025;
			text = "";
			onButtonClick = "  ";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton26 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89026;
			text = "";
			onButtonClick = "  ";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton27 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89027;
			text = "";
			onButtonClick = "  ";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};			
		class LottoButton28 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89028;
			text = "";
			onButtonClick = "  ";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		
		class LottoButton29 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89029;
			text = "";
			onButtonClick = "  ";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoButton30 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89030;
			text = "";
			onButtonClick = "  ";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton31 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89031;
			text = "";
			onButtonClick = "  ";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};			
		class LottoButton32 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89032;
			text = "";
			onButtonClick = "  ";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		class LottoButton33 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89033;
			text = "";
			onButtonClick = "  ";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton34 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89034;
			text = "";
			onButtonClick = "  ";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		class LottoButton35 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = 89035;
			text = "";
			onButtonClick = "  ";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.033 * safezoneH;
		};		
		
		/*			*/
		class LottoKaufen : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = " [] spawn {if(life_cash < 100000) exitWith {hint 'Du hast nicht genug Geld dabei. Ein Los kostet 100.000 $ und gilt fuer 5 Kalendertag.';};     if!((count Liga_LottoArr) isEqualTo 5) then {hint format['Du hast erst %1 von 5 Kreuze gemacht !',(count Liga_LottoArr)]; }else{  [player,Liga_LottoArr] remoteExec ['TON_fnc_LottoAddSchein',2]; closeDialog 0;         };    };  ";
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.055 * safezoneH;
		};	
		class LottoAbbrechen : Life_RscButtonMenu {
			colorBackground[] ={0.3, 0, 0, 0.75};
			idc = -1;
			text = "Abbrechen";
			onButtonClick = "closeDialog 0;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.726 * safezoneH + safezoneY;
			w = 0.059 * safezoneW;
			h = 0.025 * safezoneH;
		};		
	};	
};