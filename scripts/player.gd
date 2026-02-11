extends KinematicBody2D

# Player character controller for a 2D game

# Define player speed
var speed = 200

# Declare variables for movement
var velocity = Vector2()

func _process(delta):
    # Update player movement input
    handle_input()
    # Move the player
    move_and_slide(velocity)

func handle_input():
    velocity = Vector2()
    # Check for input in the horizontal direction
    if Input.is_action_pressed('ui_right'):  # Right
        velocity.x += 1
    if Input.is_action_pressed('ui_left'):   # Left
        velocity.x -= 1
    # Check for input in the vertical direction
    if Input.is_action_pressed('ui_down'):   # Down
        velocity.y += 1
    if Input.is_action_pressed('ui_up'):     # Up
        velocity.y -= 1
    # Normalize the velocity vector
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed