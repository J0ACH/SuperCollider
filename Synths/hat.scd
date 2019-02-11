(
SynthDef(\hat, {|out = 0, gate = 1, time = 1, vol = 1, freq = 2800|
	var attackTime = 0.15;
	var aEnv = EnvGen.kr(Env([0,vol,0], [0.15, 0.05], [6,-3]), doneAction:2);
	//var fEnv = EnvGen.kr(Env([30,48,freq,[200,450],30], [attackTime-0.03, 0.03,[0.03,0.01],0.19], [2,24,-8,-8]));
	var sig = WhiteNoise.ar(mul:aEnv);
	Out.ar(out, sig);
}).store;
)

/*
Pbindef(\hat, \instrument, \hat, \out, 0)
Pbindef(\hat, \vol, 0).play
Pbindef(\hat).fadeTime = 4

Pbindef(\hat, \time, 0.05)
Pbindef(\hat).stop


Pbindef(\hat).player



TempoClock.default.tempo_(127/60)
*/