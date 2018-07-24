(

s.waitForBoot({

	var gitFolder = "C:/GitHub/SuperCollider";

	if(PathName(gitFolder).isFolder.not)
	{ "Variable set as \"gitFolder\" in startup file not found folder %".format(gitFolder).warn; }
	{
		var synthDir = gitFolder ++ "/Synths/";
		var synthDefDir = gitFolder ++ "/SynthDefs/";
		var classDir = gitFolder ++ "/Classes/";

		var synDefFiles = "*.scsyndef";
		var synDefPaths = synthDir ++ synDefFiles;

		synDefPaths.postln;

		"\nStartupFile modification:".postln;

		Library.put(\folders, \git, gitFolder);
		Library.put(\folders, \synths, synthDir);
		Library.put(\folders, \synthdefs, synthDefDir);
		Library.put(\folders, \classes, classDir);

		"\nGlobal variables added to library:".postln;
		"\t- Library.at(\\folders,\\git) = %".format(Library.at(\folders,\git)).postln;
		"\t- Library.at(\\folders,\\synths) = %".format(Library.at(\folders,\synths)).postln;
		"\t- Library.at(\\folders,\\synthdefs) = %".format(Library.at(\folders,\synthdefs)).postln;
		"\t- Library.at(\\folders,\\classes) = %".format(Library.at(\folders,\classes)).postln;

		"\nLoading synths from directory: %".format(Library.at(\folders,\synths)).postln;
		synDefPaths.pathMatch.do { |filename|
			var oneFile = PathName(filename).fileNameWithoutExtension;
			"\t- %".format(oneFile).postln;
		};

		Server.default.loadDirectory(Library.at(\folders,\synths), "All external synths loaded...".postln);
		Server.default.plotTreeView(
			interval: 0.05,
			parent: Window.new(
				name:\plotTree,
				bounds:Rect(Window.availableBounds.width-330,Window.availableBounds.height-910,300,500)
			).front.alpha_(0.5).alwaysOnTop_(true)
		);
		Server.default.scope(4,0,rate:\control).view.bounds_(
			Rect(
				Window.availableBounds.width-330,
				Window.availableBounds.height-370,300,300
		)).alpha_(0.5).alwaysOnTop_(true);
	};
});

)
