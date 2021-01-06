extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
puppet var puppet_trans

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().get_network_unique_id() == 1:
		set_network_master(1)
	else:
		mode = RigidBody.MODE_STATIC
		
func _physics_process(delta):
	if !is_network_master():
		if puppet_trans:
			global_transform = puppet_trans

		
