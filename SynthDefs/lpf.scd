(
SynthDef(\lpf, { |bus = 0, freq = 400|
	//var bus = \out.kr;
	var in = In.ar(bus, 2);
	var sig = LPF.ar(in, freq);
	ReplaceOut.ar(bus,sig);
}).store(dir: Library.at(\folders,\synths));
)

Synth.tail(s, \lpf, [\bus, 0, \value, 400]);
