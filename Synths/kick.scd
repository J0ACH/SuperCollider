(
SynthDef(\kick, {|out = 0, gate = 1, time = 1, amp = 1, freq = 2800|
	var attackTime = 0.15;
	var aEnv = EnvGen.kr(Env([0,amp,0], [attackTime,time - attackTime], [3,-3]), doneAction:2);
	var fEnv = EnvGen.kr(Env([30,48,freq,[200,450],30], [attackTime-0.03, 0.03,[0.03,0.01],0.19], [2,24,-8,-8]));
	var sig = SinOsc.ar(freq:fEnv, mul:aEnv);
	Out.ar(out, sig);
}).store;
)

/*
Synth(\kick);//, [\time, 2]);
Synth(\kick, [\time, 1]);

Env([30,48,1400,200,30], [0.15, 0.15 - 0.03,0.05,0.19], [2,24,-8,-8]).plot
Env([1400,1400,40], [0.15,0.09], [\hold,-8]).plot

Pbindef(\drum, \instrument, \kick, \out, 10)
Pbindef(\drum).play

Pbindef(\drum, \dur, Pseq([Pn(1,7),0.25,0.75], inf))

Pbindef(\drum).stop
Pbindef(\drum).fadeTime = 8
Pbindef(\drum).set(\amp, 0.2)


TempoClock.default.tempo_(130/60);

Pdef(\drum).class
*/
