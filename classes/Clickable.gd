class_name Clickable extends CollisionObject3D

var hover := false;

func _ready() -> void:
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)
	input_event.connect(on_input_event)
	
func on_mouse_entered() -> void:
	pass

func on_mouse_exited() -> void:
	pass

func on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	pass
