//#define INFINITE 1e+1000

class Lotto_schein_ub {
	
	
	idd = 88888;
	name = "Lotto_schein_ub";
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
	║	File: lottoScheine.hpp	
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
		
		class RscTitleBackground : Life_RscText
		{//HG
			colorBackground[] = {0, 0, 0.055, 0.8};
			idc = -1;
			
			x = 0.608281 * safezoneW + safezoneX ;
			y = 0.291 * safezoneH + safezoneY ;
			w = 0.0979687 * safezoneW ;
			h = 0.4315 * safezoneH;
		};	
		class RscBackground : Life_RscTitle
		{//Text Balken oben
			
			colorBackground[] = {0.4, 0.4, 0.8, 0.8};
			idc = -1;
			text = "Lotto - Lose";
			x = 0.608281 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};		
		
		/*	JACKPOT */
		class Jack : Life_RscTitle
		{//Text Balken oben
			
			colorBackground[] = {0.4, 0.4, 0.8, 0};
			idc = -1;
			text = "JACKPOT";
			SizeEX = 0.08;

			x = 0.474844 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.044 * safezoneH;
		};			
		
		
		/*	KREUZE */
		
		
		
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
	
	class Controls
	{
		class GesBestandBox : Life_RscListBox
		{//Box links
	
			idc = 3502;
			colorBackground[] = {0.7, 0.7, 0.8, 0.3};
			text = "";
			sizeEx = 0.035;
			
			onLBSelChanged = "[] call LIGACL_fnc_selLottoSch";
			//onLBSelChanged = " []execVM 'fn_selLottoSch.sqf' ";
			
			x = 0.613437 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;  
			h = 0.319 * safezoneH;
		};		
		
		class Pot : Life_RscTitle
		{//Text Balken oben
			
			colorBackground[] = {0.4, 0.4, 0.8, 0};
			idc = 88700;
			text = "";
			SizeEX = 0.08;
	
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.044 * safezoneH;
		};	
		
		/*Zahlen Reihe unten*/
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
		
		
		
		/*	BUTTON	*/
		class Close : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] ={0.2, 0, 0, 0.9};
			text = "Schließen";
			sizeEx = 0.060;
			onButtonClick = "closeDialog 0;";
			x = 0.619115 * safezoneW + safezoneX; 
			y = 0.656296 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW; 
			h = 0.054 * safezoneH;
		};			
		
	};	
	
};