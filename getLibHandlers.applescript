use AppleScript version "2.4" -- Yosemite (10.10) or later
use framework "Foundation"
use scripting additions
use kl : script "Kevin's Library"
use ml : script "Text Utilities"

property wf : missing value
property thePath : missing value

on main(wf)
	local hotkeyTriggers
	local typedTriggers
	local sls
	
	set thePath to wf's getVar("libPath")
	-- make a tempory txt file from the rtf file stored within the Script Library, makes searching easier
	set f to do shell script "textutil -convert txt \"" & thePath & ".rtf\" && grep -o '^on .*' \"" & thePath & ".txt\""
	-- Delete the temporary file
	do shell script "rm \"" & thePath & ".txt\""
	
	repeat with i in paragraphs of f
		add_result of wf given theUid:(missing value), theArg:i, theTitle:i, theSubtitle:missing value, theIcon:{theType:"filepath", thePath:"icon.png"}, theAutocomplete:i, theType:"default", isValid:"yes", theQuicklook:missing value, theVars:missing value, theMods:missing value, theText:missing value
	end repeat
	return wf's to_json(missing value)
end main


on run argv
	# get the workflow's source folder
	set workflowFolder to do shell script "pwd"
	
	# load the Workflow library
	if class of argv = script then
		set wlib to load script "/Users/kevinfunderburg/Dropbox/Library/Application Support/Alfred/Alfred.alfredpreferences/workflows/user.workflow.F6A37D71-A933-45CC-ACD7-BDB0FF05E773/q_workflow.scpt"
		set thePath to "/Users/kevinfunderburg/Dropbox/Library/Script Libraries/Kevin's Library.scptd/Contents/Resources/Scripts/main.recover"
	else
		set wlib to load script workflowFolder & "/q_workflow.scpt" as POSIX file
	end if
	
	set wf to wlib's newWorkflow()
	main(wf)
end run
