extends StaticBody3D

var hover := false
@onready
var mesh: MeshInstance3D = get_children().filter(func(c): return c is MeshInstance3D).front()


func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)


func _process(_delta: float) -> void:
	print(hover)
	mesh.material_override.albedo_color = Color.RED if hover else Color.WHITE


func _on_mouse_entered() -> void:
	hover = true


func _on_mouse_exited() -> void:
	hover = false
