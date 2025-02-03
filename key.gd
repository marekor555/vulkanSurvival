extends Area2D

var collected = false

func _on_body_entered(body):
	if body.get_name() == "Player" and not collected:
		$Key.hide()
		$CPUParticles2D.emitting = true
		$AudioStreamPlayer.play()
		Keys.keysCnt += 1
		collected = true
