extends Node2D

var node_select_frame

const UI = {
    'button_start': [160, 200, 320, 320],
    'button_delete': [800, 200, 320, 320]
}

func _ready():
    node_select_frame = get_node('UI/SelectFrame')
    Fsave.load_data()
    
func _process(delta):
    handle_input()
    
func handle_input():
    if Var.menu == false:
        if Var.state == '':
            if Var.cursor_title == -1:
                if Input.is_anything_pressed():
                    Var.cursor_title = 0
            else:
                if Input.is_action_just_pressed('left'):
                    Var.cursor_title = (Var.cursor_title + 1) % 2
                elif Input.is_action_just_pressed('right'):
                    Var.cursor_title = (Var.cursor_title + 1) % 2
               
            if Input.is_action_just_pressed('interact'):
                if Var.cursor_title == 0:
                    Fgame.change_scene(self, 'res://Scene/puzzle.tscn')

                elif Var.cursor_title == 1:
                    pass
                  
            if Input.is_action_just_released('press'):
                var mouse = get_viewport().get_mouse_position()
                if Fphysics.point_inside_rect_array(mouse.x, mouse.y, UI['button_start']):
                    Fgame.change_scene(self, 'res://Scene/puzzle.tscn')

                elif Fphysics.point_inside_rect_array(mouse.x, mouse.y, UI['button_delete']):
                    pass
                  
            if Var.cursor_title == 0:
                node_select_frame.show()
                node_select_frame.position.x = 160
                node_select_frame.position.y = 200
                
            elif Var.cursor_title == 1:
                node_select_frame.show()
                node_select_frame.position.x = 800
                node_select_frame.position.y = 200
