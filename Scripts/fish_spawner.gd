class_name FishSpawner extends Node3D

var fishes = [];
var fish_num: int = 0;
var fish_dist: float = 0.2;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish_num = randi_range(6,8);
	var fish_res = preload("res://Scenes/fish.tscn")
	for n in range(fish_num):
		var fish = fish_res.instantiate()
		fish.position.y -= randf() * 1;
		fishes.append(fish);
		$FishContainer.add_child(fish);
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
