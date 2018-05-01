#define INFINITE 1e+1000
#define IDD_LIFE_MAIN_DISP 2203

#define IDC_LIFE_PICTURE_FOOD 1200
#define IDC_LIFE_PICTURE_WATER 1201
#define IDC_LIFE_PICTURE_HEALTH 1202
#define IDC_LIGA_PICTURE_BANK 1203
#define IDC_LIGA_PICTURE_CASH 1204
#define IDC_LIGA_PICTURE_COPON 1205
#define IDC_LIGA_PICTURE_ALACON 1206
#define IDC_LIGA_PICTURE_MEDON 1207
#define IDC_LIGA_PICTURE_CIVON 1208

#define IDC_LIFE_FOOD_TEXT 1000
#define IDC_LIFE_WATER_TEXT 1001
#define IDC_LIFE_HEALTH_TEXT 1002
#define IDC_LIGA_BANK_TEXT 1003
#define IDC_LIGA_BANK_CASH 1004
#define IDC_LIGA_COPON_TEXT 1005
#define IDC_LIGA_ALACON_TEXT 1006
#define IDC_LIGA_MEDON_TEXT 1007
#define IDC_LIGA_CIVON_TEXT 1008


#define VER -0.01
#define VER1 0.05
#define SIZE 0.038

	
class Liga_handy_side_m {
	idd = 78888;
	movingEnable = 1;
	duration = INFINITE;
	fadein = 0;
	onLoad = "uiNamespace setVariable ['Liga_handy_side_m',_this select 0]";
	onUnload = "uiNamespace setVariable ['Liga_handy_side_m', objNull]";
	onDestroy = "uiNamespace setVariable ['Liga_handy_side_m', objNull]";	
	fadeout = 0;
	name = "Liga_handy_side";
	//onLoad = "[] spawn life_fnc_smartphone;";
	
	class controlsBackground {
		


		class HGgps : Life_RscPicture {
			idc = 88885;
			text = "textures\Handy\Handy-hintergrund1.5.paa";
			colorText[] = { 0, 0, 0, 0.6 };
			   x = safezoneW * 0.535996 ;
			   y = safezoneY * -1.6328 ;
			   w = safezoneW * 0.198 ;
			   h = safezoneH * 0.368159 ;
		};			
		
		class Frame : Life_RscPicture {
			idc = 88887;
			text = "textures\Handy\Handy6.0.paa";
				x = safezoneW * 0.53745;
				y = safezoneY * -1.76775 ;
				w = safezoneW * 0.19633 ;
				h = safezoneH * 0.36515 ;
		};		

	};
	
controls[] = {

		LIFE_PICTURE_FOOD,
		LIFE_PICTURE_WATER,
		LIFE_PICTURE_HEALTH,
		LIFE_FOOD_TEXT,
		LIFE_WATER_TEXT,
		LIFE_HEALTH_TEXT,
		LIGA_BANK_TEXT,
		LIGA_CASH_TEXT,
		LIGA_PICTURE_BANK,
		LIGA_PICTURE_CASH,
		LIGA_BAT_ICON,
		LIGA_PICTURE_COPON,
		LIGA_COPON_TEXT,
		LIGA_PICTURE_ALACON,
		LIGA_ALACON_TEXT,
		LIGA_MEDON_TEXT,
		LIGA_PICTURE_MEDON,
		LIGA_PICTURE_CIVON,
		LIGA_CIVON_TEXT,
		LIGA_PICTURE_HP,
		LIGA_PICTURE_TS
	};


	
	/* Text */

	class LIFE_FOOD_TEXT: Life_RscText
	{
		idc = IDC_LIFE_FOOD_TEXT;
		text = "100";
		sizeEx = SIZE;
		x = safezoneW * (0.604996 + VER + VER1 ) ;
		y = safezoneY * -1.84919 ;
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};
	class LIFE_WATER_TEXT: Life_RscText
	{
	idc = IDC_LIFE_WATER_TEXT;
	text = "100";
	sizeEx = SIZE;
		x = safezoneW * (0.604996 + VER + VER1 ) ;
		y = (safezoneY * -1.84919) + ((0.014 * safezoneH) * 2);
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};
	class LIFE_HEALTH_TEXT: Life_RscText
	{
	idc = IDC_LIFE_HEALTH_TEXT;
	text = "100";
	sizeEx = SIZE;
		x = safezoneW * (0.604996 + VER ) ;
		y = (safezoneY * -1.84919) + ((0.014 * safezoneH) * 2);
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};
	
