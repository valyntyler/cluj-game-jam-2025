extends Node3D


func _ready() -> void:
	print("heyo")


func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().quit()
