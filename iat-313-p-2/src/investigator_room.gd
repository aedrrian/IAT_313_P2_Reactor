extends Node2D

var is_highlighter_mode = false
var selected_docs = []

func _ready():
	var button = $HighlightButton
	button.connect("highlight_mode_toggled", _on_highlight_mode_toggled)
	$Doc1.connect("doc_clicked", _on_doc_clicked)
	$Doc2.connect("doc_clicked", _on_doc_clicked)

func _on_highlight_mode_toggled(is_on):
	is_highlighter_mode = is_on
	print("Highlight mode is now:", is_highlighter_mode)
	
func _on_doc_clicked(doc):
	
	print("hi")
	
	if not is_highlighter_mode:
		return
		
	if doc not in selected_docs:
			selected_docs.append(doc)
			doc.highlight(true)
			
			print("highlighting doc...")
			doc.modulate = Color(1, 1, 0.4)
			
	if selected_docs.size() == 2:
		print("Two docs selected:", selected_docs)
		_finish_selection()
			
func _finish_selection():
	is_highlighter_mode = false
	for doc in selected_docs:
		doc.modulate = Color(1, 1, 1)
		doc.highlight(false)
	selected_docs.clear()
	$HighlightButton.is_on = false
	$HighlightButton.text = "Highlight: OFF"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
