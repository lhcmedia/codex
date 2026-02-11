extends CharacterBody2D

const STATE_FLIGHT = "FLIGHT"
const STATE_CLIMB = "CLIMB"

var state = STATE_FLIGHT

var gravity = 1000.0
var flap_strength = -600.0
var velocity = Vector2.ZERO

# Animation Variables
var animation_player: AnimationPlayer
var is_flapping = false

func _ready():
    animation_player = $AnimationPlayer

func _physics_process(delta):
    match state:
        STATE_FLIGHT:
            handle_flight(delta)
        STATE_CLIMB:
            handle_climb(delta)

    velocity.y += gravity * delta
    move_and_slide(velocity)

func handle_flight(delta):
    if Input.is_action_just_pressed("flap") and !is_flapping:
        velocity.y = flap_strength
        is_flapping = true
        animation_player.play("flap")
    elif is_flapping:
        is_flapping = false
        animation_player.stop()  # Stop flapping animation, or switch to a gliding animation if needed

func handle_climb(delta):
    if Input.is_action_pressed("up"):
        velocity.y = -200  # Climbing speed
        animation_player.play("climb")
    else:
        state = STATE_FLIGHT  # Switch back to flight state if not climbing

func _on_AnimationPlayer_animation_finished(anim_name):
    if anim_name == "climb":
        state = STATE_FLIGHT

func _on_area_entered(area):
    if area.name == "ClimbingArea":
        state = STATE_CLIMB
    
func _on_area_exited(area):
    if area.name == "ClimbingArea":
        state = STATE_FLIGHT