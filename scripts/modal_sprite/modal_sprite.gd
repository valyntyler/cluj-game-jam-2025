@tool
extends Node2D

@export var off_state: Texture2D
@export var on_state: Texture2D
@export var is_open: bool = false

var sprite: Sprite2D = Sprite2D.new()


func _ready() -> void:
	add_child(sprite)


func _process(_delta: float) -> void:
	sprite.texture = on_state if is_open else off_state
