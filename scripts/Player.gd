extends CharacterBody2D
const SPEED = 200.0
@onready var animation= $AnimatedSprite2D;

func _ready():
	animation.play("main");
	
func _physics_process(delta):
	
	var dx = Input.get_axis("ui_left", "ui_right")
	
	if dx:
		velocity.x = dx * SPEED
		if(dx>0):
			animation.play("left")
		if(dx<0):
			animation.play("right")
	else:
	
			velocity.x = move_toward(velocity.x, 0, SPEED)
	var dy = Input.get_axis("ui_up","ui_down")
	if dy:
	
		velocity.y=dy*SPEED
		if(dy<0):
			animation.play("back")
		if(dy>0):
			animation.play("main")
	else:
	
			velocity.y=move_toward(velocity.y, 0, SPEED)

	if(velocity==Vector2(0,0)):
		animation.set_frame_and_progress(1,0)
		animation.stop();
	
	if(abs(velocity.x)!=abs(velocity.y)):
		move_and_slide()
	
