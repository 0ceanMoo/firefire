@app = "/home/wakutsu/Fire/app"
@web = "#{@app}/web"
@tmp = "#{@app}/var/tmp"
@log = "#{@app}/var/log"

working_directory @web
worker_processes 1

listen 4567
pid "#{@tmp}/unicorn.pid"

preload_app false
timeout 30

#stderr_path "#{@log}/unicorn.stderr.log"
#stdout_path "#{@log}/unicorn.stdout.log"
