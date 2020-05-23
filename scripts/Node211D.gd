extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const WayPoint = preload("WayPoint.gd")
const LandPoint = preload("LandPoint.gd")
var land_base:TileMap = null
var way_point:TileMap = null
var cell_size :Vector2 = Vector2.ZERO

var wayPointArr:Array = []
func _ready():
	var child = get_child(0)
	var object = child.find_node("way_obj")
	
	land_base = child.find_node("land_base")
	way_point = child.find_node("way_point")
	
	print(way_point.get_meta("map_size"))
	var size :Vector2 = way_point.get_meta("map_size")
	
	for  i in size.x:
		var wayPointRow :Array= []
		for j in size.y:
			wayPointRow.push_back(WayPoint.new())
		wayPointArr.push_back(wayPointRow)
		
	cell_size = land_base.cell_size
	
	
	var childs = object.get_children()
	print(childs)
	# 遍历路点对象图层
	for v in childs:
		var land_row = int (v.get_meta("land_row"))
		var land_col = int (v.get_meta("land_col"))
		print(v.position)
		var p = v.position
		var way_p = WayPoint.new()
		# 设置自己所在的行列
		way_p.col = p.x/cell_size.x
		way_p.row = p.y/cell_size.y
		# 设置土地所在的行列
		way_p.land_row = land_row
		way_p.land_col = land_col
		var land = LandPoint.new()
		land.col = land_col
		land.row = land_row
		way_p.ref = land
		wayPointArr[way_p.row][way_p.col] = way_p
		print(way_p.row)
		
	print(wayPointArr)		
	pass
		#_base.set_cell(int(v.get_meta("land_row")),int(v.get_meta("land_col")),3)	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
