extends Node2D


func load_demo(scene_path: String) -> void:
	var demo = load(scene_path)
	if demo:
		add_child(demo.instantiate())


func unload() -> void:
	for node in get_children():
		call_deferred("remove_child", node)
		node.queue_free()
