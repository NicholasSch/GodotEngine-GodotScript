extends CharacterBody2D
var hearts = 3
const fireball = preload("res://Cenes/Fireball.tscn")
const furacao = preload("res://Cenes/Furacao.tscn")
const temp = preload("res://Cenes/TempestadeDeGelo.tscn")
const trov = preload("res://Cenes/Trovao.tscn")
var blink:=0

func _ready():
	$GoblinAnim.play("Goblin anim")
	if Global.GoblinM==true:
		queue_free()

func fire():
	var f2 = fireball.instantiate()
	f2.direction=-1
	get_parent().add_child(f2)
	f2.position.y=position.y-105
	f2.position.x=position.x-250
	$GoblinAnim.play("Ataque")
	$Timer3.start()

func Furacao():
	var fu = furacao.instantiate()
	if $GoblinAnim.flip_h==true:
		fu.direction = -1
	else:
		fu.direction=1
	get_parent().add_child(fu)
	fu.position.y=position.y-22
	fu.position.x=position.x-80
	$GoblinAnim.play("Ataque")
	$Timer3.start()

func Tempestade():
	var Temp = temp.instantiate()
	get_parent().add_child(Temp)
	Temp.position.y=position.y-30
	Temp.position.x=position.x-420
	$GoblinAnim.play("Ataque")
	$Timer3.start()

func Trovao():
	var Trov = trov.instantiate()
	get_parent().add_child(Trov)
	Trov.position.y=position.y
	Trov.position.x=position.x-380
	$GoblinAnim.play("Ataque")
	$Timer3.start()


func _Hurt():
	set_modulate(Color(10,10,10,0.9))
	blink = 12
	$Timer.start()
	$Timer2.start()

func _on_Timer_timeout():
	blink-=1
	if blink==0:
		$Timer.stop()
		set_modulate(Color(1,1,1,1))
	else:
		set_modulate(Color(10,10,10,0.9) if blink%2==0 else Color(1,0.3,0.3,0.7))
	
func _on_Hitarea_body_entered(body):
	if body.get_collision_layer()==8:
		hearts-=1
		if hearts<1:
			Global.level+=1
			$Timer2.start()
		_Hurt()

func _on_Timer2_timeout():
	$GoblinAnim.play("Goblin anim")


func _on_Timer3_timeout():
	$GoblinAnim.play("Goblin anim")

