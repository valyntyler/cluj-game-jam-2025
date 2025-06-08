extends Node2D

@onready var sprite = $ModalSprite
@onready var open_sound: AudioStreamPlayer = $OpenSound
@onready var close_sound: AudioStreamPlayer = $CloseSound


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if (
		event is InputEventMouseButton
		and event.is_pressed()
		and event.button_index == MOUSE_BUTTON_LEFT
	):
		if sprite.open:
			sprite.open = false
			close_sound.play()
		else:
			sprite.open = true
			open_sound.play()
