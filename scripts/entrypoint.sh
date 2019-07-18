#!/bin/bash
. /appenv/bin/activate
exec $@ # this will let PID stick to 1 thus docker SIGTERM will gracefully stop the container rather than kill it, since if the application process is not pid1, pid1 will send kill signal to other pids