extends Node
class_name BaseEvent

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var next:BaseEvent
var prev:BaseEvent
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func pre_action(args):
	pass

func do_action(args):
	pass

func after_action(args):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
