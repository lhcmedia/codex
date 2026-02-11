extends Node2D

# Scene Variables
var trunk: Node
var branches: Array
var platform_collision: Dictionary
var win_zone: Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
    # Setting up the trunk
    trunk = $Trunk
    trunk.position = Vector2(0, 0)
    
    # Initializing branches
    branches = []
    for i in range(3):  # Example for 3 branches
        var branch = Node.new()
        branches.append(branch)
        add_child(branch)
        branch.position = Vector2(randf() * 200 - 100, randf() * 200)  # Random position

    # Setting up platform collision
    platform_collision = {
        "top": $Platform.get_rect().position,
        "bottom": $Platform.get_rect().position + Vector2(0, $Platform.get_rect().size.y)
    }

    # Setting up the win zone
    win_zone = $WinZone
    win_zone.connect("body_entered", self, "_on_WinZone_body_entered")

func _on_WinZone_body_entered(body):
    if body.is_in_group("players"):
        print("Player has won!")

