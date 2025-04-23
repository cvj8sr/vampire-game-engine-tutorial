extends Control

@onready var count_label: Label = $CountLabel

var count = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func update_count():
	count = count + 1
	count_label.text = str(count) + " / 17"
