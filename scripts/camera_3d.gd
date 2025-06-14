extends Camera3D

var ray_origin: Vector3
var ray_end: Vector3


func _process(_delta: float) -> void:
	var space_state = get_world_3d().direct_space_state
	var mouse_position = get_viewport().get_mouse_position()

	ray_origin = project_ray_origin(mouse_position)
	ray_end = project_ray_normal(mouse_position) * 2000.0

	var query = PhysicsRayQueryParameters3D.create(ray_origin, ray_end)
	var intersection = space_state.intersect_ray(query)

	if not intersection.is_empty():
		DebugDraw3D.draw_sphere(intersection.position, 0.01, Color.RED)
		for child in intersection.collider.get_children():
			if child is ScreenCastTarget:
				child._click.emit()
