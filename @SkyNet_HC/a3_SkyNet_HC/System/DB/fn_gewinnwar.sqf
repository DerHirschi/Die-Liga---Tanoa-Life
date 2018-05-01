	_ar = _this select 0;
	_val1 = _ar select 1;
	_val3 = _ar select 3;
	_val5 = _ar select 5;
	//SKY_ad_link = [0,2,_val1,_val3 ,_val5 ]; 
	{
		//_x publicVariableClient "SKY_ad_link";
		[0,2,_val1,_val3 ,_val5 ] remoteExec ["fn_adlink",_x]
	}forEach activ_adm_ara3 + activ_adm_ara4 + activ_adm_ara5;
		
	[6,_val1,(_ar select 2),_val3 ,(_ar select 4),_val5] spawn SKY_fnc_DBlogSys;