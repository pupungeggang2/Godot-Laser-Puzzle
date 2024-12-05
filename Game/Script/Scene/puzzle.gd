extends Node2D

var pressed_mouse_pos
var node_player

func _ready():
	node_player = get_node('Player')
	
func _process(delta: float):
	var swipe = swipe_detection()
	var input = handle_input()
	handle_player(swipe, input)

func handle_input():
	if Input.is_action_just_pressed('left'):
		return 'left'
		
	if Input.is_action_just_pressed('right'):
		return 'right'
		
	if Input.is_action_just_pressed('up'):
		return 'up'
		
	if Input.is_action_just_pressed('down'):
		return 'down'
		
	return 'null'
	
func handle_player(swipe, input):
	if swipe == 'left' or input == 'left':
		node_player.position.x -= 64
		
	if swipe == 'right' or input == 'right':
		node_player.position.x += 64
		
	if swipe == 'up' or input == 'up':
		node_player.position.y -= 64
		
	if swipe == 'down' or input == 'down':
		node_player.position.y += 64
		
	if swipe == 'interact' or input == 'interact':
		pass
		
	if swipe == 'undo' or input == 'undo':
		pass
		
	if swipe == 'restart' or input == 'undo':
		pass

func swipe_detection():
	if Input.is_action_just_pressed('press'):
		var mouse = get_viewport().get_mouse_position()
		pressed_mouse_pos = mouse
		
	if Input.is_action_just_released('press'):
		var mouse = get_viewport().get_mouse_position()
		var diff = mouse - pressed_mouse_pos
		
		if diff.length() > 100:
			var x_diff = mouse.x - pressed_mouse_pos.x
			var y_diff = mouse.y - pressed_mouse_pos.y
			
			if abs(x_diff) > abs(y_diff):
				if x_diff > 0:
					return 'right'
				else:
					return 'left'
			else:
				if y_diff > 0:
					return 'down'
				else:
					return 'up'
				 
	return 'null'
