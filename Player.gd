extends Node2D

var moveTween:Tween
var anim:AnimatedSprite
func _ready():
	position   = Vector2(100,100)
	moveTween = $"move"
	anim =$"amin"
	moveTo(Vector2(100,00))
	pass # Replace with function body.


func moveTo(target:Vector2):
	check_look_to(target)
	moveTween.interpolate_property(self,"position",self.position,target,2,Tween.TRANS_LINEAR)
	moveTween.start()
	pass
	
	
func check_look_to(direction:Vector2):
	if(self.position.x < direction.x):
		# 向右
		anim.play("right")
		pass
	elif(self.position.x > direction.x):
		#向左
		anim.play("left")
		pass
	elif(self.position.y > direction.y):
		#向下
		anim.play("up")
		pass
	elif(self.position.y < direction.y):
		#向上
		anim.play("down")
		pass			
	
	
	
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
