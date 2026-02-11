extends Node

# Defines the properties for Flight mode
var gravity = Vector2(0, 9.8)
var flapping_force = -300
var obstacles = []
var speed = 200
var timer = 0
var spawn_interval = 2

# Parallax backgrounds
var background
var midground

func _ready():
    # Initialize backgrounds
    background = $Background
    midground = $Midground
    # Start the obstacle spawner
    set_process(true)

func _process(delta):
    # Apply gravity
    if is_on_ground():
        velocity.y += gravity.y * delta
    # Move the backgrounds
    update_parallax()
    # Update obstacle timer
    timer += delta
    if timer > spawn_interval:
        spawn_obstacle()
        timer = 0

func is_on_ground():
    # Implement ground check logic here
    return position.y > get_viewport().size.y

func flap():
    if is_on_ground():
        velocity.y = flapping_force

func spawn_obstacle():
    var obstacle = Obstacle.new()
    obstacle.position.x = get_viewport().size.x
    obstacles.append(obstacle)
    add_child(obstacle)

func update_parallax():
    # Update backgrounds for a parallax effect
    background.position.x -= speed * 0.5
    midground.position.x -= speed * 0.75
    if background.position.x < -background.texture.get_size().x:
        background.position.x = 0
    if midground.position.x < -midground.texture.get_size().x:
        midground.position.x = 0
