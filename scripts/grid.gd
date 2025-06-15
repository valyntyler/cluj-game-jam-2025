class_name Grid extends Node;

@export var GRID_SIZE_X: int = 4;
@export var GRID_SIZE_Z: int = 4;
@export var GRID_POSITION_Y: float = 1.0;
@export var TILE_SIZE: float = 2.0;
@export var TILE_SCENE: PackedScene;

var _tiles := [];
var selected: Tile = null;

var _tiles := [];
var selected: Tile = null;

func _ready() -> void:
	generate_grid();

func generate_grid() -> void:
	var offset_x = (GRID_SIZE_X * TILE_SIZE) / 2.0;
	var offset_z = (GRID_SIZE_Z * TILE_SIZE) / 2.0;

	for x in GRID_SIZE_X:
		_tiles.append([]);
		for z in GRID_SIZE_Z:
			var tile_instance = TILE_SCENE.instantiate();
			var pos = Vector3(x * TILE_SIZE, GRID_POSITION_Y, z * TILE_SIZE);
			pos.x -= offset_x;
			pos.z -= offset_z;
			tile_instance.position = pos;
			_tiles[x].append(tile_instance);
			add_child(tile_instance);

func get_tile(pos: Vector2i) -> Node3D:
	if pos.x < 0:
		push_error("Tried to get tile at x < 0. (out of bounds)");
		return null;
	if pos.x > GRID_SIZE_X:
		push_error("Tried to get tile at x > GRID_SIZE_X. (out of bounds)");
		return null;
	if pos.y < 0:
		push_error("Tried to get tile at z < 0. (out of bounds)");
		return null;
	if pos.y > GRID_SIZE_Z:
		push_error("Tried to get tile at z > GRID_SIZE_Z. (out of bounds)");
		return null;
	
	return _tiles[pos.x][pos.y];
	
func set_selected(selected: Tile) -> void:
	for x in GRID_SIZE_X:
		for z in GRID_SIZE_Z:
			(_tiles[x][z] as Tile).deselect();
	self.selected = selected;
	
	# debug
	if self.selected != null:
		self.selected.mesh.material_override.albedo_color = Color.GREEN;
