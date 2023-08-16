extends DiceRoll

@onready var scroll = $VBoxContainer/VBoxContainer/ScrollContainer
var previus

signal dice_result(result)

func _on_d_66_roll_button_up():
	var n = int(D66())
	emit_signal('dice_result', n)
	print('D66: %s' % n)
	if n > 54:
		scroll.scroll_vertical = 413
	else:
		scroll.scroll_vertical = 0
		

