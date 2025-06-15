class_name Unit extends Clickable

@onready
var mesh: MeshInstance3D = get_children().filter(func(c): return c is MeshInstance3D).front()


func on_mouse_entered() -> void:
	mesh.material_override.albedo_color = Color.RED
	hover = true


func on_mouse_exited() -> void:
	mesh.material_override.albedo_color = Color.WHITE
	hover = false


func on_input_event(
	camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int
) -> void:
	if event is InputEventMouseButton:
		GridManager.set_selected_unit(self);
		
		mesh.material_override.albedo_color = Color.GREEN
