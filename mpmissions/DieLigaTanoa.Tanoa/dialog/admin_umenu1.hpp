#define BGX 0.35
#define BGY 0.2
#define BGW 0.3
#define BGH ((0.6 - (22 / 250)) / 2)
#define VERSX 0.1
#define BTNSP 0.03
#define BTNSPH 0.01
#define BTNW ((BGW + VERSX - (BTNSP * 3)) / 2)
#define BTNH 0.038
#define BTNX BGX - VERSX + BTNSP
#define BTNX2 BGX - VERSX + (BTNSP * 2) + BTNW
#define BTNY1(VAR) BGY + (11 / 250) + ((BTNSPH + BTNH) * VAR) + (BTNSPH * 2)


class admin_u1_menu
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	//onLoad = "[_this]execVM 'fn_adumenu.sqf';";
	
	class controlsBackground
	{
		class RscTitleBackground:life_RscText 
		{
			colorBackground[] = {0, 0.15, 0, 0.6};				
			idc = -1;
			x = BGX - VERSX;
			y = BGY;
			w = BGW + VERSX;
			h = (1 / 25);
		};
		
		class MainBackground : life_RscText
		{
			idc = 37402;
			colorBackground[] = {0, 0, 0, 0.6};
			x = BGX - VERSX;
			y = BGY + (11 / 250);
			w = BGW + VERSX;
			h = BGH + (BTNSPH * 3);
		};
			

		
		class Title : life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 37401;
			text = "";
			x = BGX - VERSX;
			y = BGY;
			w = BGW + VERSX;
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
			onButtonClick = "closeDialog 0;";
			x = BGX - VERSX;
			y = BGY + (11 / 250) + BGH + (BTNSPH * 3) + BTNSPH;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonOne : life_RscButtonMenu
		{
			idc = 37450;
			colorBackground[] = {0, 0.25, 0, 0.9};
			text = "";
			sizeEx = 0.025;
			x = BTNX;
			y = BTNY1(0);
			w = BTNW;
			h = BTNH;
		};
		
		class ButtonTwo : life_RscButtonMenu
		{
			idc = 37451;
			colorBackground[] = {0, 0.25, 0, 0.9};		
			text = "";
			sizeEx = 0.025;
			x = BTNX;
			y = BTNY1(1);
			w = BTNW;
			h = BTNH;
		};
		
		class ButtonThree : life_RscButtonMenu
		{
			idc = 37452;
			colorBackground[] = {0, 0.25, 0, 0.9};		
			text = "";
			sizeEx = 0.025;
			x = BTNX;
			y = BTNY1(2);
			w = BTNW;
			h = BTNH;
		};
		
		class ButtonFour : life_RscButtonMenu
		{
			idc = 37453;
			colorBackground[] = {0, 0.25, 0, 0.9};	
			text = "";
			sizeEx = 0.025;
			x = BTNX;
			y = BTNY1(3);
			w = BTNW;
			h = BTNH;
		};
		
		class ButtonFive : life_RscButtonMenu
		{
			idc = 37454;
			colorBackground[] = {0, 0.25, 0, 0.9};		
			text = "";
			sizeEx = 0.025;
			x = BTNX;
			y = BTNY1(4);
			w = BTNW;
			h = BTNH;
		};
		
		class ButtonSix : life_RscButtonMenu
		{
			idc = 37455;
			colorBackground[] = {0, 0.25, 0, 0.9};		
			text = "";
			sizeEx = 0.025;
			x = BTNX2;
			y = BTNY1(0);
			w = BTNW;
			h = BTNH;
		};
		
		class ButtonSeven : life_RscButtonMenu
		{
			idc = 37456;
			colorBackground[] = {0, 0.25, 0, 0.9};		
			text = "";
			sizeEx = 0.025;
			x = BTNX2;
			y = BTNY1(1);
			w = BTNW ;
			h = BTNH;
		};
		
		class ButtonEight : life_RscButtonMenu
		{
			idc = 37457;
			colorBackground[] = {0, 0.25, 0, 0.9};		
			text = "";
			sizeEx = 0.025;
			x = BTNX2;
			y = BTNY1(2);
			w = BTNW ;
			h = BTNH;
		};
	
//button 9 note the idc number, as it corresponds with copInteractionmenu directly
		class ButtonNine : life_RscButtonMenu
		{
		idc = 37458;
		colorBackground[] = {0, 0.25, 0, 0.9};
		text = "";
		sizeEx = 0.025;
		x = BTNX2;
		y = BTNY1(3);
		w = BTNW;
		h = BTNH;
		};
		
		class Button10 : life_RscButtonMenu
		{
		idc = 37459;
		colorBackground[] = {0, 0.25, 0, 0.9};
		text = "";
		sizeEx = 0.025;
		x = BTNX2;
		y = BTNY1(4);
		w = BTNW;
		h = BTNH;
		};
	};
};
