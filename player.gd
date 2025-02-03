extends CharacterBody2D


const SPEED = 250.0
const SPEED_SPRINT=450.0
#const SPEED_JUMP=5000.0

var jumping = false
var died = false

var wet = false

func die():
	died = true
	$Player.hide()
	Keys.keysCnt = 0
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func makeWet():
	wet = true
	$Player.hide()
	$PlayerWet.show()
	$WetTimer.start()
	$CPUParticles2D.color = Color("#00f4ff")
	
func _on_wet_timer_timeout():
	wet = false
	$Player.show()
	$PlayerWet.hide()
	$CPUParticles2D.color = Color("#7bff00")
	

func _physics_process(delta):
	if died:
		return
	var direction = Vector2.ZERO
	direction = Input.get_vector("left", "right", "up", "down")

	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	if Input.is_action_pressed("sprint"):
		velocity = direction * SPEED_SPRINT
	#elif Input.is_action_just_pressed("jump"):
		#velocity = direction * SPEED_JUMP
	else:
		velocity = direction * SPEED
	move_and_slide()
	
