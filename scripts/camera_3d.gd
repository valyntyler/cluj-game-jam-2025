extends Camera3D


func _process(_delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	var world_pos = project_position(mouse_pos, position.z)
	print(world_pos)
