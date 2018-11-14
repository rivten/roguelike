extends Node2D

onready var map = get_parent()
onready var cell_size = map.cell_size

func _ready():
	set_process_input(true)
	set_position(get_position()) # NOTE(hugo): has the effect of snapping the player to the tile

func get_cell():
	return get_position() / cell_size

func set_cell(cell):
	return set_position(cell * cell_size)

func _input(event):
	var offset = Vector2(0, 0)
	if(event.is_action_pressed("ui_up")):
		offset = Vector2(0, -1)
	if(event.is_action_pressed("ui_down")):
		offset = Vector2(0, 1)
	if(event.is_action_pressed("ui_left")):
		offset = Vector2(-1, 0)
	if(event.is_action_pressed("ui_right")):
		offset = Vector2(1, 0)
	
	var test_cell = get_cell() + offset
	if(map.is_floor(test_cell)):
		set_cell(test_cell)
	#else:
		#print(test_cell)
