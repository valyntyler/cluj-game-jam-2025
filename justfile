ip := `ip route | grep '^default' | awk '{print $9}'`

# list available commands
list:
  @ just -l

show URL:
  @ qrrs {{URL}} -m 1
  @ echo {{URL}}

build VERSION:
  @ rm -r ./builds/{{VERSION}}
  @ mkdir ./builds/{{VERSION}}
  @ godot --headless --export-release Web ./builds/{{VERSION}}/index.html

deploy VERSION:
  @ scp -r ./builds/{{VERSION}} pi@ssh.valyntyler.com:~/Projects/demo
  @ ssh pi@ssh.valyntyler.com "sudo systemctl restart game-demo.service"

release VERSION="debug":
  @ just build {{VERSION}}
  @ just deploy {{VERSION}}
  @ just show "http://demo.valyntyler.com/{{VERSION}}"
