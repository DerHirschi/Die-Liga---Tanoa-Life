class life_spawn_selection
{
	idd = 38500;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class Backdrop : Life_RscPicture
		{
		idc = -1;
		text = "textures\Liga_Login.jpg"; 
		x = 0.0 * safezoneW + safezoneX;
		y = 0.0 * safezoneH + safezoneY;
		w = 1.0 * safezoneW;
		h = 1.0 * safezoneH;
		};

		class FrameBG : Life_RscPicture
		{
		idc = -1;
		//colorText[] = { 0, 0, 0, 0.7 };
		colorText[] = { 0, 0, 0, 0.5 };
		text = "textures\Handy\Handyhintergrundgedreht1.5.paa";
		   x = safezoneW * -0.00800023 ;
		   y = safezoneY * 0.18 ;
		   w = safezoneW * 0.393998 ;
		   h = safezoneH * 0.577996 ;
		};		
		
		class MapView : Life_RscMapControl 
		{
			idc = 38502;
			   x = safezoneW * 0.136 ;
			   y = safezoneY * -0.3232 ;
			   w = safezoneW * 0.208 ;
			   h = safezoneH * 0.355679 ;
			maxSatelliteAlpha = 0.75;//0.75;
			alphaFadeStartScale = 1.15;//0.15;
			alphaFadeEndScale = 1.29;//0.29;
		};
	};
	
	class controls
	{	
		class SpawnPointList: Life_RscListNBox
		{
			idc = 38510;
			text = "";
			sizeEx = 0.041;
			coloumns[] = {0,0,0.8};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			x = 0.105; y = 0.26;
			w = (8.8 / 40);
			h = (10 / 25);
			onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
		};
		
		class spawnButton : Life_RscButtonMenu
		{
			idc = -1;
			colorBackground[] = {0, 0.25, 0, 0.9};
			text = "$STR_Spawn_Spawn";
			onButtonClick = "[] call life_fnc_spawnConfirm";
			x = 0.11; y = 0.69;
			w = (8 / 40);
			h = (1 / 25);
		};
		
		class Frame : Life_RscPicture
		{
		idc = -1;		
		text = "textures\Handy\Handygedreht1.5.paa";		
		//colorBackground[] = {0,0, 0, 1};		
				x = safezoneW * 0.0279998 ;
				y = safezoneY * 0.16 ;
				w = safezoneW * 0.385998 ;
				h = safezoneH * 0.565996 ;

		};			
	};
};