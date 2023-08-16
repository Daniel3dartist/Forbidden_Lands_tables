extends Node

class_name DiceRoll

# Called when the node enters the scene tree for the first time.
func D66():
	var result : Array
	for i in 2:
		result.append(D6())
	return "%s%s" % result

func D6():
	return randi() % 6 + 1
		
