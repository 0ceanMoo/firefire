@app = "/apps/Fire"
@web = "#{@app}/app/web"
@tmp = "#{@app}/tmp"

working_directory @web
worker_processes 1

listen 9292
pid "#{@tmp}/unicorn.pid"

