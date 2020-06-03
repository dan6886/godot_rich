extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal my_signal(number,name)
# Called when the node enters the scene tree for the first time.
onready var player:Player = self.get_node("Node2D")
onready var game:Game = Game.new()
var Dialog = preload("res://Dialog.tscn")
func _ready():
	game.currentPlayer = player
	game.init()
	game.root = self
	add_child(game)
	pass

func fun1():
	print("1 start")
	fun2()
	print("1 end")
	pass

func fun2():
	print("2 start")
	yield(get_tree().create_timer(5),"timeout")
	print("2 end")
	pass	
# yield 直接返回出去，外部调用直接往下执行，这里就像开启了线程一样，5秒之后继续往下执行1 start
# 1 start
# 2 start
# 1 end
# 2 end

func fun3():
	print("3 start")
	yield(fun4(),"completed")
	print("3 end")
	pass

func fun4():
	print("4 start")
	var resume = yield(self,"my_signal")
	print("4 end",resume)
	pass

# yield 直接返回出去，外部调用直接往下执行，这里就像开启了线程一样,然后yield就再次等待信号出现了才就继续往下
# 3 start
# 4 start
# 4 end
# 3 end

func timepassed():
	print("pass1")
	emit_signal("my_signal",10,"dan")
	pass
func showDialog():
	var d =Dialog.instance()
	add_child(d)
func _input(e):
	if e is InputEventKey and e.pressed and not e.echo: 
	#筛选键盘输入事件 and 键盘按下事件 and 非一直按下状态
		match e.scancode:
			KEY_1:
				print("1")
				game.movePlayer(2)
				print("2")
			KEY_2:
				print("2")
			KEY_3:
				print("3")
			_:
				print("_")
	pass
