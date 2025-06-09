#!/usr/bin/env nu

def main [name: string] {
  rm -r builds/
  mkdir builds/
  godot --headless --export-release Web
  gh release create $name
  ^zip -r build.zip builds/
  gh release upload $name build.zip
  rm build.zip
}
