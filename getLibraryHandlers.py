#!/usr/bin/python
# encoding: utf-8

from __future__ import unicode_literals

import os
import sys
import re
from workflow import Workflow3

wf = None
log = None

nothing_found_error_text = 'Nothing found'


def main(wf):

    scriptLibRtf = "~/Dropbox/Library/Script Libraries/Kevin's Library.scptd/Contents/Resources/Scripts/main.recover.rtf"
    scriptLibTxt = "~/Dropbox/Library/Script Libraries/Kevin's Library.scptd/Contents/Resources/Scripts/main.recover.txt"
    os.system("textutil -convert txt /Users/kevinfunderburg/Dropbox/Library/Script\ Libraries/Kevin\\'s\ Library.scptd/Contents/Resources/Scripts/main.recover.rtf")
    file = open(os.path.expanduser(scriptLibTxt), "r")
    fileText = file.read()
    matches = re.findall("^on .*", fileText)
    # print(file)

    try:
        thePath = os.getenv('thePath')
    except Exception:
        thePath = None
        pass

    if thePath is None:
        theFolder = clipFolders
    else:
        theFolder = [thePath]

    x = 0


    return wf.send_feedback()

if __name__ == "__main__":
    wf = Workflow3()
    log = wf.logger
    sys.exit(wf.run(main))
