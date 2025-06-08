@tool
class_name ModalFurniture
extends ModalSprite

var audio_player: AudioStreamPlayer = AudioStreamPlayer.new()

@export var open_sound: AudioStream
@export var close_sound: AudioStream


func _ready() -> void:
	add_child(sprite)
	add_child(audio_player)
	open = false


func _input(event: InputEvent) -> void:
	if (
		event is InputEventMouseButton
		and event.is_pressed()
		and event.button_index == MOUSE_BUTTON_LEFT
	):
		if open:
			audio_player.stream = open_sound
			audio_player.play()
		else:
			audio_player.stream = close_sound
			audio_player.play()
		open = !open
