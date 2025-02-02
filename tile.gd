extends Area2D

@export var molten = false

func _on_timer_timeout():
	molten = true
	$Ground.hide()
	$Lava.show()
	$CPUParticles2D.emitting = true
	$AudioStreamPlayer.play()
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.get_name() == "Player":
			body.die()

func _ready():
	if molten:
		$Ground.hide()
		$Lava.show()
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.get_name() == "Player":
				body.die()

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.get_name() == "Player":
		if !molten:
			$WaitTimer.start()
		else:
			body.die()
