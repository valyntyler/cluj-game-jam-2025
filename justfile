ip := `ip route | grep '^default' | awk '{print $9}'`

# list available commands
list:
  @ just -l

# show the url on screen
show URL:
  @ qrrs {{URL}} -m 1
  @ echo {{URL}}

# build the project
build DIR:
  @ mkdir ./builds/{{DIR}}
  @ godot --headless --export-release Web ./builds/{{DIR}}/index.html

# deploy remotely
deploy DIR:
  @ scp -r ./builds/{{DIR}} pi@ssh.valyntyler.com:~/Projects/demo
  @ ssh pi@ssh.valyntyler.com "sudo systemctl restart game-demo.service"

# release a version of the project
release VERSION:
  @ just build {{VERSION}}
  @ just deploy {{VERSION}}
  @ just show "http://demo.valyntyler.com/{{VERSION}}"

# produce a debug build and deploy it
refresh:
  @just release debug
