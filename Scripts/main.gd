extends Node3D

var fish_radius: float = 3.5;
var spawn_radius: float;
var spawner_pos: Vector2;
var spawner: Node3D;

var water_ref: CSGCylinder3D;
var boat_ref: CharacterBody3D;
var fish_label_ref: RichTextLabel;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	water_ref = $LakeWater;
	boat_ref = $Boat;
	fish_label_ref = $UIContainer/FishingLabel;
	spawn_radius = water_ref.radius - 2;
	#spawner_pos = Vector2(spawn_radius * randf_range(0, 1), spawn_radius * randf_range(0, 1))
	spawner = preload("res://Scenes/fish_spawner.tscn").instantiate();
	$".".add_child(spawner);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!$Boat.fishing and can_fish()):
		fish_label_ref.visible = true
	else:
		fish_label_ref.visible = false
		
	if (Input.is_action_just_pressed("fish") and can_fish()):
		$Boat.fishing = !$Boat.fishing

func can_fish():
	return distance(Vector2(boat_ref.position.x, boat_ref.position.z), Vector2(spawner.position.x, spawner.position.y)) <= fish_radius

func distance(v1: Vector2, v2: Vector2) -> float:
	return sqrt(pow(v1.x - v2.x, 2) + pow(v1.y - v2.y, 2))
