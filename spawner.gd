extends Marker2D

@export var timeout = 4
@export var to_spawn: PackedScene
@export var direction: Vector2

func _ready():
	$Timer.wait_time = timeout


func _on_timer_timeout():
	var obj = to_spawn.instantiate()
	obj.position = position
	obj.rotation = rotation
	if direction != null:
		obj.direction = direction
	get_tree().get_root().add_child(obj)
