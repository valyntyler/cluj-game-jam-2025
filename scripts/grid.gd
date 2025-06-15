extends Node

@export var GRID_SIZE_X: int = 4
@export var GRID_SIZE_Z: int = 4
@export var TILE_SIZE: float = 2.0
@export var TILE_SCENE: PackedScene


func _ready() -> void:
	generate_grid()


func generate_grid() -> void:
	var offset_x = (GRID_SIZE_X * TILE_SIZE) / 2.0
	var offset_z = (GRID_SIZE_Z * TILE_SIZE) / 2.0

	for x in GRID_SIZE_X:
		for z in GRID_SIZE_Z:
			var tile_instance = TILE_SCENE.instantiate()
			var pos = Vector3(x * TILE_SIZE, 0, z * TILE_SIZE)
			pos.x -= offset_x
			pos.z -= offset_z
			tile_instance.position = pos
			add_child(tile_instance)
