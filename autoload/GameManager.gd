extends Node

# This is the GameManager autoload script

# Add game management functions and variables here.

var score: int = 0
var level: int = 1

func _ready():
    # Initialize game
    print("Game Manager Ready")

func add_score(points: int):
    score += points
    print("Score updated: %d", score)

func next_level():
    level += 1
    print("Advanced to level: %d", level)