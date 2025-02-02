extends CharacterBody2D


const SPEED = 100.0
@export var direction = Vector2.ZERO

func explode():
	$CPUParticles2D.emitting = true
	$CollisionShape2D.disabled = true
	$Cart.hide()

func _physics_process(delta):
	var collision = move_and_collide(direction.normalized()*SPEED*delta)
	if collision == null:
		return
	if collision.get_collider().get_name() == "Player":
		collision.get_collider().die()
	else:
		explode()
