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
║	File: fn_clanKey.sqf
║	Author: Hirschi Liga-Life 
║	 
║	Description:
║	Clan Lizensen 6 Bit 
╠═══════════════════════════════════════════════════
║_______________________________________________________________
║	_a		 |	_b		  |	_c			 |	_d		  |	_e	   |_f												|
║________________________________________________________________
║	lci_liga	 |	lci_stlkr |	lci_admin |	lci_adm |	lci_sil |	lci_ano										|
║________________________________________________________________________
║	0			 |	0			  |	1				 |	0			  |	0		  | 0					=		R.O.G.				-	cl_rog
║	0			 |	0			  |	0				 |	0			  |	1		  |	0					=		SILVA				-	cl_sil
║	0			 |	0			  |	0				 |	0			  |	0		  |	1					=		Anonymus		-	cl_ano
║	0			 |	1			  |	0				 |	0			  |	0		  |	0					=		S.T.L.K.R.		-	cl_stlkr
║	1			 |	0			  |	0				 |	0			  |	0		  |	0					=		LIGA				-	cl_liga
║	0			 |	0			  |	0				 |	1			  |	0		  |	0					=		Admin				-	cl_admi
║---------------------------------------------------------------------------------------------------------------------------
║	0			 |	0			  |	0				 |	0			  |	1		  |	1					=		A.o.D.				-	cl_aod
║	0			 |	0			  |	0				 |	1			  |	1		  |	1					=		R.N.S.X			-	cl_rnsx
║	0			 |	0			  |	1				 |	1			  |	1		  |	1					=		SKULL			-	cl_skull
╚═══════════════════════════════════════════════════	
*/

_a = false ; _a = lci_liga;
_b = false ; _b = lci_stlkr;
_c = false ; _c = lci_admin;
_d = false ; _d = lci_adm;
_e = false ; _e = lci_sil;
_f  = false ; _f  = lci_ano;


cl_rog = false;
cl_sil = false;
cl_ano = false;
cl_stlkr = false;
cl_liga = false;
cl_admi = false;
cl_aod = false;
cl_rnsx = false;
cl_skull = false;

if ( !_a && !_b && _c && !_d && !_e && !_f ) exitWith { cl_rog = true;};			//001000
if ( !_a && !_b && !_c && !_d && _e && !_f ) exitWith { cl_sil = true;};			//000010
if ( !_a && !_b && !_c && !_d && !_e && _f ) exitWith { cl_ano = true;};		//000001
if ( !_a && _b && !_c && !_d && !_e && !_f ) exitWith { cl_stlkr = true;};		//010000
if ( _a && !_b && !_c && !_d && !_e && !_f ) exitWith { cl_liga = true;};		//100000
if ( !_a && !_b && !_c && _d && !_e && !_f ) exitWith { cl_admi = true;};		//000100

if ( !_a && !_b && !_c && !_d && _e && _f ) exitWith { cl_aod = true;};			//000011
if ( !_a && !_b && !_c && _d && _e && _f ) exitWith { cl_rnsx = true;};			//000111
if ( !_a && !_b && _c && _d && _e && _f ) exitWith { cl_skull = true;};			//001111


