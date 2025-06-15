ip := `ip route | grep '^default' | awk '{print $9}'`

# list available commands
list:
  @ just -l

show URL:
  @ qrrs {{URL}} -m 1
  @ echo {{URL}}

build VERSION:
  @ mkdir ./builds/{{VERSION}}
  @ godot --headless --export-release Web ./builds/{{VERSION}}/index.html

serve VERSION:
  @ just show "http://{{ip}}"
  @ http-server ./builds/{{VERSION}}

deploy VERSION:
  @ scp -r ./builds/{{VERSION}} pi@ssh.valyntyler.com:~/Projects/demo
  @ ssh pi@ssh.valyntyler.com "sudo systemctl restart game-demo.service"
