extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var control: Control = $"../../Player/Camera2D/Control"

func _on_body_entered(body: Node2D) -> void:
	animation_player.play("pickup")
	control.update_count()
	audio_stream_player_2d.play()
	body.add_blood()
