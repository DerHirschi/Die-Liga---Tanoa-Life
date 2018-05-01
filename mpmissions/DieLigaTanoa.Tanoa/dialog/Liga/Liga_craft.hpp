//#define INFINITE 1e+1000

class Liga_craft
{
	
	idd = 3500;
	name = "Liga_craft";
//	movingEnable = false;
//	enableSimulation = true;
//	duration = INFINITE;

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
	║	File: Liga_craft.hpp	
	║		
	║	Author:  Hirschi - Die Liga	
	║	Vorlage: Tonic´s Altis Life R.P.G. Ver.:4.3	
	╠══════════════════════════════════════════════════╗
	║
	║	Danke ArmA GUI-EDITOR ...
	║		
	║	Ich hasse Displays !!!
	║
	╚══════════════════════════════════════════════════╝
*/
	class controlsBackground
	{
		
	
		class RscTitleBackground : Life_RscText
		{//HG
			colorBackground[] = {0, 0, 0.055, 0.7};
			idc = -1;
			
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.451 * safezoneH;
		};
		class RscBackground : Life_RscTitle
		{//Text Balken oben
			
			colorBackground[] = {0, 0.22, 0, 0.8};
			idc = 3510;
			text = "Crafting Rezepte";
			x = 0.32677 * safezoneW + safezoneX;
			y = 0.280704 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.027 * safezoneH;
		};		
		class Stueckzahl : Life_RscText
		{//Text Balken oben
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			sizeEx = 0.035;
			text = "Anzahl :";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.04125  * safezoneW;
			h = 0.022 * safezoneH;
		};		
	};
	
	class controls
	{
		class Frak : Life_RscCombo 
		{
			idc = 3503;
		//	onLBSelChanged = "[0]execVM 'fn_LigaCraftMenuDet.sqf'; ";
			onLBSelChanged = "[0]spawn LIGACL_fnc_LigaCraftMenuDet;";
			
		//	onLBSelChanged = "[]execVM 'fn_LigaCraftMenu.sqf'; ";
		//	onLBSelChanged = "[]spawn 'LIGACL_fnc_LigaCraftMenu'; ";
		
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class Eingabe : Life_RscEdit {
		
			idc = 3504;
			
			text = "1";
			sizeEx = 0.04;

			x = 0.54125 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		
		};
		
		class Ausgabe : Life_RscStructuredText
		{
			idc = 3501;
			text = "";
			sizeEx = 0.05;
			colorBackground[] = {0, 0, 0.055, 0.9};

			x = 0.505156 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.33 * safezoneH;
		};
		class ItemList : Life_RscListBox
		{
			idc = 3502;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0, 0, 0.055, 0.9};
		//	onLBSelChanged = "[0]execVM 'fn_LigaCraftMenuDet.sqf'; ";
			onLBSelChanged = "[0]spawn LIGACL_fnc_LigaCraftMenuDet;";
			
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.33 * safezoneH;
		};

		class Rechnen : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] ={0, 0, 0.2, 0.9};
			text = "LOS";
			
		//	onButtonClick = "[1]execVM 'fn_LigaCraftMenuDet.sqf'; ";
			onButtonClick = "[1]spawn LIGACL_fnc_LigaCraftMenuDet;";

			x = 0.608281 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;			
		};			
		
		class Close : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] ={0.2, 0, 0, 0.9};
			text = "Schliessen";
			onButtonClick = "closeDialog 0;";

			x = 0.319531 * safezoneW + safezoneX; 
			y = 0.725 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW; 
			h = 0.022 * safezoneH;		
		};		
	};
};