extends "res://scripts/BaseEvent.gd"

class_name CheckLandEvent

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func pre_action(args):
	print("pre_action")
	pass

func do_action(args):
	print("do_action")
	pass

func after_action(args):
	print("after_action")
	pass
