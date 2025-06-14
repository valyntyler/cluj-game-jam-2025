# list available commands
list:
  @ just -l

build VERSION:
  @ mkdir ./builds/{{VERSION}}
  @ godot --headless --export-release Web ./builds/{{VERSION}}/index.html
