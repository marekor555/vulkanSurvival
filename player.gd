extends CharacterBody2D


const SPEED = 300.0

var jumping = false
var died = false

func die():
	died = true
	$Player.hide()
	$PlayerDead.show()
	$Container.show()
	get_tree().change_scene_to_file("res://menu.tscn")

func _physics_process(delta):
	if died:
		return
	var direction = Vector2.ZERO
	direction = Input.get_vector("left", "right", "up", "down")
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	velocity = direction * SPEED
	move_and_slide()
	
