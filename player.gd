extends RigidBody3D

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		#apply_central_force(Vector3.UP * delta * 1000) # test with applying force in up direction, may comment out
		apply_central_force(basis.y * delta * 1000)
		
	if Input.is_action_pressed("ui_left"):
		apply_torque(Vector3(0, 0, 100) * delta)
		
	if Input.is_action_pressed("ui_right"):
		apply_torque(Vector3(0, 0, -100) * delta)


func _on_body_entered(body: Node) -> void:
	print(body.name)
	
	#if body.name == "LandingPad":
		#print("You win!")
		
	if body.is_in_group("Goal"):
		#print("You win!")
		#get_tree().quit()
		call_deferred("complete")
		
	if body.is_in_group("Hazard"):
		#print("You crashed!")
		#get_tree().reload_current_scene()
		call_deferred("crashed")

func complete() -> void:
	print("You win!")
	get_tree().quit()

func crashed() -> void:
	print("You crashed!")
	get_tree().reload_current_scene()
