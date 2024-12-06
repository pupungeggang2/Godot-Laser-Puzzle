extends Node2D

var pressed_mouse_pos
var node_player

func _ready():
    node_player = get_node('Player')
    Fgame.load_world()

func _process(delta: float):
    handle_input()

func handle_input():
    if Var.menu == false:
        if Var.state == '':
            if Input.is_action_just_pressed('left'):
                move_player('left')
            if Input.is_action_just_pressed('right'):
                move_player('right')
            if Input.is_action_just_pressed('up'):
                move_player('up')
            if Input.is_action_just_pressed('down'):
                move_player('down')

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
                            move_player('right')
                        else:
                            move_player('left')
                    else:
                        if y_diff > 0:
                            move_player('down')
                        else:
                            move_player('up')

func move_player(direction):
    pass
