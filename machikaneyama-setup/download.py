#! /usr/bin/python

# Download script for Machikaneyama 2002 written by Synge Todo
#
# reference:
#   Emulating a Browser in Python with mechanize
#   http://stockrt.github.io/p/emulating-a-browser-in-python-with-mechanize/

import os
import sys
import mechanize

import config

def Download(url, file, email, password, targetdir):
    # Create Browser
    br = mechanize.Browser()
    
    # Browser options
    br.set_handle_equiv(True)
    br.set_handle_redirect(True)
    br.set_handle_referer(True)
    br.set_handle_robots(False)
    
    # Follows refresh 0 but not hangs on refresh > 0
    br.set_handle_refresh(mechanize._http.HTTPRefreshProcessor(), max_time=1)
    
    # Open Machikaneyama download page
    print "Connecting to " + url + "..."
    res = br.open(url)
    
    # Fill form with email and password
    print "Submitting email and password..."
    br.select_form(nr = 0)
    br["MAIL"] = email
    br["PW"] = password
    br.submit()
    try:
        req = br.click_link(text = file)
    except mechanize._mechanize.LinkNotFoundError:
        print "Invalid email and/or password"
        return 127
        
    # Download tarball
    print "Downloading " + file + "..."
    br.open(req)
    body = br.response().read()
    f = open(os.path.join(targetdir, file), 'w')
    f.write(body)
    f.close()
    print "Done."
    return 0

if __name__ == '__main__':
    if (len(sys.argv) != 4):
        print "Usage:", sys.argv[0], "email", "password", "target_directory"
        sys.exit(127)
    email = sys.argv[1]
    password = sys.argv[2]
    targetdir = sys.argv[3]
    ret = Download(config.url, config.tarfile, email, password, targetdir)
    sys.exit(ret)