	class LIGA_BANK_TEXT: Life_RscText
	{
	idc = IDC_LIGA_BANK_TEXT;
	text = "100";
	sizeEx = SIZE;
		x = safezoneW * (0.604996 + VER ) ;
		y = (safezoneY * -1.80919) + ((0.017 * safezoneH) * 3.8);
		w = (0.020625 * safezoneW) * 3.5;
		h = 0.011 * safezoneH;
	};

	class LIGA_CASH_TEXT: Life_RscText
	{
	idc = IDC_LIGA_BANK_CASH;
	text = "100";
	sizeEx = SIZE;
		x = safezoneW * (0.604996 + VER ) ;
		y = (safezoneY * -1.80919) + ((0.017 * safezoneH) * 5.5);
		w = (0.020625 * safezoneW) * 3.5;
		h = 0.011 * safezoneH;
	};	
	
	class LIGA_COPON_TEXT: Life_RscText
	{
	idc = IDC_LIGA_COPON_TEXT;
	text = "10";
	sizeEx = SIZE;
		x = safezoneW * (0.604996 + (VER * 1.8) ) ;
		y = safezoneY * -2.98;
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};		
	
	class LIGA_ALACON_TEXT: Life_RscText
	{
	idc = IDC_LIGA_ALACON_TEXT;
	text = "9";
	sizeEx = SIZE;
		x = safezoneW * (0.604996 + (VER * 1.8) + (VER1 / 2)) ;
		y = safezoneY * -2.98;
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};

	class LIGA_MEDON_TEXT: Life_RscText
	{
	idc = IDC_LIGA_MEDON_TEXT;
	text = "9";
	sizeEx = SIZE;
		x = safezoneW * (0.604996 + (VER * 1.8) + VER1) ;
		y = safezoneY * -2.98;		
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};	
	
	class LIGA_CIVON_TEXT: Life_RscText
	{
	idc = IDC_LIGA_CIVON_TEXT;
	text = "9";
	sizeEx = SIZE;
		x = safezoneW * (0.604996 + (VER * 1.8) + VER1  + (VER1 / 2)) ;
		y = safezoneY * -2.98;
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};		

	/* Icons */
	class LIGA_BAT_ICON: life_RscPicture
	{
	idc = -1;
	text = "textures\Handy\Batterie\Batterie5.1.paa";
		x = safezoneW * (0.583496 + VER ) ;	
		y = safezoneY * -1.81619 ;
		w = 0.063; h = 0.064;
	};
	
	class LIFE_PICTURE_FOOD: life_RscPicture
	{
	idc = IDC_LIFE_PICTURE_FOOD;
	text = "icons\food.paa";
		x = safezoneW * (0.587996 + VER + VER1 ) ;		
		y = safezoneY * -1.84919 ;
		w = 0.03; h = 0.04;
	};
	class LIFE_PICTURE_WATER: life_RscPicture
	{
	idc = IDC_LIFE_PICTURE_WATER;
		text = "icons\water.paa";
		x = safezoneW * (0.587996 + VER + VER1 ) ;	
		y = (safezoneY * -1.84919) + ((0.011 * safezoneH) * 2.5);
		w = 0.03; h = 0.04;
	};
	class LIFE_PICTURE_HEALTH: life_RscPicture
	{
		idc = IDC_LIFE_PICTURE_HEALTH;
		text = "icons\health.paa";
		x = safezoneW * (0.587996 + VER ) ;	
		y = (safezoneY * -1.84919) + ((0.011 * safezoneH) * 2.4);
		w = 0.03; h = 0.04;
	};		
	
		class LIGA_PICTURE_BANK: life_RscPicture
	{
		idc = IDC_LIGA_PICTURE_BANK;
		text = "icons\bank.paa";
		x = safezoneW * (0.587996 + VER ) ;	
		y = (safezoneY * -1.80919) + ((0.017 * safezoneH) * 3.7);
		w = 0.03; h = 0.04;
	};		
	
		class LIGA_PICTURE_CASH: life_RscPicture
	{
		idc = IDC_LIGA_PICTURE_CASH;
		text = "icons\money.paa";
		x = safezoneW * (0.587996 + VER ) ;	
		y = (safezoneY * -1.80919) + ((0.017 * safezoneH) * 5.14);
		w = 0.03; h = 0.04;
	};	

