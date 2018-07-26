
(

var gitFolder = "C:/GitHub/SuperCollider";

if(PathName(gitFolder).isFolder.not)
{ "Variable set as \"gitFolder\" in startup file not found folder %".format(gitFolder).warn; }
{
	var synthDir = gitFolder ++ "/Synths/";
	var synthDefDir = gitFolder ++ "/SynthDefs/";
	var extesionDir = gitFolder ++ "/Extensions/";

	var synDefFiles = "*.scsyndef";
	var synDefPaths = synthDir ++ synDefFiles;

	var extesionDirIncluded = false;

	"\nStartupFile modification:".postln;

	Library.put(\folders, \git, gitFolder);
	Library.put(\folders, \synths, synthDir);
	Library.put(\folders, \synthdefs, synthDefDir);
	Library.put(\folders, \extensions, extesionDir);

	LanguageConfig.includePaths.do({|path| if(path == Library.at(\folders,\extensions)) { extesionDirIncluded = true; }	});
	if(extesionDirIncluded.not)
	{
		LanguageConfig.addIncludePath(Library.at(\folders,\extensions).asSymbol);
		LanguageConfig.store(nil);
		thisProcess.recompile;
	};

	"\nGlobal variables added to library:".postln;
	"\t- Library.at(\\folders,\\git) = %".format(Library.at(\folders,\git)).postln;
	"\t- Library.at(\\folders,\\synths) = %".format(Library.at(\folders,\synths)).postln;
	"\t- Library.at(\\folders,\\synthdefs) = %".format(Library.at(\folders,\synthdefs)).postln;
	"\t- Library.at(\\folders,\\extensions) = %".format(Library.at(\folders,\extensions)).postln;

	"\nLoading synths from directory: %".format(Library.at(\folders,\synths)).postln;
	synDefPaths.pathMatch.do { |filename|
		var oneFile = PathName(filename).fileNameWithoutExtension;
		"\t- %".format(oneFile).postln;
	};

	s.waitForBoot({
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

	});
};

)
