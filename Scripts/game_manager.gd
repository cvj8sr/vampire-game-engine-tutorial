extends Node

@onready var count_label: Label = $CountLabel

var count = 0

func upate_count():
	count = count + 1
	count_label.text = str(count) + " / 18"
