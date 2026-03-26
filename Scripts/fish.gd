class_name Fish extends Node3D

var radius = 0.0;
var direction: int = 1; # 1 or -1
var speed = 0.5;
var rad = 0.0;
var num = rad * radius;

var fish_mesh;
#var redSnapper2: Node3D;


# parse fish data
var fish_file: FileAccess = FileAccess.open("res://fish_data.json", FileAccess.READ);
var fish_content = fish_file.get_as_text();
var fish_data = JSON.parse_string(fish_content);
var fish_num: int = len(fish_data.fish)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize();
	radius = randf_range(0.5, 2.0);
	direction = 1 if randi_range(0, 1) == 0 else -1;
	rad = randf() * 2 * PI;
	speed = 0.4 + randf() * 0.4;
	var fish_index = randi_range(0, fish_num - 1);
	fish_mesh = load(fish_data.fish[fish_index].scene_path).instantiate();
	fish_mesh.scale = Vector3(0.1, 0.1, 0.1);
	add_child(fish_mesh);
	#fish_mesh = $FishMesh;
	#redSnapper2 = $RedSnapper2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if (radius != 0 ):
		num = direction * rad * radius;
		rad += direction * speed * delta;
		
		while (rad > 2 * PI):
			rad -= 2 * PI
			
		while (rad < 2 * PI):
			rad += 2 * PI
		
		# for some reason this works
		if (direction < 0):
			fish_mesh.rotation.y = -rad - PI;
		else:
			fish_mesh.rotation.y = -rad ;
		
		#fish_mesh.position.x = cos(rad) * radius;
		#fish_mesh.position.z = sin(rad) * radius;
		fish_mesh.position.x = cos(rad) * radius;
		fish_mesh.position.z = sin(rad) * radius;
		#if (direction == 1):
			##if (num > 2 * PI):
			##	num -= 2 * PI
			##fish_mesh.rotation.y = rad * radius;
			#redSnapper2.rotation.y = direction * num / radius;
		#else:
			##if (num > 2 * PI):
			##	num -= 2 * PI
			##fish_mesh.rotation.y = rad * radius;
			#redSnapper2.rotation.y = direction * num / radius;
		
	pass
		
