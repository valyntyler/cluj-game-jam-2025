extends Camera3D

@export var SCROLL_SPEED: float = 10;
@export var ZOOM_SPEED: float = 5;
@export var DEFAULT_DISTANCE: float = 10;
@export var ROTATE_SPEED: float = 0.25;
@export var ANCHOR_NODE_PATH: NodePath;
@export var MOUSE_ZOOM_SPEED: float = 10;
@export var TOUCH_INVERT: bool = false;

var _move_speed: Vector2;
var _scroll_speed: float;

var _is_zoom_in: bool;
var _is_zoom_out: bool;

var _distance: float;
var _anchor: Node3D;
var _rotation: Vector3;

func _ready() -> void:
	_distance = DEFAULT_DISTANCE;
	_anchor = self.get_node(ANCHOR_NODE_PATH);
	_rotation = _anchor.transform.basis.get_rotation_quaternion().get_euler();
	
func _process(delta: float) -> void:
	if _is_zoom_in:
		_scroll_speed = -1 * ZOOM_SPEED;
	if _is_zoom_out:
		_scroll_speed = 1 * ZOOM_SPEED;
	_move(delta);
	
func _move(delta: float) -> void:
	_rotation.x += -_move_speed.y * delta * ROTATE_SPEED;
	_rotation.y += _move_speed.x * delta * ROTATE_SPEED;
	if _rotation.x < -PI / 2:
		_rotation.x = -PI / 2;
	if _rotation.x > PI / 2:
		_rotation.x = PI / 2;
	_move_speed = Vector2();
	
	_distance += _scroll_speed * delta;
	if _distance < 0:
		_distance = 0;
	_scroll_speed = 0;
	
	self.set_identity();
	self.translate_object_local(Vector3(0, 0, _distance));
	_anchor.set_identity();
	_anchor.transform.basis = Basis(Quaternion.from_euler(_rotation));
	
func _input(event):
	if event is InputEventMouseMotion:
		_process_mouse_motion_event(event);
		
func _process_mouse_motion_event(event) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		_move_speed = event.relative;
