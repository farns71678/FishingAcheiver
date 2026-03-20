class_name Fish extends Node3D

var radius = 0.0;
var direction: int = 1; # 1 or -1
var speed = 0.5;
var rad = 0.0;
var num = rad * radius;

#var fish_mesh: Node3D;
var redSnapper2: Node3D;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize();
	radius = randf_range(0.5, 2.0);
	direction = 1 if randi_range(0, 1) == 0 else -1;
	rad = randf() * 2 * PI;
	speed = 0.4 + randf() * 0.4
	#fish_mesh = $FishMesh;
	redSnapper2 = $RedSnapper2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if (radius != 0):
		num = direction * rad * radius;
		rad += direction * speed * delta;
		
		while (rad > 2 * PI):
			rad -= 2 * PI
			
		while (rad < 2 * PI):
			rad += 2 * PI
		
		# for some reason this works
		if (direction < 0):
			redSnapper2.rotation.y = -rad - PI;
		else:
			redSnapper2.rotation.y = -rad ;
		
		#fish_mesh.position.x = cos(rad) * radius;
		#fish_mesh.position.z = sin(rad) * radius;
		redSnapper2.position.x = cos(rad) * radius;
		redSnapper2.position.z = sin(rad) * radius;
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
		
