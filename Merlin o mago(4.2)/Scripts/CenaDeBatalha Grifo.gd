extends Node2D
var rng = RandomNumberGenerator.new()
var arr = rng.randomize()
var num1 = rng.randi_range(0,500)
var num2 = rng.randi_range(0,500)
var numr = rng.randi_range(0,3)
var resposta = num1 + num2
var fire = resposta + rng.randi_range(-50,50)
var fu = resposta + rng.randi_range(-50,50)
var temp = resposta + rng.randi_range(-50,50)
var trov = resposta + rng.randi_range(-50,50)
var Pergunta = String(num1)+" + "+String(num2)
var respostaescolhida = 0


func _ready():
	$Merlim.speed=0
	$Merlim/Camera2.current=true
	$Merlim/MerlinAnim.play("Side")
	$Merlim/MerlinAnim.stop()
	$Merlim.powers = true
	$Merlim.inicial=false
	aleatorizarpergunta()
	Pergunta()
	FazerPergunta()
	atualizavalor()

func _process(delta):
	esccolherresposta()

func fire():
	if fire == respostaescolhida and fire == resposta:
		$Merlim.fire()
		$Merlim.powers=false
		$Timer5.start()
		if $Grifo.hearts<2:
			$Timer4.start()
	elif fire == resposta:
		$Grifo.fire()
		$Merlim.powers=false
		$Timer5.start()

func fu():
	if fu == respostaescolhida and fu == resposta:
		$Merlim.Furacao()
		$Merlim.powers=false
		$Timer5.start()
		if $Grifo.hearts<2:
			$Timer4.start()
	elif fu == resposta:
		$Grifo.Furacao()
		$Merlim.powers=false
		$Timer5.start()

func temp():
	if temp == respostaescolhida and temp == resposta:
		$Merlim.Tempestade()
		$Merlim.powers=false
		$Timer5.start()
		if $Grifo.hearts<2:
			$Timer4.start()
	elif temp == resposta:
		$Grifo.Tempestade()
		$Merlim.powers=false
		$Timer5.start()

func trov():
	if trov == respostaescolhida and trov == resposta:
		$Merlim.Trovao()
		$Merlim.powers=false
		$Timer5.start()
		if $Grifo.hearts<2:
			$Timer4.start()
	elif trov == resposta:
		$Grifo.Trovao()
		$Merlim.powers=false
		$Timer5.start()

func esccolherresposta():
	if Input.is_action_just_pressed("Fire"):
		respostaescolhida=fire
		fire()
		fu()
		temp()
		trov()
		$Timer3.start()
	elif Input.is_action_just_pressed("Furacao"):
		respostaescolhida=fu
		fire()
		fu()
		temp()
		trov()
		$Timer3.start()
	elif Input.is_action_just_pressed("Tempestade"):
		respostaescolhida=temp
		fire()
		fu()
		temp()
		trov()
		$Timer3.start()
	elif Input.is_action_just_pressed("Trovao"):
		respostaescolhida=trov
		fire()
		fu()
		temp()
		trov()
		$Timer3.start()

func atualizavalor():
	if numr == 0 and fu != resposta and temp != resposta and trov != resposta:
		fire = resposta
	elif numr == 1 and fire != resposta and temp != resposta and trov != resposta:
		fu = resposta
	elif numr == 2 and fire != resposta and fu != resposta and trov != resposta:
		temp = resposta
	elif numr == 3 and fire != resposta and fu != resposta and temp != resposta:
		trov =resposta
	else:
		fire = resposta + rng.randi_range(-50,50)
		fu = resposta + rng.randi_range(-50,50)
		temp = resposta + rng.randi_range(-50,50)
		trov = resposta + rng.randi_range(-50,50)
		_ready()
	
	$FireballCard/Valor.text = String(fire)
	$FuracaoCard/Valor.text = String(fu)
	$TempestadeCard/Valor.text = String(temp)
	$TrovaoCard/Valor.text = String(trov)

func Pergunta():
	$AnimationPlayer.play("Fade in")

func FazerPergunta():
	$QuestionBox/Question.text = String("Qual o resultado de " + String(Pergunta) + "?")

func aleatorizarpergunta():
	arr = rng.randomize()
	num1 = rng.randi_range(0,500)
	num2 = rng.randi_range(0,500)
	numr = rng.randi_range(0,3)
	resposta = num1 + num2
	fire = resposta + rng.randi_range(-50,50)
	fu = resposta + rng.randi_range(-50,50)
	temp = resposta + rng.randi_range(-50,50)
	trov = resposta + rng.randi_range(-50,50)
	Pergunta = String(num1)+" + "+String(num2)

func _on_Timer5_timeout():
	if$Merlim.lives>0 and $Grifo.hearts>0:
		$Merlim.powers = true
	elif $Grifo.hearts>0:
		get_tree().change_scene_to_file("res://Cenes/level.tscn")
	elif$Merlim.lives>0:
		get_tree().change_scene_to_file("res://Cenes/level.tscn")
		Global.GrifoM=true

func _on_Timer4_timeout():
	get_tree().change_scene_to_file("res://Cenes/level.tscn")


func _on_Timer3_timeout():
	aleatorizarpergunta()
	Pergunta()
	FazerPergunta()
	atualizavalor()
