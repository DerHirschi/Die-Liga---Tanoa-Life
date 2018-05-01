#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {
	
	class life_RscTitleBackground:life_RscText {
			colorBackground[] = {0, 0.17, 0, 0.6};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:life_RscText {
			colorBackground[] = {0, 0, 0.055, 0.6};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
		
		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_PM_Title";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class moneyStatusInfo : Life_RscStructuredText
		{
			idc = 2015;
			sizeEx = 0.025;
			text = "";
			x = 0.105;
			y = 0.30;
			w = 0.3; h = 0.6;
		};
		
		class PlayersName : Title {
			idc = carry_weight;
			style = 1;
			text = "";
		};
	};
	
	class controls {
		
		class itemHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0.17, 0, 0.7};
			text = "$STR_PM_cItems";
			sizeEx = 0.04;
			
			x = 0.62; y = 0.26;
			w = 0.275; h = 0.04;
		};
		
		class licenseHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0.17, 0, 0.7};
			text = "$STR_PM_Licenses";
			sizeEx = 0.04;
			
			x = 0.336; y = 0.26;
			w = 0.275; h = 0.04;
		};
		
		class moneySHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {0, 0.17, 0, 0.7};
			text = "$STR_PM_MoneyStats";
			
			sizeEx = 0.04;
			
			x = 0.11; y = 0.26;
			w = 0.219; h = 0.04;
		};
	
		class itemList : life_RscListBox 
		{
			idc = item_list;
			sizeEx = 0.035;
			
			x = 0.62; y = 0.30;
			w = 0.275; h = 0.3;
		};
		
		class moneyEdit : Life_RscEdit 
		{
			idc = 2018;
			
			text = "1";
			sizeEx = 0.032;
			x = 0.12; y = 0.42;
			w = 0.18; h = 0.03;
		};
		
		class NearPlayers : Life_RscCombo 
		{
			idc = 2022;
		
			x = 0.12; y = 0.46;
			w = 0.18; h = 0.03;
		};
		
		class moneyDrop : Life_RscButtonMenu
		{
			idc = 2001;
			text = "$STR_Global_Give";
			class Attributes {	align = "center"; };
	
			colorBackground[] = {0, 0.25, 0, 0.9};
			onButtonClick = "[] call life_fnc_giveMoney";
			sizeEx = 0.03;
			x = 0.135; y = 0.50;
			w = 0.13; h = 0.036;
		};
		
		class itemEdit : Life_RscEdit {
		
		idc = item_edit;
		
		text = "1";
		sizeEx = 0.035;
		x = 0.62; y = 0.61;
		w = 0.275; h = 0.03;
		
		};
		class iNearPlayers : Life_RscCombo
		{
			idc = 2023;
			
			x = 0.62; y = 0.65;
			w = 0.275; h = 0.03;
		};
		/*
		Disabled till it can be redone
		class moneyInput: life_RscCombo {
			
			idc = money_value;
			
			x  = 0.02; y = 0.402;
			w = .1; h = .030;
		};
		*/
		
		class DropButton : life_RscButtonMenu {
			
			idc = 2002;
			text = "$STR_Global_Give";
			 class Attributes {	align = "center"; };
			colorBackground[] = {0, 0.25, 0, 0.9};
			onButtonClick = "closeDialog 0; [] call life_fnc_giveItem;";
			
			x = 0.765;
			y = 0.70;
			w = (5.25 / 40);
			h = (1 / 25);
			
		};
		
		class UseButton : life_RscButtonMenu {
			
			text = "$STR_Global_Use";
			 class Attributes {	align = "center"; };
			colorBackground[] = {0, 0.25, 0, 0.9};
			onButtonClick = "closeDialog 0; [] call life_fnc_useItem;";

			
			x = 0.62;
			y = 0.70;
			w = (5.25 / 40);
			h = (1 / 25);
			
		};
		
		class RemoveButton : life_RscButtonMenu {
			
			text = "$STR_Global_Remove";
		    class Attributes {	align = "center"; };
			colorBackground[] ={0, 0.25, 0, 0.9};
			onButtonClick = "closeDialog 0; [] call life_fnc_removeItem;";
			
			x = 0.475;
			y = 0.70;
			w = (5.25 / 40);
			h = (1 / 25);
			
		};
		
		
		class INFOButton : life_RscButtonMenu {

			text = "HILFE";
			  class Attributes {
				font = "TahomaB";
				color = "#000000";
				align = "center";
				size = "0.9";
			};
			
			colorBackground[] ={0.3, 0.25, 0, 0.7};
			onButtonClick = "closeDialog 0; createDialog ""liga_HB1"";";
			
			x = 0.135;
			y = 0.70;
			w = 0.13;
			h = (1 / 25);			
		};

		
		class ButtonClose : life_RscButtonMenu {
			idc = -1; 
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] ={0.17, 0, 0, 0.9};
			text = "$STR_Global_Close";
			class Attributes {	align = "center"; };
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonSettings : life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Settings";
			class Attributes {	align = "center"; };
			colorBackground[] ={0, 0.15, 0, 0.9};
			onButtonClick = "closeDialog 0; [] call life_fnc_settingsMenu;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonMyGang : Life_RscButtonMenu {
			idc = 2011;
			text = "$STR_PM_MyGang";
			class Attributes {	align = "center"; };
			colorBackground[] ={0, 0.15, 0, 0.9};
			onButtonClick = "if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Licenses_Menu : Life_RscControlsGroup
		{
			idc = -1;
			w = 0.28;
			h = 0.38;
			x = 0.34;
			y = 0.30;
			
			class Controls
			{
				class Life_Licenses : Life_RscStructuredText
				{
					idc = 2014;
					sizeEx = 0.020;
					text = "";
					x = 0;
					y = 0;
					w = 0.27; h = 0.65;
				};
			};
		};
		
		class ButtonGangList : Life_RscButtonMenu {
			idc = 2012;
			text = "$STR_PM_WantedList";
			class Attributes {	align = "center"; };
			colorBackground[] ={0.2, 0, 0, 0.9};
			onButtonClick = "closeDialog 0; [] call life_fnc_wantedMenu";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	
		class ButtonKeys : Life_RscButtonMenu {
			idc = 2013;
			text = "$STR_PM_KeyChain";
			class Attributes {	align = "center"; };
			colorBackground[] ={0, 0.15, 0, 0.9};
			onButtonClick = "closeDialog 0; createDialog ""Life_key_management"";";
			x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonCell : Life_RscButtonMenu {
			idc = 2014;
			text = "$STR_PM_CellPhone";
			class Attributes {	align = "center"; };
			colorBackground[] ={0.2, 0, 0, 0.9};
			onButtonClick = "closeDialog 0; [2]spawn liga_fnc_handy; ";
			x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonAdminMenu : Life_RscButtonMenu {
			idc = 2021;
			text = "$STR_PM_AdminMenu";
			class Attributes {	align = "center"; };
			colorBackground[] ={0.2, 0, 0, 0.9};
			onButtonClick = "if((call life_adminlevel) > 1) exitWith{closeDialog 0; createDialog ""life_admin_menu"";};";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonSyncData : life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_PM_SyncData";
			class Attributes {	align = "center"; };
			colorBackground[] ={0, 0.15, 0, 0.9};
			onButtonClick = "closeDialog 0; [] call SOCK_fnc_syncData;";
			x = 0.1;
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonMarket : Life_RscButtonMenu {
			idc = -1;
			text = "Radio";
			class Attributes {	align = "center"; };
			colorBackground[] ={0, 0.15, 0, 0.9};
			//onButtonClick = "[] spawn life_fnc_openMarketView;";
			onButtonClick = "closeDialog 0; [] execVM 'scripts\CLAY_CarRadio\scripts\radio.sqf';";
			//x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			x = 0.26 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ButtonWantedAdd : life_RscButtonMenu {
			idc = 9800;
			//shortcuts[] = {0x00050000 + 2};
			//text = "Wanted +";
			text = "";
			class Attributes {	align = "center"; };
			colorBackground[] ={0.2, 0, 0, 0.9};
		//	onButtonClick = "closeDialog 0; createDialog ""life_wantedadd2"";";
			x = 0.42 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
							class ButtonWH : life_RscButtonMenu {
			idc = 9801;
			//shortcuts[] = {0x00050000 + 2};
			text = "Warenhaus";
			class Attributes {	align = "center"; };
			colorBackground[] ={0, 0, 0.2, 0.9};
			onButtonClick = "closeDialog 0; [[61,62,63,65,64]] call life_fnc_getPVC;";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.805;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};		
};