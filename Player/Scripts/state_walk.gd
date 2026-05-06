class_name State_Walk extends State


@export var move_speed : float = 50

@onready var idle: State = $"../Idle"

## What happens when player enters this state
func Enter() -> void:
	player.UpdateAnimation("idle")
	pass

## What happens when player exits this state
func Exit() -> void:
	pass

## What happens during _process in this state
func Process(_delta : float) -> State:
	if player.dir == Vector2.ZERO:
		return idle
	player.velocity = player.dir * move_speed
	if player.SetDirection():
		player.UpdateAnimation("walk")
	return null

## What happens during _physics_process in this state
func Physics(_delta : float) -> State:
	return null

## What happens with input events in this state
func HandleInput(_event : InputEvent) -> State:
	return null
