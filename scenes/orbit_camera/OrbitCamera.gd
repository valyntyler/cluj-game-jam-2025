extends Node3D

@export var SCROLL_SPEED: float = 10;
@export var ZOOM_SPEED: float = 5;
@export var DEFAULT_DISTANCE: float = 10;
@export var ROTATE_SPEED: float = 0.25;
@export var CAMERA_NODE_PATH: NodePath;
@export var MOUSE_ZOOM_SPEED: float = 10;
@export var INVERT_MOUSE: bool = false;
@export var MIN_DISTANCE: float = 2.5;
@export var MAX_DISTANCE: float = 50;

var _move_speed: Vector2;
var _scroll_speed: float;

var _is_zoom_in: bool;
var _is_zoom_out: bool;

var _distance: float;
var _camera: Node3D;
var _rotation: Vector3;

func _ready() -> void:
	_distance = DEFAULT_DISTANCE;
	_camera = self.get_node(CAMERA_NODE_PATH);
	_rotation = _camera.transform.basis.get_rotation_quaternion().get_euler();
	
func _process(delta: float) -> void:
	if _is_zoom_in:
		_scroll_speed = -1 * ZOOM_SPEED;
	if _is_zoom_out:
		_scroll_speed = 1 * ZOOM_SPEED;
	_move(delta);
	
func _move(delta: float) -> void:
	
	_rotation.x += (1 if INVERT_MOUSE else -1) * _move_speed.y * delta * ROTATE_SPEED;
	_rotation.y += (1 if INVERT_MOUSE else -1) * _move_speed.x * delta * ROTATE_SPEED;
	if _rotation.x < -PI / 2:
		_rotation.x = -PI / 2;
	if _rotation.x > PI / 2:
		_rotation.x = PI / 2;
	_move_speed = Vector2();
	
	_distance += _scroll_speed * delta;
	if _distance < 0:
		_distance = 0;
	_scroll_speed = 0;
	
	_camera.set_identity();
	_camera.translate_object_local(Vector3(0, 0, _distance));
	self.set_identity();
	self.transform.basis = Basis(Quaternion.from_euler(_rotation));
	
func _input(event):
	if event is InputEventMouseMotion:
		_process_mouse_motion_event(event);
	if event is InputEventMouseButton:
		_process_mouse_scroll_event(event);
	
		
func _process_mouse_motion_event(event) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		_move_speed = event.relative;

func _process_mouse_scroll_event(event: InputEventMouseButton) -> void:
	if event.button_index == MOUSE_BUTTON_WHEEL_UP:
		_scroll_speed = -1 * SCROLL_SPEED * _distance_falloff(_distance, MIN_DISTANCE, MAX_DISTANCE);
		if _distance < MIN_DISTANCE:
			_scroll_speed = 0.0;
	elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		_scroll_speed = 1 * SCROLL_SPEED * _distance_falloff(_distance, MAX_DISTANCE, MIN_DISTANCE);

func _distance_falloff(distance: float, min_distance: float, max_distance: float) -> float:
	if distance <= min_distance:
		return 1.0;
	elif distance >= max_distance:
		return 0.0;
	else:
		#var normalized_min_distance: float = (distance - min_distance) / (max_distance - min_distance);
		#var normalized_max_distance: float = (max_distance - distance) / (max_distance - min_distance);
		#
		#var falloff_from_min: float = log(normalized_min_distance);
		#var falloff_from_max: float = log(normalized_max_distance);
		#
		#var combined_falloff = min(falloff_from_min, falloff_from_max);
		#
		#return clamp(combined_falloff, 0.0, 1.0);
		return min(log(-distance + max_distance), log(distance - min_distance));
