@tool
extends PanelContainer

@export (String, MULTILINE) var text_bbcode := "": set = set_text_bbcode

@onready var rich_text_label: RichTextLabel = $MarginContainer/RichTextLabel


func set_text_bbcode(value: String) -> void:
	text_bbcode = value
	if not rich_text_label:
		await self.ready
	rich_text_label.text = text_bbcode
