Scope.kr(4,0)

s.boot
b = Bus.control(s,3);
b.scope;
b.scope.view.alwaysOnTop = true;
b.index

(
SynthDef(\fade, {|bus = 0, value = 0, fadeTime = 1|
	//var out = In.kr(bus);
	var from = Out.kr(bus+1, In.kr(bus) * EnvGen.kr(Env([1,0], fadeTime, \lin), doneAction:2));
	var to = Out.kr(bus+2, In.kr(bus) * EnvGen.kr(Env([0,1], fadeTime, \lin), doneAction:0));
	//var to = Out.kr(bus+2, value);
	//var test = Bus.control(s,1);
	/*
	//var from = In.kr(bus,1);
	var fade = EnvGen.kr(Env([In.kr(bus),value], [fadeTime], \sin),doneAction:2);
	//ReplaceOut.kr(bus, fade);
	//var fade = EnvGen.kr(Env([from,value], fadeTime, \sin),doneAction:0);
	*/
	//var old = In.kr(bus, 1);
	//var fadeIn = EnvGen.kr(Env([0,1], fadeTime, \lin));
	//var fadeOut = EnvGen.kr(Env([1,0], fadeTime, \lin), doneAction:2);

	//test.value = value;

	//var fade = EnvGen.kr(Env([In.kr(bus),value], [fadeTime], \sin),doneAction:2);
	var fadeOut = EnvGen.kr(Env([0,1], fadeTime, \lin));
	var fadeIn = EnvGen.kr(Env([1,0], fadeTime, \lin),doneAction:2);

	//XOut.kr(bus, fade, value);
	ReplaceOut.kr(bus+1, fadeIn, value );
	ReplaceOut.kr(bus+2, fadeOut, 0 );
	Out.kr(bus, In.kr(bus+1)+In.kr(bus+2));
	//ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), value], [fadeTime], \sin), \trig.tr(1), doneAction: 2))
}).add;
)

Synth(\fade, [\bus, 0, \value, 0.9, \fadeTime, 2]);
Synth(\fade, [\bus, 0, \value, 0.1, \fadeTime, 2]);

a = Synth(\fade, [\bus, 0, \value, 0.1, \fadeTime, 4, \curve, 3]);
a.set(\value, 0.0, \trig, 1)
a.set(\value, 0.0)
a.free

/*
ProxySynthDef(\vol, { //|vol = 1, ft = 8|
	var bus = \out.kr;
	var in = In.ar(bus,2);

	//var fade = EnvGen.kr(Env([1,0], \fadeTime.kr(ft), \sin), );
	//var sig = in * \vol.kr;
	ReplaceOut.ar(bus, in * \vol.kr(1, \ft.kr(0)));
	// XOut.ar(bus, fade, in);
}).store(dir: ~gitSynthDefDir);


SynthDef(\fShift, { | bus target dur |
	ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), target], [dur], \sin), doneAction: 2))
}).add;

	SynthDef(\sinenv, { | bus val time |
		ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), val], [time], \sin), doneAction: 2))
	}).add;
*/