extends Area2D

export var scene_to_load: String

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LoadingZone_body_entered(body):
	match name:
		"Load_Left":
			get_parent().emit_signal("change_scene", "res://Maps/" + scene_to_load + ".tscn", Vector2(100, 300))
		"Load_Right":
			get_parent().emit_signal("change_scene", "res://Maps/" + scene_to_load + ".tscn", Vector2(850, 300))
		"Load_Top":
			get_parent().emit_signal("change_scene", "res://Maps/" + scene_to_load + ".tscn", Vector2(480, 140))
		"Load_Bot":
			get_parent().emit_signal("change_scene", "res://Maps/" + scene_to_load + ".tscn", Vector2(480, 460))
		"Load_Final":
			get_tree().change_scene("Final")
