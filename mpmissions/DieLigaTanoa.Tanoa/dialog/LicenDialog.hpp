class LicenseShop {
	idd = 5546;
	name= "life_license_shop";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "uiNamespace setVariable [""LicenseShop"", _this select 0];";
	objects[] = { };
	class controls {
		class RscTitleBackground : Life_RscText
		{
			colorBackground[] = {0, 0.15, 0, 0.6};
			idc = -1;
			text = "Lizenzen"; 
			x = 0.1;
			y = 0.2;
			w = 0.775;
			h = 0.04;
		};
		class Mainbackground : Life_RscText
		{
			colorBackground[] = {0, 0, 0.055, 0.6};
			idc = -1;
			x = 0.1;
			y = 0.244;
			w = 0.775;
			h = 0.52;
		};
		class listbox: Life_RscListBox
		{
			idc = 55126;
			sizeEx = 0.035;
			x = 0.1125;
			y = 0.3;
			w = 0.3125;
			h = 0.4;
		};
		class ShowLicenseslistbox: Life_RscListBox
		{
			idc = 55131;
			sizeEx = 0.035;
			x = 0.55;
			y = 0.3;
			w = 0.3125;
			h = 0.4;
		};
		class MyLicenses : Life_RscText
		{
			idc = 55130;
			text = "Verfügbar"; //--- ToDo: Localize;
			x = 0.1875;
			y = 0.24;
			w = 0.1375;
			h = 0.04;
		};
		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			colorBackground[] ={0.17, 0, 0, 0.9};
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class ShowLicenses : Life_RscText
		{
			idc = 55129;
			text = "Meine Lizenzen";
			x = 0.65;
			y = 0.24;
			w = 0.1375;
			h = 0.04;
		};
		class buybutton: Life_RscButtonMenu
		{
			idc = 55127;
			text = "$STR_Global_Buy";
			x = 0.4125;
			y = 0.72;
			w = 0.15;
			h = 0.04;
			colorText[] = {1,1,1,1};
			colorBackground[] ={0, 0.15, 0, 0.9};
			action = "if( (lbData[55126,lbCurSel (55126)] != """") ) then { [false, false, false, lbData[55126,lbCurSel (55126)]] call life_fnc_buyLicense; closeDialog 0; };";
		};
	};
};