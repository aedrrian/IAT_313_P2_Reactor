extends Node2D

signal doc_clicked(doc_reference)

var dragging = false
var pickable = false
var isHighlighted = false

var of = Vector2(0, 0)
var snap = 10
			
func _ready():
	pickable = true

func _process(_delta):
	if dragging: 
		var newPos = get_global_mouse_position() - of
		position = Vector2(snapped(newPos.x, snap), snapped(newPos.y, snap))

func _on_button_button_down() -> void:
	
	emit_signal("doc_clicked", self)
	dragging = true
	of = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	dragging = false

func _on_button_mouse_entered() -> void:
	var parent = get_parent()
	if parent.is_highlighter_mode == true:
		modulate = Color(0.7, 1, 1)

func _on_button_mouse_exited() -> void:
	if !isHighlighted:
		modulate = Color(1, 1, 1)
		
func highlight(boolean):
		isHighlighted = boolean
