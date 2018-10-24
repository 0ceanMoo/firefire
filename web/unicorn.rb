@app = "/apps/Fire"
@web = "#{@app}/web"
@tmp = "#{@app}/tmp"

working_directory @web
worker_processes 5

listen 9292
pid "#{@tmp}/unicorn.pid"

