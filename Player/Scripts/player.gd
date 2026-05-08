class_name Player extends CharacterBody2D

var cardinal_dir : Vector2 = Vector2.DOWN
var dir : Vector2 = Vector2.ZERO

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine.Initialize(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	dir.x = Input.get_action_strength("player_right") - Input.get_action_strength("player_left")
	dir.y = Input.get_action_strength("player_down") - Input.get_action_strength("player_up")
	pass

func _physics_process(_delta: float) -> void:
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

func UpdateAnimation(state : String) -> void:
	animation_player.play(state + "-" + AnimDirection())
	pass
	
func AnimDirection() -> String:
	if cardinal_dir == Vector2.DOWN:
		return "down"
	elif cardinal_dir == Vector2.UP:
		return "up"
	else:
		return "side"
