use AppleScript version "2.4" -- Yosemite (10.10) or later
use framework "Foundation"
use scripting additions
use kl : script "Kevin's Library"
use ml : script "FileTagsLib"

property wf : missing value

on main(wf)
	
	tell application "Script Debugger"
		tell front document
			repeat with n from 1 to count of (get used script library files)
				add_result of wf given theUid:(missing value), theArg:POSIX path of item n of (get used script library files) & "Contents/Resources/Scripts/main.recover", theTitle:item n of (get used script libraries), theSubtitle:missing value, theIcon:{theType:"filepath", thePath:"icon.png"}, theAutocomplete:item n of (get used script libraries), theType:"default", isValid:"yes", theQuicklook:missing value, theVars:missing value, theMods:missing value, theText:missing value
			end repeat
		end tell
	end tell
	
	return wf's to_json(missing value)
end main


on run argv
	# get the workflow's source folder
	set workflowFolder to do shell script "pwd"
	
	# load the Workflow library
	if class of argv = script then
		set wlib to load script "/Users/kevinfunderburg/Dropbox/Library/Application Support/Alfred/Alfred.alfredpreferences/workflows/user.workflow.F6A37D71-A933-45CC-ACD7-BDB0FF05E773/q_workflow.scpt"
	else
		set wlib to load script workflowFolder & "/q_workflow.scpt" as POSIX file
	end if
	
	set wf to wlib's newWorkflow()
	main(wf)
end run
