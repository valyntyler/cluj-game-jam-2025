extends StaticBody3D

var hover := false


func _process(_delta: float) -> void:
	print(hover)


func _on_mouse_entered() -> void:
	hover = true


func _on_mouse_exited() -> void:
	hover = false
