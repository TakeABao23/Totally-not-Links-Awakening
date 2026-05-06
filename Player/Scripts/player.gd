class_name Link extends CharacterBody2D

var cardinal_dir : Vector2 = Vector2.DOWN
var dir : Vector2 = Vector2.ZERO
var move_speed : float = 50
var state : String = "idle"

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dir.x = Input.get_action_strength("player_right") - Input.get_action_strength("player_left")
	dir.y = Input.get_action_strength("player_down") - Input.get_action_strength("player_up")
	
	velocity = dir * move_speed
	if SetState() == true || SetDirection() == true:
		UpdateAnimation()
	pass

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	
func SetDirection() -> bool:
	var new_dir : Vector2 = cardinal_dir
	if dir == Vector2.ZERO:
		return false
	if dir.y == 0:
		new_dir = Vector2.LEFT if dir.x < 0 else Vector2.RIGHT
	elif dir.x == 0:
		new_dir = Vector2.UP if dir.y < 0 else Vector2.DOWN
	if new_dir == cardinal_dir:
		return false
	cardinal_dir = new_dir
	
	sprite.flip_h = true if cardinal_dir == Vector2.LEFT else false
	return true

func SetState() -> bool:
	var new_state : String = "idle" if dir == Vector2.ZERO else "move"
	if new_state == state:
		return false
	state = new_state
	return true
	
func UpdateAnimation() -> void:
	animation_player.play(state + "-" + AnimDirection())
	pass
	
func AnimDirection() -> String:
	if cardinal_dir == Vector2.DOWN:
		return "down"
	elif cardinal_dir == Vector2.UP:
		return "up"
	else:
		return "side"
