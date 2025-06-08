extends Sprite2D

@onready var area = $Area2D
@onready var sound = $AudioStreamPlayer


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if (
		event is InputEventMouseButton
		and event.is_pressed()
		and event.button_index == MOUSE_BUTTON_LEFT
	):
		sound.play()
