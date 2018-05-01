class DeathScreen
{
	idd = 7300;
	name = "Life_Death_Screen";
	//onload = "uinamespace setvariable ['tcb_ais_title',_this select 0];";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
	};
	
	class Controls
	{
		class MedicsOnline : Life_RscText
		{
			idc = 7304;
			colorBackground[] = {0,0,0,0};
			text = "LRK Online: 1";
			x = 0.000874975 * safezoneW + safezoneX;
			y = 0.0556 * safezoneH + safezoneY;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MedicsNearby : Life_RscText
		{
			idc = 7305;
			colorBackground[] = {0,0,0,0};
			text = "LRK in der Nähe: Nein";
			x = 0.00190622 * safezoneW + safezoneX;
			y = 0.0776 * safezoneH + safezoneY;
			w = 0.8;
			h = (1 / 25);
		};
		
		class RespawnBtn : Life_RscButtonMenu
		{
			idc = 7302;
			x = 0.9 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = (9 / 40);
			h = (1 / 25);
			text = "Respawn";
			onButtonClick = "closeDialog 0; life_respawned = true; removeBackpack life_corpse; removeAllWeapons life_corpse; [] call life_fnc_spawnMenu;";
			colorBackground[] = {0, 0.25, 0, 0.9};
			class Attributes 
			{
				align = "center";
			};
		};
		
		class MedicBtn : Life_RscButtonMenu
		{
			idc = 7303;
			x = 0.9 * safezoneW + safezoneX;
			y = 0.0292 * safezoneH + safezoneY;
			w = (9 / 40);
			h = (1 / 25);
			onButtonClick = "[] call life_fnc_requestMedic;";
			text = "LRK rufen";
			colorBackground[] = {0, 0.25, 0, 0.9};
			class Attributes 
			{
				align = "center";
			};
		};
		
		class respawnTime : Life_RscText
		{
			idc = 7301;
			colorBackground[] = {0,0,0,0};
			text = "";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.958 * safezoneH + safezoneY;
			w = 0.8;
			h = (1 / 25);
		};

	class HeaderDeath {
		idc = -1;
		type = 13;
		style = 0x00;
		colorBackground[] = {1, 1, 1, 0};
		colorText[] = {1, 0.0, 0.0, 1};
		x = safezoneX + 0.3 * safezoneW;
		y = safezoneY + 0.045 * safezoneW;
		w = 1;
		h = 0.6;
		size = 0.08;
		text = "Du bist Tot.....";
		class Attributes {
			font = "PuristaMedium";
			color = "#CC0000";
			align = "center";
			valign = "middle";
			shadow = false;
			shadowColor = "#ff0000";
			size = "1.6";
		};
	};
	class QuoteStructuredText {
		idc = 7306;
		type = 13;
		style = 0x00;
		colorBackground[] = { 1, 1, 1, 0 };
		colorText[] = {1,1,1,1};
		x = safezoneX + 0.3 * safezoneW;
		y = safezoneY + 0.67 * safezoneW;
		w = 1;
		h = 0.6;
		size = 0.02;
		text = "";
		class Attributes {
			font = "PuristaMedium";
			color = "#000000";
			align = "center";
			valign = "middle";
			shadow = false;
			shadowColor = "#ff0000";
			size = "1.6";
		};
	};		
		
	};
};