extends Node2D

@onready var robot: CharacterBody2D = $Robot
var robotSpeed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var moveLeft = false
var moveRight = false
var moveUp = false
var moveDown = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moveLeft:
		robot.velocity = Vector2.LEFT * robotSpeed
	elif moveRight:
		robot.velocity = Vector2.RIGHT * robotSpeed
	elif moveUp:
		robot.velocity = Vector2.UP * robotSpeed
	elif moveDown:
		robot.velocity = Vector2.DOWN * robotSpeed
	else:
		robot.velocity = Vector2.ZERO
	robot.move_and_slide()


#LEFT CONTROLS ----------------------
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		moveLeft = true


func _on_area_2d_body_exited(body: Node2D) -> void:
		if body.name == "Player":
			moveLeft = false

#RIGHT CONTROLS ----------------------------
func _on_right_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		moveRight = true

func _on_right_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		moveRight = false
		
#UP CONTROLS-----------------------
func _on_up_arrow_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		moveUp = true

func _on_up_arrow_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		moveUp = false

#DOWN CONTROLS---------------------
func _on_down_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		moveDown = true

func _on_down_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		moveDown = false
