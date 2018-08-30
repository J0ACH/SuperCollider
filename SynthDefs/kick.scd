(
SynthDef(\kick, {|bus = 0, gate = 1, time = 1|
	var attackTime = 0.15;
	var aEnv = EnvGen.kr(Env([0,1,0], [attackTime,time - attackTime], [3,-3]),doneAction:2);
	var fEnv = EnvGen.kr(Env([40,1400,40], [0.03,0.19], [16,-8]));
	var sig = SinOsc.ar(freq:fEnv!2, mul:aEnv);
	Out.ar(bus, sig);
}).store(dir: Library.at(\folders,\synths));
)

Synth(\kick);//, [\time, 2]);
Synth(\kick, [\time, 4]);

Env([1400,1400,40], [0.15,0.09], [\hold,-8]).plot

Pdef(\drum, Pbind(\instrument, \kick, \dur, 1)).play
Pdef(\drum).stop

TempoClock.default.tempo_(130/60);