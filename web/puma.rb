@app = "/apps/Fire"
@web = @app
@tmp = "#{@app}/tmp"

port 9292
quiet false

directory @web
workers 4
preload_app!

# /bin/kill -USR2 `cat /app/Movie/app/tmp/puma.pid 2>/dev/null` でhot restart
#bind "unix://#{@tmp}/puma.sock"
pidfile "#{@tmp}/puma.pid"
state_path "#{@tmp}/puma.state"
threads 0, 16
