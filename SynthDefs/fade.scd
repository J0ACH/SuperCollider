(
SynthDef(\fade, {|bus = 0, value = 0, fadeTime = 1|
	var fade = EnvGen.kr(Env([In.kr(bus), value], [fadeTime], \sin),doneAction:2);
	ReplaceOut.kr(bus, fade);
}).store(dir: Library.at(\folders,\synths));
)

Synth.tail(s, \fade, [\bus, 0, \value, 0.2, \fadeTime, 2]);

