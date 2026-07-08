extends CharacterBody2D
@export var speed = 60
var posicao_inicial = Vector2(340, 208)
var velocity = Vector2()
const fireball = preload("res://Cenes/Fireball.tscn")
const furacao = preload("res://Cenes/Furacao.tscn")
const temp = preload("res://Cenes/TempestadeDeGelo.tscn")
const trov = preload("res://Cenes/Trovao.tscn")
var powers = false
var blink := 0
var lives = 3
var inicial = true
var controle = true
var direita = Serial.connect("direita", Callable(self, "_on_direita"))
var esquerda = Serial.connect("esquerda", Callable(self, "_on_esquerda"))
var Cima = Serial.connect("cima", Callable(self, "_cima"))
var Baixo = Serial.connect("baixo", Callable(self, "_baixo"))

func _physics_process(delta):
	var horizontalmov = Input.get_action_strength("D") - Input.get_action_strength("A");
	velocity.x = horizontalmov * speed
	var verticalmov = Input.get_action_strength("W") - Input.get_action_strength("S");
	velocity.y = verticalmov * speed*-1
	if velocity.x==0 and velocity.y<0:
		$MerlinAnim.play("Up")
		$MerlinAnim.flip_h = true
	if velocity.x==0 and velocity.y>0:
		$MerlinAnim.play("Down")
		$MerlinAnim.flip_h = true
	if velocity.x<0 and velocity.y==0:
		$MerlinAnim.play("Side")
		$MerlinAnim.flip_h = true
	if velocity.x>0 and velocity.y==0:
		$MerlinAnim.play("Side")
		$MerlinAnim.flip_h = false
	elif velocity.y==0 and velocity.x==0 and controle == false:
		$MerlinAnim.stop()
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()

func fire():
	if powers == true:
		var fire = fireball.instantiate()
		if $MerlinAnim.flip_h==true:
			fire.direction = -1
		else:
			fire.direction=1
		get_parent().add_child(fire)
		fire.position.y=position.y
		fire.position.x=position.x+10
	$MerlinAnim.play("Ataque")
	$Timer3.start()

func Furacao():
	if powers == true:
		var fu = furacao.instantiate()
		if $MerlinAnim.flip_h==true:
			fu.direction = -1
		else:
			fu.direction=1
		get_parent().add_child(fu)
		fu.position.y=position.y+80
		fu.position.x=position.x+160
	$MerlinAnim.play("Ataque")
	$Timer3.start()

func Tempestade():
	if powers == true:
		var Temp = temp.instantiate()
		get_parent().add_child(Temp)
		Temp.position.y=position.y+65
		Temp.position.x=position.x+470
	$MerlinAnim.play("Ataque")
	$Timer3.start()

func Trovao():
	if powers == true:
		var Trov = trov.instantiate()
		get_parent().add_child(Trov)
		Trov.position.y=position.y+105
		Trov.position.x=position.x+520
	$MerlinAnim.play("Ataque")
	$Timer3.start()

func _Hurt():
	lives-=1
	set_modulate(Color(10,10,10,0.9))
	blink = 12
	$Timer.start()

func _on_esquerda():
	velocity.x= speed*-1
	$MerlinAnim.flip_h=true
	set_velocity(velocity*1.7)
	set_up_direction(Vector2.UP)
	move_and_slide()
	$MerlinAnim.play("Side")
	if velocity.x == 0 and velocity.y == 0:
		$MerlinAnim.stop()

func _on_direita():
	velocity.x= speed*1
	$MerlinAnim.flip_h=false
	set_velocity(velocity*1.7)
	set_up_direction(Vector2.UP)
	move_and_slide()
	$MerlinAnim.play("Side")
	if velocity.x == 0 and velocity.y == 0:
		$MerlinAnim.stop()

func _cima():
	velocity.y= speed*-1
	if velocity.x == 0:
		set_velocity(velocity*1.7)
		set_up_direction(Vector2.UP)
		move_and_slide()
		$MerlinAnim.flip_h=false
		$MerlinAnim.play("Up")
	if velocity.x == 0 and velocity.y == 0:
		$MerlinAnim.stop()

func _baixo():
	velocity.y= speed*1
	if velocity.x == 0:
		set_velocity(velocity*1.7)
		set_up_direction(Vector2.UP)
		move_and_slide()
		$MerlinAnim.flip_h=false
		$MerlinAnim.play("Down")
	if velocity.x == 0 and velocity.y == 0:
		$MerlinAnim.stop()

func _on_Timer_timeout():
	blink-=1
	if blink==0:
		$Timer.stop()
		set_modulate(Color(1,1,1,1))
	else:
		set_modulate(Color(10,10,10,0.9) if blink%2==0 else Color(1,0.3,0.3,0.7))

func _on_MerlimDamagearea_body_entered(body):
	if body.get_collision_layer()==8:
		_Hurt()

func _on_Timer3_timeout():
	$MerlinAnim.play("Side")
	$MerlinAnim.stop()
