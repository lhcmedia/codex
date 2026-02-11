extends Node

# Flight Mode Scene Logic

var is_flying = false
var flight_speed = 10.0

func _ready():
    pass  # Called when the node enters the scene tree for the first time.

func _process(delta):
    if is_flying:
        move_flight(delta)

func start_flying():
    is_flying = true

func stop_flying():
    is_flying = false

func move_flight(delta):
    # Basic flight logic, you can modify the controls
    var direction = Vector3()
    if Input.is_action_pressed("ui_up"):
        direction.z -= 1
    if Input.is_action_pressed("ui_down"):
        direction.z += 1
    if Input.is_action_pressed("ui_left"):
        direction.x -= 1
    if Input.is_action_pressed("ui_right"):
        direction.x += 1
    direction = direction.normalized() * flight_speed * delta
    translate(direction)