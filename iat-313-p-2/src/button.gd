extends Button

signal highlight_mode_toggled(is_on)

var is_on = false

func _pressed():
	is_on = !is_on
	if is_on:
		text = "Highlight: ON"
	else:
		text = "Highlight: OFF"
	emit_signal("highlight_mode_toggled", is_on)
