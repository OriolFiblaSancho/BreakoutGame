extends Line2D

@export var MAX_LENGTH: int

var queue: Array

func _process(delta: float) -> void:
	var pos = get_parent().position
	
	queue.push_front(pos)
	
	if queue.size() > MAX_LENGTH:
		queue.pop_back()
	
	clear_points()
	
	for p in queue:
		add_point(p)
	
	
func _getPosition():
	return 
