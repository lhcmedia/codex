extends Node2D

# Spawning settings
const PIPE_SCALAR = 2.0
const PIPE_SPEED = -200
const GAP_HEIGHT = 150
const MIN_GAP_Y = 50
const MAX_GAP_Y = 400

# Score settings
var score = 0
var score_zone : Area2D

onready var pipe_scene = preload("res://Pipe.tscn")

func _ready():
    score_zone = $ScoreZone

func _process(delta):
    # Call your spawning function every second
    if(OS.get_ticks_msec() % 1000 < delta * 1000):
        spawn_pipe()

func spawn_pipe():
    var gap_y = rand_range(MIN_GAP_Y, MAX_GAP_Y)  
    var pipe = pipe_scene.instance()
    pipe.position.y = gap_y  
    pipe.scale.x = PIPE_SCALAR  
    add_child(pipe)
    pipe.set_speed(PIPE_SPEED)

func _on_ScoreZone_body_entered(body):
    if body.is_in_group("player"):
        score += 1
        print("Score: " + str(score))

# Movement and collision detection logic might be in the Pipe class itself if you have specific implementation. 
