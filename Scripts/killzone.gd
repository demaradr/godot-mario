extends Area2D


@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D):
	print("You died") # Replace with function body.
	timer.start()
	
	
func _on_timer_timeout():
	get_tree().reload_current_scene() # Replace with function body.
