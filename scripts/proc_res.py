#!/usr/bin/python

import time
import os
import subprocess
import sys

def is_process_alive(p_name):
    #print "checking ps -ef for %s..." % p_name
    #print "ps -aux | grep %s | grep -v grep | awk '{ print $2 }'" % p_name
    ps_file = os.popen("ps -aux | grep %s |grep java" % p_name)
    ps_list = ps_file.readlines()
    ps_file.close()
    #print "list: %s and len: %d" %(ps_list, len(ps_list))
    if len(ps_list)<=1:
        return False
    return True

def run_loop():
    p_names = sys.argv[1:]
    if p_names==[]:
        print "no process names to check... exiting"
        sys.exit(0)
    while True:
        time.sleep(2)
        for p_name in p_names:
            if is_process_alive(p_name):
        #        print "."
                continue
            elif p_name == 'nucleus-api':
                print "starting nucleus-api process"
                subprocess.Popen(["nohup", "java", "-XX:+UseG1GC", "-jar", "/data/backup/api/nucleus-api-0.1.0.jar"])
	    elif p_name == 'nucleus-pages':
		print "starting nucleus-pages process"
		subprocess.Popen(["nohup", "java", "-XX:+UseG1GC", "-jar", "/data/backup/pages/nucleus-pages-0.1.0.jar"])
            else:
                print "Don't know what to do for " + p_name

if __name__ == '__main__':
    run_loop()

