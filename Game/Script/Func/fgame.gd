extends Node

func change_scene(current_scene, target_scene_path):
	var scene = load(target_scene_path).instantiate()
	scene.name = 'Puzzle'
	current_scene.queue_free()
	get_tree().root.add_child(scene)
