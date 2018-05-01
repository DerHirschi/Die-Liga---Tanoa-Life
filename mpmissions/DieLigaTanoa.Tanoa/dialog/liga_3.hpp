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
║ File: liga_3.hpp
║ Author: Hirschi Liga-Life
╚══════════════════════════════════════════════════╝
*/

class liga_disp2 {
	idd = 4960;
	name= "liga_disp2";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0};		
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
				class Backdrop : Life_RscPicture
		{
		idc = -1;
		text = "textures\In3.jpg";
			x = -0.25;
			y = -0.1;
			w = 1.5;
			h = 1.3;
		};
	};
	
	class controls {		
		
			class Liga : Life_RscButtonMenu {
			colorBackground[] ={0, 0.55, 0, 0.5};
			idc = -1;
			text = "Los gehts";
			onButtonClick = "closeDialog 0; [] spawn life_fnc_welcome; []spawn {uiSleep 10;[]execVM 'scripts\not_uhr.sqf';  		};";
			x = 0.921 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 1.18 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};



