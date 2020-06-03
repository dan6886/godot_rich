extends Node
class_name Game
var currentPlayer:Player
# Called when the node enters the scene tree for the first time.
var stop_way_event:BaseEvent
var check_land_event:BaseEvent
var root:Node2D
func _ready():
	pass

func init():
	stop_way_event = StopWayEvent.new()
	check_land_event =CheckLandEvent.new()
	currentPlayer.connect("step_stop",self,"on_step_stop")
	stop_way_event.init()
	stop_way_event.connect("stop_way_event",self,"on_stop_way_event")
	pass

#移动玩家step步
func movePlayer(step):
	currentPlayer.step_move(step)
	pass
#移动完成
func on_step_stop():
	print("step_stop")
	check_all()
	pass	
var events:Array

func check_all():
	#检查路点有无物件
	check_surprise()
	pass
func check_surprise():
	var r1 = stop_way_event.pre_action(self)
	var r2 = stop_way_event.do_action(self)
	var r3 = stop_way_event.after_action(self)
	pass
func showTip(target,method):
	var dialog = root.Dialog.instance()
	root.add_child(dialog)
	var r = yield(dialog,"selected")
	target.call(method,r)
	print(r)
# 这里虽然是stop到路点的信号，但是起到，迭代的作用，不同的信号发送到这里来处理下一个事件
func on_stop_way_event(next):
	print("handle event:")
	var r1 = next.pre_action(self)
	var r2 = next.do_action(self)
	var r3 = next.after_action(self)
