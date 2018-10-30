@app = "/home/wakutsu/Fire"
@web = "#{@app}/app/web"
@tmp = "#{@app}/tmp"
@log = "#{@app}/log"

working_directory @web
worker_processes 1

listen 4567
pid "#{@tmp}/unicorn.pid"

preload_app false
timeout 30

#stderr_path "#{@log}/unicorn.stderr.log"
#stdout_path "#{@log}/unicorn.stdout.log"
