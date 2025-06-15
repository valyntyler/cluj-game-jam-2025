extends Node

var _selected_unit: Unit = null;

func set_selected_unit(unit: Unit)-> void:
	self._selected_unit = unit;

func has_selected_unit() -> bool:
	if self._selected_unit == null:
		return false;
	return true;

func get_selected_unit() -> Unit:
	return self._selected_unit;
