extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var child = get_child(0)
	var object = child.get_child(3)
	var childs = object.get_children()
	print(childs)
	for v in childs:
		print(v.get_meta("land_row"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
