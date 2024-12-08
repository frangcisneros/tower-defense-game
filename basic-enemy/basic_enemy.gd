extends PathFollow2D

var speed = 100

func _process(delta: float) -> void:
	progress += delta * speed
	if progress_ratio == 1.0:
		self.queue_free()
