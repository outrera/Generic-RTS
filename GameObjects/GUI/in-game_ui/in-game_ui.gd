extends Control

onready var chat = $chat_panel
onready var menu = $bg
onready var chat_message = $chat_messages



func _ready():
	set_process_input(true)

func _input(event):
	
	if event.is_action_pressed("open_chat"):
		if chat.is_visible_in_tree():
			chat_message.add_text(chat.get_node("box/chat_container/box/chat_lines").text + "\n")
			chat.get_node("box/chat_container/box/chat_lines").text = ""
			chat.hide()
		else:
			chat.show()


func _on_menu_pressed():
	menu.show()
	get_tree().paused = true
	pass # replace with function body


func _on_back_to_game_button_pressed():
	menu.hide()
	get_tree().paused = false
	pass # replace with function body


func _on_send_button_pressed():
	chat_message.add_text(chat.get_node("box/chat_container/box/chat_lines").text + "\n")
	chat.get_node("box/chat_container/box/chat_lines").text = ""
	chat.hide()
	pass # replace with function body
