extends "res://scripts/BaseEvent.gd"
class_name StopWayEvent

var time:Timer
signal stop_way_event(number)
func _ready():
	pass # Replace with function body.
	
func init():
	pass
	
func pre_action(args):
	print("pre_action")
	pass

func do_action(args):
	print("do_action")
	pass

func after_action(game):
	print("after_action")
	game.showTip(self,"on_button_touch")
	# 检测土地是否有物件和人物
	if "神仙":
		pass
	elif "物品":
		pass
	print("timeout")
	next = game.check_land_event
	next.prev = self
	pass

func on_button_touch(is_ok):
	print("button touch:",is_ok)
	emit_signal("stop_way_event",next)
	pass
func on_timeout():
	print("on_timeout")

