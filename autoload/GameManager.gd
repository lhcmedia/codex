extends Node

var score = 0

func _ready():
    print("GameManager ready!")

func add_score(points):
    score += points
    print("Score: ", score)