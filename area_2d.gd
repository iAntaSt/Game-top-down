extends Area2D

@export var speed = 400
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size 
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) :
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x > 0:
		$AnimatedSprite2D.animation = "walk_side"
		$AnimatedSprite2D.flip_v = false
	elif velocity.x < 0:
		$AnimatedSprite2D.animation = "walk_side"
		$AnimatedSprite2D.flip_v = true
	elif velocity.y < 0 and velocity.x == 0:
		$AnimatedSprite2D.animation = "walk_up"
	elif velocity.y > 0 and velocity.x == 0 :
		$AnimatedSprite2D.animation = "walk_down"
	
