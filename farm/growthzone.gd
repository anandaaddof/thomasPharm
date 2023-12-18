extends StaticBody2D

var plant = Global.plantselected
var plantgrowing = false
var plant_grown = false

func _physics_process(_delta):
	if plantgrowing == false:
		plant = Global.plantselected

func _on_area_2d_area_entered(_area):
	if not plantgrowing:
		if plant == 1:
			plantgrowing = true
			$gingergrowtimer.start()
			$plant.play("gingergrowth")
		if plant == 2:
			plantgrowing = true
			$pomegranategrowtimer.start()
			$plant.play("pomegranategrowth")
	else:
		print("plant has been planted")

func _on_gingergrowtimer_timeout():
	var ginger_plant = $plant
	if ginger_plant.frame == 0:
		ginger_plant.frame = 1
		$gingergrowtimer.start()
	elif ginger_plant.frame == 1:
		ginger_plant.frame = 2
	elif ginger_plant.frame == 2:
		ginger_plant.frame = 3
	elif ginger_plant.frame == 3:
		ginger_plant.frame = 4
		plant_grown = true

func _on_pomegranategrowtimer_timeout():
	var pomegranate_plant = $plant
	if pomegranate_plant.frame == 0:
		pomegranate_plant.frame = 1
		$pomegranategrowtimer.start()
	elif pomegranate_plant.frame == 1:
		pomegranate_plant.frame = 2
	elif pomegranate_plant.frame == 2:
		pomegranate_plant.frame = 3
		plant_grown = true


func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		if plant_grown:
			if plant == 1:
				Global.numofginger += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			if plant == 2:
				Global.numofpomegranate += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			else:
				pass
		print("number of ginger: " + str(Global.numofginger))
		print("number of pomegranate: " + str(Global.numofpomegranate))
