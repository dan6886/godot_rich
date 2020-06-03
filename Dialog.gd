extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal selected(ok)
onready var button_ok:Button = get_node("Panel/HBoxContainer/OK")
onready var button_no:Button = get_node("Panel/HBoxContainer/NO")
func _ready():
	button_ok.connect("button_up",self,"on_button_ok")
	button_no.connect("button_up",self,"on_button_no")
	pass # Replace with function body.

func on_button_ok():
	emit_signal("selected",true)
	queue_free()
	pass

func on_button_no():
	emit_signal("selected",false)
	queue_free()
	pass	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
