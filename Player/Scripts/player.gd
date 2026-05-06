class_name Link extends CharacterBody2D


var move_speed : float = 50


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dir : Vector2 = Vector2.ZERO
	dir.x = Input.get_action_strength("player_right") - Input.get_action_strength("player_left")
	dir.y = Input.get_action_strength("player_down") - Input.get_action_strength("player_up")
	
	velocity = dir * move_speed
	pass

func _physics_process(delta: float) -> void:
	move_and_slide()
	
