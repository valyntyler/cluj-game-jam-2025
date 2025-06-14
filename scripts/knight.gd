extends StaticBody3D

var hover := false
@onready var knight: MeshInstance3D = $Knight


func _process(_delta: float) -> void:
	print(hover)
	knight.material_override.albedo_color = Color.RED if hover else Color.WHITE


func _on_mouse_entered() -> void:
	hover = true


func _on_mouse_exited() -> void:
	hover = false
