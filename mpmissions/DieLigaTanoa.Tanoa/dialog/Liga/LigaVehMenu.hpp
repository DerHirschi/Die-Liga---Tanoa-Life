/*
	Edit , Author: Hirschi - Die Liga 
	6 verf*** Stunden Arbeit .. + 5 Std .... .:-(
	Ich hasse Display´s

*/

class Liga_vInteraction_CIV
{
	idd = 37400;
	movingEnabled = 1;
	enableSimulation = 1;
	
	class controlsBackground
	{

		class Backdrop : Life_RscPicture
		{
		idc = -1;
		text = "textures\Autoschluessel1e.paa";
			x = safezoneW * 0.10251;
			y = safezoneY * -1.657;
			w = safezoneW * 0.20763;
			h = safezoneH * 0.336249;
		};	
	};
	
	class controls
	{
		//Con BTN 7
		class ButtonSeven : Liga_RscButtonMenu
		{
			idc = 37456;
			colorBackground[] = {0,0, 0, 0.65};			
			text = "";
			
			x = safezoneW * 0.17815;
			y = safezoneY * -2.71379;
			w = safezoneW * 0.0559692;
			h = safezoneH * 0.0163994;
		};
		
		class ButtonClose : Liga_RscButtonMenu 
		{
			idc = 37460;
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] = {0,0, 0, 0.0};			
			//colorSelection[] = {1,0,0,0.25};
			text = "";
			onButtonClick = "closeDialog 0;";
			
			x = safezoneW * 0.18018;
			y = safezoneY * -2.78839;
			w = safezoneW * 0.0519092;
			h = safezoneH * 0.03699;
		};
		// Key BTN 6
		
		class ButtonOne : Liga_RscButtonMenuUns
		{
			idc = 37450;
			colorBackground[] = {1, 1, 1, 0.9};	
			//colorSelection[] = {1,0,0,0.25};			
			text = "";
			
			x = safezoneW * 0.19186;
			y = safezoneY * -1.78296;
			w = safezoneW * 0.0286899;
			h = safezoneH * 0.0663795;
		};
		// Gerät BTN 5
		class ButtonTwo : Liga_RscButtonMenuUns
		{
			idc = 37451;
			colorBackground[] = {1, 1, 1, 0.9};	
			//colorSelection[] = {1,0,0,0.25};			
			text = "";
			
			x = safezoneW * 0.23722;
			y = safezoneY * -1.95847;
			w = safezoneW * 0.0166898;
			h = safezoneH * 0.0379397;
		};
		
		//tzüv But 4
		class ButtonThree : Liga_RscButtonMenuUns
		{
			idc = 37452;
			colorBackground[] = {1, 1, 1, 0.9};				
			text = "";
			
			x = safezoneW * 0.178061;
			y = safezoneY * -2.15458;
			w = safezoneW * 0.0556897;
			h = safezoneH * 0.0288198;
		};
		//rep BTN 1
		class ButtonFour : Liga_RscButtonMenu
		{
			idc = 37453;
			colorBackground[] = {0,0, 0, 0.65};			
			text = "";
			
			x = safezoneW * 0.17496;
			y = safezoneY * -2.3034;
			w = safezoneW * 0.0620591;
			h = safezoneH * 0.0319998;
		};
		//ziehen BTN 3
		class ButtonFive : Liga_RscButtonMenu
		{
			idc = 37454;
			colorBackground[] = {0,0, 0, 0.65};				
			text = "";
			
			x = safezoneW * 0.17583;
			y = safezoneY * -2.45343;
			w = safezoneW * 0.0600291;
			h = safezoneH * 0.0334397;
		};
		//drehen BTN 2
		class ButtonSix : Liga_RscButtonMenu
		{
			idc = 37455;
			colorBackground[] = {0,0, 0, 0.65};			
			text = "";
			
			x = safezoneW * 0.17757;
			y = safezoneY * -2.59775;
			w = safezoneW * 0.0574192;
			h = safezoneH * 0.0272901;
		};
		//Trunk BTN 9
		class ButtonTrunk : Liga_RscButtonMenuUns
		{
			idc = 37459;
			colorBackground[] = {0,0, 0, 0};			
			text = "";
			
