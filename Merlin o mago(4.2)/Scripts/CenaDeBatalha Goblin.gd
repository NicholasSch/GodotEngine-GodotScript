extends Node2D
var rng = RandomNumberGenerator.new()
var arr = rng.randomize()
var num1 = rng.randi_range(0,500)
var num2 = rng.randi_range(-200,500)
var numr = rng.randi_range(0,3)
var resposta = -1
var fire = -1
var fu = resposta + rng.randi_range(-50,50)
var temp = resposta + rng.randi_range(-50,50)
var trov = resposta + rng.randi_range(-50,50)
var Pergunta = String(num1)+" + "+String(num2)
var respostaescolhida = 0
var boladefogo = Serial.connect("boladefogo", Callable(self, "_boladefogo"))
var furacao = Serial.connect("furacao", Callable(self, "_furacao"))
var tempestade = Serial.connect("tempestade", Callable(self, "_tempestade"))
var trovoada = Serial.connect("trovoada", Callable(self, "_trovoada"))


func _ready():
	$MusicaBatalha.play()
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
		$Acertou.play()
		fire = -1
		resposta=-1
	elif fire == resposta:
		$Goblin.fire()
		$Merlim.powers=false
		$Timer5.start()
		$Errou.play()
		fire = -1
		resposta=-1

func fu():
	if fu == respostaescolhida and fu == resposta:
		$Merlim.Furacao()
		$Merlim.powers=false
		$Timer5.start()
		$Acertou.play()
		fu = -1
		resposta=-1
	elif fu == resposta:
		$Goblin.Furacao()
		$Merlim.powers=false
		$Timer5.start()
		$Errou.play()
		fu = -1
		resposta=-1

func temp():
	if temp == respostaescolhida and temp == resposta:
		$Merlim.Tempestade()
		$Merlim.powers=false
		$Timer5.start()
		$Acertou.play()
		temp = -1
		resposta=-1
	elif temp == resposta:
		$Goblin.Tempestade()
		$Merlim.powers=false
		$Timer5.start()
		$Errou.play()
		temp = -1
		resposta=-1

func trov():
	if trov == respostaescolhida and trov == resposta:
		$Merlim.Trovao()
		$Merlim.powers=false
		$Timer5.start()
		$Acertou.play()
		trov = -1
		resposta=-1
	elif trov == resposta:
		$Goblin.Trovao()
		$Merlim.powers=false
		$Timer5.start()
		$Errou.play()
		trov = -1
		resposta=-1

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

func _boladefogo():
		respostaescolhida=fire
		fire()
		fu()
		temp()
		trov()
		$Timer3.start()
func _furacao():
		respostaescolhida=fu
		fire()
		fu()
		temp()
		trov()
		$Timer3.start()
func _tempestade():
		respostaescolhida=temp
		fire()
		fu()
		temp()
		trov()
		$Timer3.start()
func _trovoada():
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
	$QuestionBox/AnimationPlayer.play("Fade in")

func FazerPergunta():
	$QuestionBox/Question.text = String("Qual o resultado de " + String(Pergunta) + "?")

func aleatorizarpergunta():
	while resposta<0:
		arr = rng.randomize()
		num1 = rng.randi_range(0,500)
		num2 = rng.randi_range(-200,500)
		numr = rng.randi_range(0,3)
		resposta = num1 + num2
	while fire<0 or fu<0 or temp<0 or trov<0 or fire==fu or fire == temp or fire == trov or fu == temp or fu == trov or temp == trov:
		fire = resposta + rng.randi_range(-50,50)
		fu = resposta + rng.randi_range(-50,50)
		temp = resposta + rng.randi_range(-50,50)
		trov = resposta + rng.randi_range(-50,50)
	if num2>=0:
		Pergunta = String(num1)+" + "+String(num2)
	else:
		Pergunta = String(num1)+" - "+String(num2*-1)

func _on_Timer5_timeout():
	if$Merlim.lives>0 and $Goblin.hearts>0:
		$Merlim.powers = true
	elif $Goblin.hearts>0:
		await get_tree().create_timer(0.2).timeout
		Transicao.fade_in("res://Cenes/level.tscn")
	elif$Merlim.lives>0:
		Global.GoblinM=true
		await get_tree().create_timer(0.2).timeout
		Transicao.fade_in("res://Cenes/level.tscn")

func _on_Timer3_timeout():
	aleatorizarpergunta()
	Pergunta()
	FazerPergunta()
	atualizavalor()
