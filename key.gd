extends Area2D


func _on_body_entered(body):
	if body.get_name() == "Player":
		$Key.hide()
		$CPUParticles2D.emitting = true
		$AudioStreamPlayer.play()
		Keys.keysCnt += 1
