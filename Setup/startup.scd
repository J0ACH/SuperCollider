(

var gitFolder = "C:/GitHub/SuperCollider";

if(PathName(gitFolder).isFolder.not)
{ "Variable set as \"gitFolder\" in startup file not found folder %".format(gitFolder).warn; }
{
	var synthDir = gitFolder ++ "/Synths";
	var synthDefDir = gitFolder ++ "/SynthDefs";
	var classDir = gitFolder ++ "/Classes";

	var synDefFiles = "*.scsyndef";
	var synDefPaths = synthDir +/+ synDefFiles;

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


	"\nSynths loaded from directory: %".format(Library.at(\folders,\synths)).postln;
	synDefPaths.pathMatch.do { |filename|
		var oneFile = PathName(filename).fileNameWithoutExtension;
		"\t- %".format(oneFile).postln;
	};

	SynthDescLib.global.read(synDefPaths);

};

)
