#define INFINITE 1e+1000

class Liga_logo {
	idd = 78889;
	movingEnable = 0;
	duration = INFINITE;
	fadein = 0;
	onLoad = "uiNamespace setVariable ['Liga_logo',_this select 0]";
	onUnload = "uiNamespace setVariable ['Liga_logo', objNull]";
	onDestroy = "uiNamespace setVariable ['Liga_logo', objNull]";	
	fadeout = 0;
	name = "Liga_logo";
	class controlsBackground {
		


		class HGgps : Life_RscPicture {
			idc = 88885;
			text = "textures\Handy\Logo-transp1.5.paa";
			colorText[] = { 0.9, 0.9, 0.9, 0.6 };

			   	x = safeZoneX +		(safeZoneW * 0.4);
				y = safeZoneY +  	(safeZoneH * -0.12);
				w = safeZoneW * 	0.2;
				h = safeZoneH * 	0.368159;
		};	
	};	
};