	class LIGA_PICTURE_COPON: life_RscPicture
	{
		idc = IDC_LIGA_PICTURE_COPON;
		text = "textures\Handy\Icons\div\polizei1.paa";
		x = safezoneW * (0.587996 + VER ) ;	
		y = safezoneY * -2.98;
		w = 0.03; h = 0.04;
	};	
	
	class LIGA_PICTURE_ALACON: life_RscPicture
	{
		idc = IDC_LIGA_PICTURE_ALACON;
		text = "textures\Handy\Icons\div\alac1.paa";
		x = safezoneW * (0.587996 + VER + (VER1 / 2)) ;	
		y = safezoneY * -2.98;
		w = 0.03; h = 0.04;
	};	

	class LIGA_PICTURE_MEDON: life_RscPicture
	{
		idc = IDC_LIGA_PICTURE_MEDON;
		text = "textures\Handy\Icons\div\medic.paa";
		x = safezoneW * (0.587996 + VER + VER1 ) ;	
		y = safezoneY * -2.98;
		w = 0.03; h = 0.04;
	};		
	
	class LIGA_PICTURE_CIVON: life_RscPicture
	{
		idc = IDC_LIGA_PICTURE_CIVON;
		text = "textures\Handy\Icons\div\person1.paa";
		x = safezoneW * (0.587996 + VER + VER1 + (VER1 / 2));			
		y = safezoneY * -2.98;
		w = 0.03; h = 0.04;
	};	
	
	class LIGA_PICTURE_HP: life_RscPicture
	{
		idc = -1;
		colorText[] = { 0.5, 0.5, 0.7, 0.6 };
		text = "textures\Handy\Icons\div\homepage1.paa";
		  x = safezoneW * 0.577116 ;
		  y = safezoneY * -2.0144 ;
		  w = safezoneW * 0.10824 ;
		  h = safezoneH * 0.22 ;
	};	
	
	class LIGA_PICTURE_TS: life_RscPicture
	{
		idc = -1;
		colorText[] = { 0.5, 0.5, 0.7, 0.6 };
		text = "textures\Handy\Icons\div\ts1.paa";
		   x = safezoneW * 0.569996 ;
		   y = safezoneY * -2.32 ;
		   w = safezoneW * 0.12 ;
		   h = safezoneH * 0.22 ;
	};
};	

	

class Liga_handy_side_gps_m {
	idd = 78888;
	movingEnable = 1;
	duration = INFINITE;
	fadein = 0;
	fadeout = 0;
	name = "Liga_handy_side";
	onLoad = "uiNamespace setVariable ['Liga_handy_side_m',_this select 0]";
	onUnload = "uiNamespace setVariable ['Liga_handy_side_m', objNull]";
	onDestroy = "uiNamespace setVariable ['Liga_handy_side_m', objNull]";	
	//onLoad = "[] spawn life_fnc_smartphone;";
	
	class controlsBackground {

		class HGgps : Life_RscPicture {
			idc = 88885;
			text = "textures\Handy\Handy-hintergrundgps1.7.paa";
			colorText[] = { 0, 0, 0, 0.6 };
			   x = safezoneW * 0.535996 ;
			   y = safezoneY * -1.6328 ;
			   w = safezoneW * 0.198 ;
			   h = safezoneH * 0.368159 ;
		};			
		
		class Frame : Life_RscPicture {
			idc = 88887;
			text = "textures\Handy\Handy6.0.paa";
				x = safezoneW * 0.53745;
				y = safezoneY * -1.76775 ;
				w = safezoneW * 0.19633 ;
				h = safezoneH * 0.36515 ;
		};		
	};
	
controls[] = {
	//	LIFE_UI_BACK,
	//	LIFE_BAR_FOOD,
	//	LIFE_BAR_WATER,
	//	LIFE_BAR_HEALTH,
		LIFE_PICTURE_FOOD,
		LIFE_PICTURE_WATER,
		LIFE_PICTURE_HEALTH,
		LIFE_FOOD_TEXT,
		LIFE_WATER_TEXT,
		LIFE_HEALTH_TEXT,
		LIGA_BANK_TEXT,
		LIGA_CASH_TEXT,
		LIGA_PICTURE_BANK,
		LIGA_PICTURE_CASH,
		LIGA_BAT_ICON
	};


	
/* Progress Bars 
	class LIFE_BAR_FOOD: Life_RscProgress
	{
		idc = IDC_LIFE_BAR_FOOD;
		x = 0.938281 * safezoneW + safezoneX;
		y = 0.83 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class LIFE_BAR_WATER: Life_RscProgress
	{
		idc = IDC_LIFE_BAR_WATER;
		x = 0.938281 * safezoneW + safezoneX;
		y = 0.863 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.022 * safezoneH;
	};
	class LIFE_BAR_HEALTH: Life_RscProgress
	{
		idc = 2202;
		x = 0.938281 * safezoneW + safezoneX;
		y = 0.896 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.022 * safezoneH;
	};
*/
	/* Text */

