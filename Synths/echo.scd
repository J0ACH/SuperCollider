(
SynthDef(\echo, {|bus = 0|
	var sig = In.ar(bus, 2);
	sig = GVerb.ar(sig, revtime:1);
	Out.ar(0, sig);
//}).store(dir: Library.at(\folders,\synths));
}).store;
)

/*
Synth(\echo, [\bus, 10]);

Pfx(Pdef(\drum), \echo, \bus, 10).play

Pdef(\efx, Pmono(\verb, \instrument, \echo, \bus, 10))
Pdef(\efx).play

Pbindef(\efx, \instrument, \echo, \bus, 10)
Pbindef(\efx).play
*/