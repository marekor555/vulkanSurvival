extends CharacterBody2D


const SPEED = 300.0
const SPEED_SPRINT=450.0

var jumping = false
var died = false

func die():
	died = true
	$Player.hide()
	Keys.keysCnt = 0
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _physics_process(delta):
	if died:
		return
	var direction = Vector2.ZERO
	direction = Input.get_vector("left", "right", "up", "down")

	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	if Input.is_action_pressed("sprint"):
		velocity = direction * SPEED_SPRINT
	else:
		velocity = direction * SPEED
	move_and_slide()
	