			x = safezoneW * 0.159831;
			y = safezoneY * -1.95847;
			w = safezoneW * 0.0166898;
			h = safezoneH * 0.0379397;
		};	
		
	};
};

class Liga_vInteraction_ALAC
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = false;
	
	class controlsBackground
	{

		class Backdrop : Life_RscPicture
		{
		idc = -1;
		text = "textures\Adacschluessel11.paa";
			x = safezoneW * 0.10251;
			y = safezoneY * -1.657;
			w = safezoneW * 0.20763;
			h = safezoneH * 0.336249;
		};	
	};
	
	class controls
	{
		//Con BTN 7
		class ButtonSeven : Liga_RscButtonMenu
		{
			idc = 37456;
			colorBackground[] = {0,0, 0, 0.65};			
			text = "";
			
			x = safezoneW * 0.17758;
			y = safezoneY * -2.75154;
			w = safezoneW * 0.0561801;
			h = safezoneH * 0.01666;
		};
		
		class ButtonClose : Liga_RscButtonMenu 
		{
			idc = 37460;
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] = {0,0, 0, 0.0};			
			//colorSelection[] = {1,0,0,0.25};
			text = "";
			onButtonClick = "closeDialog 0;";
			
			x = safezoneW * 0.17962;
			y = safezoneY * -2.84368;
			w = safezoneW * 0.0521001;
			h = safezoneH * 0.03196;
		};
		// Key BTN 6
		
		class ButtonOne : Liga_RscButtonMenuUns
		{
			idc = 37450;
			colorBackground[] = {1, 1, 1, 0.9};	
			//colorSelection[] = {1,0,0,0.25};			
			text = "";
			
			x = safezoneW * 0.19118;
			y = safezoneY * -1.81931;
			w = safezoneW * 0.0286401;
			h = safezoneH * 0.06596;
		};
		// Gerät BTN 5
		class ButtonTwo : Liga_RscButtonMenuUns
		{
			idc = 37451;
			colorBackground[] = {1, 1, 1, 0.9};	
			//colorSelection[] = {1,0,0,0.25};			
			text = "";
			
			x = safezoneW * 0.23436;
			y = safezoneY * -1.96584;
			w = safezoneW * 0.0174201;
			h = safezoneH * 0.0408;
		};
		
		//tzüv But 4
		class ButtonThree : Liga_RscButtonMenuUns
		{
			idc = 37452;
			colorBackground[] = {1, 1, 1, 0.9};				
			text = "";
			
			x = safezoneW * 0.1786;
			y = safezoneY * -2.19193;
			w = safezoneW * 0.0541401;
			h = safezoneH * 0.02686;
		};
		//rep BTN 1
		class ButtonFour : Liga_RscButtonMenu
		{
			idc = 37453;
			colorBackground[] = {0,0, 0, 0.65};			
			text = "";
			
			x = safezoneW * 0.17452;
			y = safezoneY * -2.332;
			w = safezoneW * 0.0619601;
			h = safezoneH * 0.034;
		};
		//ziehen BTN 3
		class ButtonFive : Liga_RscButtonMenu
		{
			idc = 37454;
			colorBackground[] = {0,0, 0, 0.65};				
			text = "";
			
			x = safezoneW * 0.17554;
			y = safezoneY * -2.48296;
			w = safezoneW * 0.0602601;
			h = safezoneH * 0.03298;
		};
		//drehen BTN 2
		class ButtonSix : Liga_RscButtonMenu
		{
			idc = 37455;
			colorBackground[] = {0,0, 0, 0.65};			
			text = "";
			
			x = safezoneW * 0.1769;
			y = safezoneY * -2.63085;
			w = safezoneW * 0.057401;
			h = safezoneH * 0.02788;
		};
		//Trunk BTN 9
		class ButtonTrunk : Liga_RscButtonMenuUns
		{
			idc = 37459;
			colorBackground[] = {0,0, 0, 0};			
			text = "";
			
			x = safezoneW * 0.1599;
			y = safezoneY * -1.96584;
			w = safezoneW * 0.0174201;
			h = safezoneH * 0.0408;
		};	
		
	};
};

