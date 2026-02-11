extends Node

var score = 0
var game_mode = "normal"

signal mode_changed(new_mode)

func _ready():
    # Initialize singleton state
    score = 0
    game_mode = "normal"

func set_score(new_score):
    score = new_score

func get_score():
    return score

func set_game_mode(new_mode):
    if game_mode != new_mode:
        game_mode = new_mode
        emit_signal("mode_changed", new_mode)

func get_game_mode():
    return game_mode
