extends Control

@export var speed: int = 50
@onready var rich_text_label: RichTextLabel = $RichTextLabel

var scroll: bool = false
var last_value: float

func _ready() -> void:
	scroll = true

func _process(delta: float) -> void:
	if scroll:
		var scroll_bar: VScrollBar = rich_text_label.get_v_scroll_bar()
		scroll_bar.value += delta*speed
		if scroll_bar.value == last_value:
			LevelManager.main_menu()
		last_value = scroll_bar.value
