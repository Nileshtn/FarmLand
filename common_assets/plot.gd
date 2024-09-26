@tool
extends Node3D

# Expose 'length' and 'height' to the inspector
@export var length: float:
	get:
		return _length
	set(value):
		_length = value
		update_mesh_size()  # Update the mesh size in the editor

@export var breadth: float:
	get:
		return _breadth
	set(value):
		_breadth = value
		update_mesh_size()  # Update the mesh size in the editor
		
@export var plot_name: String:
	get:
		return _name
	set(value):
		_name = value
		update_mesh_size()

# Private variables
var _length: float
var _breadth: float
var _name: String

# Access the mesh
@onready var plot_mesh = $plot_mesh
@onready var plot_name_lable = $name

# Function to update the mesh size
func update_mesh_size():
	if plot_mesh:
		plot_mesh.size.x = _length
		plot_mesh.size.z = _breadth
		plot_mesh.size.y = 0.025
	plot_name_lable.text = _name
		
# Called when the node is ready
func _ready():
	update_mesh_size()
