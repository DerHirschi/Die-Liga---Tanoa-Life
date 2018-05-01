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
║ File: Notruf.hpp
║ Author: Hirschi - Die Liga
╚══════════════════════════════════════════════════╝
*/

#define BGX -0.62
#define BGY 0.2
#define BGYW 0.97
#define BGW 0.18
#define plus 0.05

class notw_disp {
	idd = 49920;
	name= "notw_disp";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		
		class RscTitleBackground:life_RscText 
		{
			colorBackground[] = {0, 0.15, 0, 0.6};				
			idc = -1;
			x = BGX;
			y = BGY;
			w = BGW;
			h = (1 / 25);
		};
		
		class MainBackground : life_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = BGX;
			y = BGY + (11 / 250);
			w = BGW ;
			h = 1.015;
		};		

		
		class Title : life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = -1;
			text = "BOS Funk";
			x = BGX;
			y = BGY;
			w = BGW;
			h = (1 / 25);
		};
	};

	
	class controls
	{
		class ButtonClose : life_RscButtonMenu 
		{
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] ={0.2, 0, 0, 0.9};
			text = "$STR_Global_Close";
			class Attributes {	align = "center"; };
			onButtonClick = "closeDialog 0;";
			x = BGX;
			y = BGYW + 0.288;  
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonOne : life_RscButtonMenu
		{
			idc = 49918;
			colorBackground[] = {0, 0.25, 0, 0.9};
			text = "NOTRUF";
			class Attributes {	align = "center"; };
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.07;
			w = BGW - 0.06;
			h = 0.038;
		};
		
		class ButtonTwo : life_RscButtonMenu
		{
			idc = 49911;
			colorBackground[] = {0, 0.25, 0, 0.9};		
			text = "BOS 1";
			class Attributes {	align = "center"; };
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.12 + plus;
			w = BGW - 0.06;
			h = 0.038;
		};
		
		class ButtonThree : life_RscButtonMenu
		{
			idc = 49912;
			colorBackground[] = {0, 0.25, 0, 0.9};		
			text = "BOS 2";
			class Attributes {	align = "center"; };
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.17 + plus;
			w = BGW - 0.06;
			h = 0.038;
		};
		
		class ButtonFour : life_RscButtonMenu
		{
			idc = 49913;
			colorBackground[] = {0, 0.25, 0, 0.9};	
			text = "BOS 3";
			class Attributes {	align = "center"; };
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.22 + plus;
			w = BGW - 0.06;
			h = 0.038;
		};
		
		class ButtonFive : life_RscButtonMenu
		{
			idc = 49914;
			colorBackground[] = {0, 0.25, 0, 0.9};		
			text = "BOS 4";
			class Attributes {	align = "center"; };
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.27 + plus;
			w = BGW - 0.06;
			h = 0.038;
		};
		
		class ButtonSix : life_RscButtonMenu
		{
			idc = 49915;
			colorBackground[] = {0, 0.25, 0, 0.9};		
			text = "BOS 5";
			class Attributes {	align = "center"; };
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.32 + plus;
			w = BGW - 0.06;
			h = 0.038;
		};
		
		class ButtonSeven : life_RscButtonMenu
		{
			idc = 49916;
			colorBackground[] = {0, 0.25, 0, 0.9};		
			text = "BOS 6";
			class Attributes {	align = "center"; };
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.37 + plus;
			w = BGW - 0.06;
			h = 0.038;
		};
		
		class ButtonEight : life_RscButtonMenu
		{
			idc = 49917;
			colorBackground[] = {0, 0.25, 0, 0.9};		
			text = "FS";
			class Attributes {	align = "center"; };
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.42 + plus;
			w = BGW - 0.06;
			h = 0.038;
		};
		
		class ButtonNeun : life_RscButtonMenu
		{
			idc = 49919;
			colorBackground[] = {0, 0.95, 1, 0.3};		
			text = "4 Meter";
			class Attributes {	align = "center"; };
			sizeEx = 0.025;
			x = BGX + 0.03;
			y = BGY + 0.52 + plus;
			w = BGW - 0.06;
			h = 0.038;
		};
		
		class ButtonNext : life_RscButtonMenu
		{
			idc = 49921;
			colorBackground[] = {0, 0.25, 0, 0.9};
			text = "Nächster";
			class Attributes {	align = "center"; };
			onButtonClick = "[]spawn{[[1],""TON_fnc_notsteu"",false,false] call life_fnc_MP; hint ""Naechster Teilnehmer""};";
			sizeEx = 0.02;
			x = BGX + 0.03;
			y = BGYW + 0.07;
			w = BGW - 0.06;
			h = 0.038;
		};
		
		class ButtonAuf : life_RscButtonMenu
		{
			idc = 49922;
			colorBackground[] = {0, 0.25, 0, 0.9};		
			text = "Auflegen";
			class Attributes {	align = "center"; };
			onButtonClick = "[]spawn {[[2],""TON_fnc_notsteu"",false,false] call life_fnc_MP; hint "" Gespraech wurde beendet !!""};";
			sizeEx = 0.02;
			x = BGX + 0.03;
			y = BGYW + 0.12;
			w = BGW - 0.06;
			h = 0.038;
		};		
	};
};
