ip := `ip route | grep '^default' | awk '{print $9}'`

# list available commands
list:
  @ just -l

build VERSION:
  @ mkdir ./builds/{{VERSION}}
  @ godot --headless --export-release Web ./builds/{{VERSION}}/index.html

serve VERSION:
  @ qrrs "http://{{ip}}" -m 1
  @ echo "http://{{ip}}"
  @ http-server ./builds/{{VERSION}}
