extends Node

# This script manages loading and displaying dialogues from a JSON file.

var dialogue_data = {}  # Dictionary to hold the loaded dialogue data.
var current_dialogue_index = 0  # Index for the current dialogue line.

func _ready():
    load_dialogues("res://dialogues.json")  # Load dialogues when the scene is ready.
    display_dialogue()  # Display the first dialogue line.

# Function to load dialogues from a JSON file.
func load_dialogues(file_path: String):
    var file = File.new()
    if file.file_exists(file_path):
        file.open(file_path, File.READ)
        dialogue_data = JSON.parse(file.get_as_text()).result
        file.close()
    else:
        print("Dialogue file not found!")

# Function to display the current dialogue line.
func display_dialogue():
    if current_dialogue_index < dialogue_data.size():
        print(dialogue_data[current_dialogue_index])
        current_dialogue_index += 1  # Move to the next dialogue line.
    else:
        print("End of dialogue.")
