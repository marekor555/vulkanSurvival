extends StaticBody2D


@export var keysNeeded = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = str(keysNeeded - Keys.keysCnt)
	if Keys.keysCnt == keysNeeded:
		$CollisionPolygon2D.disabled = true
		$Polygon2D.hide()
		$Label.hide()
		
