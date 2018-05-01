//////////////////////////////////////////////////////////////
// MADE BY MOERDERHOSCHI
// EDITED VERSION OF THE ARMA2 ORIGINAL SCRIPT
// EDITED by Hirschi Liga-Life
// ARMED-ASSAULT.DE
// 06.11.2013
//////////////////////////////////////////////////////////////


[] spawn {
	_pos = position player;
	_parray = [
		["A3\Data_F\ParticleEffects\Universal\Universal", 16, 12, 8, 1],
		"",
		"Billboard",
		1,
	4,
	[0,0,0],
		[0,0,0],
			1,
	0.000001,
		0,
	1.4,
		[0.05,0.05],
		[[1,1,1,1]],
	[0,1],
			0.2,
		15.2,
			"",
		"",
			vehicle player
	];
	_snow = "#particlesource" createVehicleLocal _pos;  
	_snow setParticleParams _parray;
	_snow setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
	_snow setParticleCircle [0.0, [0, 0, 0]];
	_snow setDropInterval 0.01;
};