@tool
class_name CameraController2D
extends Camera2D

@export_group("Zooming")
@export var zoom_sensitivity: float = 0.1
@export var zoom_smoothing: float = 0.2
@export var min_zoom: float = 0.4
@export var max_zoom: float = 4.0

@export_group("Movement")
@export var move_speed: float = 0.5
@export var centering_force: float = 1.0

@export_group("Bounds")
@export var center: Vector2:
	set(value):
		center = value
		queue_redraw()
@export var size: Vector2:
	set(value):
		size = value
		queue_redraw()

var zoom_scale: float = 1.0
var move_delta: Vector2 = Vector2.ZERO
var last_point: Vector2 = Vector2.ZERO


func get_rect() -> Rect2:
	return Rect2(center - size / 2, size)


func _draw():
	if Engine.is_editor_hint():
		draw_rect(get_rect(), Color(0.5, 0.8, 0.8, 1), false)


func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		return

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		position -= (move_delta * move_speed) / zoom_scale

	# Geometry2D.segment_intersects_segment()

	position = position.lerp(last_point, delta * centering_force / zoom_scale)
	if get_rect().has_point(position):
		last_point = position

	zoom = zoom.lerp(Vector2.ONE * zoom_scale, delta / zoom_smoothing)


func _input(event):
	if Engine.is_editor_hint():
		return

	match event:
		var motion when motion is InputEventMouseMotion:
			move_delta = motion.relative
		var button when button is InputEventMouseButton:
			match button.button_index:
				MOUSE_BUTTON_WHEEL_UP:
					zoom_scale *= (1 + zoom_sensitivity)
				MOUSE_BUTTON_WHEEL_DOWN:
					zoom_scale *= (1 - zoom_sensitivity)
			zoom_scale = clamp(zoom_scale, min_zoom, max_zoom)