	class LIFE_FOOD_TEXT: Life_RscText
	{
		idc = IDC_LIFE_FOOD_TEXT;
		text = "100";
		sizeEx = SIZE;
		x = safezoneW * (0.604996 + VER + VER1 ) ;
		y = safezoneY * -1.84919 ;
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};
	class LIFE_WATER_TEXT: Life_RscText
	{
	idc = IDC_LIFE_WATER_TEXT;
	text = "100";
	sizeEx = SIZE;
		x = safezoneW * (0.604996 + VER + VER1 ) ;
		y = (safezoneY * -1.84919) + ((0.014 * safezoneH) * 2);
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};
	class LIFE_HEALTH_TEXT: Life_RscText
	{
	idc = IDC_LIFE_HEALTH_TEXT;
	text = "100";
	sizeEx = SIZE;
		x = safezoneW * (0.604996 + VER ) ;
		y = (safezoneY * -1.84919) + ((0.014 * safezoneH) * 2);
		w = 0.020625 * safezoneW;
		h = 0.011 * safezoneH;
	};
	
	class LIGA_BANK_TEXT: Life_RscText
	{
	idc = IDC_LIGA_BANK_TEXT;
	text = "100";
	sizeEx = SIZE;
		x = safezoneW * (0.604996 + VER ) ;
		y = (safezoneY * -1.80919) + ((0.017 * safezoneH) * 3.8);
		w = (0.020625 * safezoneW) * 3.5;
		h = 0.011 * safezoneH;
	};

	class LIGA_CASH_TEXT: Life_RscText
	{
	idc = IDC_LIGA_BANK_CASH;
	text = "100";
	sizeEx = SIZE;
		x = safezoneW * (0.604996 + VER ) ;
		y = (safezoneY * -1.80919) + ((0.017 * safezoneH) * 5.5);
		w = (0.020625 * safezoneW) * 3.5;
		h = 0.011 * safezoneH;
	};	

	/* Icons */
	class LIGA_BAT_ICON: life_RscPicture
	{
	idc = -1;
	text = "textures\Handy\Batterie\Batterie5.1.paa";
		x = safezoneW * (0.583496 + VER ) ;	
		y = safezoneY * -1.81619 ;
		w = 0.063; h = 0.064;
	};
	
	class LIFE_PICTURE_FOOD: life_RscPicture
	{
	idc = IDC_LIFE_PICTURE_FOOD;
	text = "icons\food.paa";
		x = safezoneW * (0.587996 + VER + VER1 ) ;		
		y = safezoneY * -1.84919 ;
		w = 0.03; h = 0.04;
	};
	class LIFE_PICTURE_WATER: life_RscPicture
	{
	idc = IDC_LIFE_PICTURE_WATER;
		text = "icons\water.paa";
		x = safezoneW * (0.587996 + VER + VER1 ) ;	
		y = (safezoneY * -1.84919) + ((0.011 * safezoneH) * 2.5);
		w = 0.03; h = 0.04;
	};
	class LIFE_PICTURE_HEALTH: life_RscPicture
	{
		idc = IDC_LIFE_PICTURE_HEALTH;
		text = "icons\health.paa";
		x = safezoneW * (0.587996 + VER ) ;	
		y = (safezoneY * -1.84919) + ((0.011 * safezoneH) * 2.4);
		w = 0.03; h = 0.04;
	};		
	
		class LIGA_PICTURE_BANK: life_RscPicture
	{
		idc = IDC_LIGA_PICTURE_BANK;
		text = "icons\bank.paa";
		x = safezoneW * (0.587996 + VER ) ;	
		y = (safezoneY * -1.80919) + ((0.017 * safezoneH) * 3.7);
		w = 0.03; h = 0.04;
	};		
	
		class LIGA_PICTURE_CASH: life_RscPicture
	{
		idc = IDC_LIGA_PICTURE_CASH;
		text = "icons\money.paa";
		x = safezoneW * (0.587996 + VER ) ;	
		y = (safezoneY * -1.80919) + ((0.017 * safezoneH) * 5.14);
		w = 0.03; h = 0.04;
	};		
};	
