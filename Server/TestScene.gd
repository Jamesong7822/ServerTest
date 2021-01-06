extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lastCubeTime = 0
var currentTime = 0
var cubeCount = 1
export (float) var cubeSpawnRate

const CUBE = preload("res://Cube.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	print ("SCENE START!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if is_network_master():
		currentTime += delta
		if currentTime - lastCubeTime > cubeSpawnRate:
			rpc("spawnCube")
			lastCubeTime = currentTime

remotesync func spawnCube():
	var c = CUBE.instance()
	c.name = str(cubeCount)
	add_child(c)
	c.global_transform.origin = Vector3(0,10,0)
	cubeCount += 1