class Liga_vInteraction_LRK
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = false;
	
	class controlsBackground
	{

		class Backdrop : Life_RscPicture
		{
		idc = -1;
		text = "textures\LRKschlussel1.paa";
			x = safezoneW * 0.10251;
			y = safezoneY * -1.657;
			w = safezoneW * 0.20763;
			h = safezoneH * 0.336249;
		};	
	};	
	
	class controls
	{
		//Con BTN 7
		class ButtonSeven : Liga_RscButtonMenu
		{
			idc = 37456;
			colorBackground[] = {0,0, 0, 0.65};			
			text = "";
			
			x = safezoneW * 0.17812;
			y = safezoneY * -2.72167;
			w = safezoneW * 0.0559403;
			h = safezoneH * 0.0171397;
		};
		
		class ButtonClose : Liga_RscButtonMenu 
		{
			idc = 37460;
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] = {0,0, 0, 0.0};			
			//colorSelection[] = {1,0,0,0.25};
			text = "";
			onButtonClick = "closeDialog 0;";
			
			x = safezoneW * 0.18046;
			y = safezoneY * -2.79398;
			w = safezoneW * 0.0523003;
			h = safezoneH * 0.0363798;
		};
		// Key BTN 6
		
		class ButtonOne : Liga_RscButtonMenuUns
		{
			idc = 37450;
			colorBackground[] = {1, 1, 1, 0.9};	
			//colorSelection[] = {1,0,0,0.25};			
			text = "";
			
			x = safezoneW * 0.1919;
			y = safezoneY * -1.78535;
			w = safezoneW * 0.0286403;
			h = safezoneH * 0.0657597;
		};
		// Gerät BTN 5
		class ButtonTwo : Liga_RscButtonMenuUns
		{
			idc = 37451;
			colorBackground[] = {1, 1, 1, 0.9};	
			//colorSelection[] = {1,0,0,0.25};			
			text = "";
			
			x = safezoneW * 0.235319;
			y = safezoneY * -1.92601;
			w = safezoneW * 0.0192803;
			h = safezoneH * 0.0433998;
		};
		
		//tzüv But 4
		class ButtonThree : Liga_RscButtonMenuUns
		{
			idc = 37452;
			colorBackground[] = {1, 1, 1, 0.9};				
			text = "";
			
			x = safezoneW * 0.17968;
			y = safezoneY * -2.17257;
			w = safezoneW * 0.0536003;
			h = safezoneH * 0.0218198;
		};
		//rep BTN 1
		class ButtonFour : Liga_RscButtonMenu
		{
			idc = 37453;
			colorBackground[] = {0,0, 0, 0.65};			
			text = "";
			
			x = safezoneW * 0.17474;
			y = safezoneY * -2.30548;
			w = safezoneW * 0.0621802;
			h = safezoneH * 0.0332598;
		};
		//ziehen BTN 3
		class ButtonFive : Liga_RscButtonMenu
		{
			idc = 37454;
			colorBackground[] = {0,0, 0, 0.65};				
			text = "";
			
			x = safezoneW * 0.1763;
			y = safezoneY * -2.45011;
			w = safezoneW * 0.0601002;
			h = safezoneH * 0.0327398;
		};
		//drehen BTN 2
		class ButtonSix : Liga_RscButtonMenu
		{
			idc = 37455;
			colorBackground[] = {0,0, 0, 0.65};			
			text = "";
			
			x = safezoneW * 0.1776;
			y = safezoneY * -2.59837;
			w = safezoneW * 0.0575003;
			h = safezoneH * 0.0277998;
		};
		//Trunk BTN 9
		class ButtonTrunk : Liga_RscButtonMenuUns
		{
			idc = 37459;
			colorBackground[] = {0,0, 0, 0};			
			text = "";
			
			x = safezoneW * 0.15706;
			y = safezoneY * -1.92601;
			w = safezoneW * 0.0192803;
			h = safezoneH * 0.0433998;
		};	
		
	};
};