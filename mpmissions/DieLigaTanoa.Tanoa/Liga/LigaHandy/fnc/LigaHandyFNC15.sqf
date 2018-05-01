#include <LigaHandyMac.h>
#define CHECKSET(MODE) _set select 1 isEqualTo MODE
#define VARARR [_HGbild]
#define VARARRALL [_HGbild,_bg1]
#define POS1 [safezoneW * 0.19336,safezoneY * 0.36,safezoneW * 0.309999,safezoneH * 0.589918 ]
#define BGTRANS _trans1 = (0.5 max (0.9 - (_trans / 1.2)))
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
	║ Author: Hirschi - Die Liga
	╚══════════════════════════════════════════════════╝
*/
DISABLESER;
private["_trans","_trans1"];
PAR(_mode,0,0,0);
PAR(_mode1,1,0,0);
PAR(_exit,2,false,false);
_display 	= FDSIP(88888);
_bg1	 	= DIPCTRL(_display,88889);
_HGbild		= DIPCTRL(_display,88886);
_HGbild1	= DIPCTRL(_display,88880);
_set = GETPROFHG;
_trans = SEL(_set,2);

if(EQ(_mode,1)) exitWith {	
	private["_conf"];
	if(CHECKSET(0) || EQ(_mode1,1)) exitWith {
		if!(EQ(_mode1,1))then{	{CTRLAUS(_x)}forEach VARARR;};
		if!(ctrlShown _bg1)then{
			_bg1 ctrlSetPosition POS1;
			CTRLTEXTCOLORNULL(_bg1);
			SETANIM(_bg1,0);
			CTRLAN(_bg1);
			if!(CHECKSET(0))then{	BGTRANS;}else{_trans1 = _trans};
			for [{_i=_trans1},{_i>=0},{_i=_i-0.03}] do {
					
				_bg1 ctrlSetTextColor [0,0,_i,(_trans1 - _i)];			
				SETANIM(_bg1,0);			
				BLENDSLEEP;			
			};			
		};
	};	
	
	if(CHECKSET(1)) then {_conf = "HG1"	}else{_conf = "HG9"};	
	if(CHECKSET(2)) then {_conf = "HG2"	};	
	if(CHECKSET(3)) then {_conf = "HG3"	};	
	if(CHECKSET(4)) then {_conf = "HG4"	};	
	if(CHECKSET(5)) then {_conf = "HG5"	};	
	if(CHECKSET(6)) then {_conf = "HG6"	};	
	if(CHECKSET(7)) then {_conf = "HG7"	};	
	if(CHECKSET(8)) then {_conf = "HG8"	};	
	if(CHECKSET(9)) then {_conf = "HG9"	};	
	
	_hgconf = SEL(HG(_conf),0);	
	
	{_x ctrlSetText _hgconf; _x ctrlSetPosition HGPOS1;}forEach VARARR;
	
	CTRLAUS(_bg1);
	{
		if!(ctrlShown _x)then{
			CTRLTEXTCOLORNULL(_x);
			SETANIM(_x,0);			
			[_x,_trans]spawn {
				DISABLESER;				
				_ctrl = SEL(_this,0);
				_tran = SEL(_this,1);
				CTRLAN(_ctrl);
				for [{_i=0},{_i<=_tran},{_i=_i+0.01}] do {						
					_ctrl ctrlSetTextColor [1,1,1,_i];			
					SETANIM(_ctrl,0);			
					BLENDSLEEP;			
				};	
			};
		};		
		
	}forEach VARARR;		
	
};


if(EQ(_mode,0)) exitWith {
	
	if(CHECKSET(0) || EQ(_mode1,1)) exitWith {
		if!(( ctrlShown _HGbild || ctrlShown _HGbild) && EQ(_mode1,1))exitWith{};
		
		if(ctrlShown _bg1)then{
			//if(EQ(_exit,true))exitWith{};
			if!(CHECKSET(0))then{	BGTRANS;}else{_trans1 = _trans};
			_bg1 ctrlSetTextColor [0,0,0,_trans1];
			SETANIM(_bg1,0);
			for [{_i=0},{_i<_trans1},{_i=_i+0.02}] do {
					
				_bg1 ctrlSetTextColor [0,0,_i,(_trans1 - _i)];			
				SETANIM(_bg1,0);			
				BLENDSLEEP;			
			};			
		};
		CTRLAUS(_bg1);
		SETNULLPOS(_bg1);	
		SETANIM(_bg1,0);		
	};	
	
	
	
	{
		if(ctrlShown _x)then{	
			
			[_x,_trans]spawn {
				DISABLESER;
				_ctrl = SEL(_this,0);
				_tran = SEL(_this,1);
				for [{_i=_tran},{_i>=0},{_i=_i-0.02}] do {						
					_ctrl ctrlSetTextColor [1,1,1,_i];			
					SETANIM(_ctrl,0);			
					BLENDSLEEP;			
				};	
				CTRLAUS(_ctrl);	
			SETNULLPOS(_ctrl);
			SETANIM(_ctrl,0);
				
			};			
		};		
	}forEach VARARR;	
	
	uiSleep 0.6;
	
};

if(EQ(_mode,2)) exitWith {
		
		{
		if(ctrlShown _x)then{	
			
			[_x,_trans]spawn {
				DISABLESER;
				_ctrl = SEL(_this,0);
				_tran = SEL(_this,1);
				for [{_i=_tran},{_i>=0},{_i=_i-0.03}] do {						
					_ctrl ctrlSetTextColor [1,1,1,_i];			
					SETANIM(_ctrl,0);			
					BLENDSLEEP;			
				};	
				CTRLAUS(_ctrl);	
			SETNULLPOS(_ctrl);
			SETANIM(_ctrl,0);
				
			};			
		};		
	}forEach VARARRALL;	
		if(ctrlShown _bg1)then{			
			if(CHECKSET(0))then{	
				_trans1 = _trans;
				_bg1 ctrlSetTextColor [0,0,0,_trans1];
				SETANIM(_bg1,0);
				for [{_i=_trans1},{_i>=0},{_i=_i-0.03}] do {
						
					_bg1 ctrlSetTextColor [0,0,_trans1 - _i,( _i)];			
					SETANIM(_bg1,0);			
					BLENDSLEEP;			
				};			
			};
		};
		
	uiSleep 0.6;
};
