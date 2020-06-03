extends Node2D
class_name Player
signal step_finish(postion)
signal step_stop(postion)

var tween:Tween
func _ready():
	print("player ready")
	tween = get_node("Tween")
	tween.connect("tween_completed",self,"on_step_finish")
	pass # Replace with function body.

func step_move(step):
	while step > 0:
		moveTo()
		yield(self,"step_finish")
		print("step over")
		step -= 1
	emit_signal("step_stop")	
	pass

func moveTo():
	print("move start")
	tween.interpolate_property(self,"position",position,position+Vector2(50,0),1,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	pass
	
# 必须和信号一样的参数方法，否则无法回调此函数	
func on_step_finish(a,b):
	print("move end")
	emit_signal("step_finish")
	pass
