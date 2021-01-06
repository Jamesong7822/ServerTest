extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
puppet var puppet_trans

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().get_network_unique_id() == 1:
		set_network_master(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _integrate_forces(state):
	if is_network_master():
		puppet_trans = global_transform
		rset_unreliable("puppet_trans", puppet_trans)
		
