@tool
class_name ModalSprite
extends Node2D

var sprite: Sprite2D = Sprite2D.new()

@export var on_state: Texture2D
@export var off_state: Texture2D

@export var open: bool = false:
	set(value):
		open = value
		sprite.texture = on_state if open else off_state


func _ready() -> void:
	add_child(sprite)
	open = false
