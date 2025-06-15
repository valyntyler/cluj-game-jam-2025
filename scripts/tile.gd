extends Clickable

@onready var shader = load("res://assets/shaders/outline.gdshader")
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
	if event is not InputEventMouseButton:
		return
	mesh.material_override.albedo_color = Color.GREEN
	var shader_material = ShaderMaterial.new()
	shader_material.shader = shader
	mesh.material_override.next_pass = shader_material
