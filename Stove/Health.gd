extends ProgressBar


func _physics_process(_delta):
	value = get_node("/root/Game/Stove_Container/Stove").health
