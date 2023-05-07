extends Node

onready var current_scene = $Map

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	current_scene.connect("change_scene", self, "handle_scene_change")


# warning-ignore:unused_argument
func handle_scene_change(scene: String, start_pos: Vector2):
	var new_scene = load(scene).instance()
	add_child(new_scene)
	new_scene.connect("change_scene", self, "handle_scene_change")
	current_scene.queue_free()
	current_scene = new_scene
	new_scene.get_child(0).position = start_pos
