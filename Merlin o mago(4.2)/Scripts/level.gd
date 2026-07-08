extends Node2D
var GoblinQ = Dialogic.start("GoblinQ")
var EsqueletoQ = Dialogic.start("EsqueletoQ")
var EsqueletoQ2 = Dialogic.start("EsqueletoQ2")
var SnakeQ = Dialogic.start("SnakeQ")
var SnakeQ2 = Dialogic.start("SnakeQ2")
var DragonQ = Dialogic.start("DragaoQ")
var DragonQ2 = Dialogic.start("DragaoQ2")
var MorcegosaQ = Dialogic.start("MorcegosaQ")
var MorcegosaQ2 = Dialogic.start("MorcegosaQ2")
var MorganaQ1 = Dialogic.start("MorganaQ1")
var MorganaQ2 = Dialogic.start("MorganaQ2")
var NPCQ1 = Dialogic.start("NPCQ1")
var NPCQ2 = Dialogic.start("NPCQ2")
var NPCQ3 = Dialogic.start("NPCQ3")
var NPCQ4 = Dialogic.start("NPCQ4")
var NPCQ5 = Dialogic.start("NPCQ5")
var NPCQ6 = Dialogic.start("NPCQ6")
var NPCQ7 = Dialogic.start("NPCQ7")
var controle = false
var GoblinD = false
var EsqueletoD = false
var SnakeD = false
var MorcegosaD = false
var DragaoD = false
var MorganaD = false
var NPCD = false
var boladefogo = Serial.connect("boladefogo", Callable(self, "_boladefogo"))
var furacao = Serial.connect("furacao", Callable(self, "_furacao"))
var tempestade = Serial.connect("tempestade", Callable(self, "_furacao"))
var trovoada = Serial.connect("trovoada", Callable(self, "_furacao"))

func _ready():
	get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN if (true) else Window.MODE_WINDOWED
	if Global.level<7:
		$MusicaTema.play()
	if Global.level==7:
		$MusicaVitoria.play()
	$Merlim.position=Global.PosI
	$Merlim.speed=60
	$Merlim/Camera1.current=true
	$Merlim.powers = false
	$Merlim/MerlinAnim.play("Down")
	$Merlim/MerlinAnim.stop()
	$Snake/SnakeAnim.flip_h=false

func _process(delta):
	 if Input.is_action_just_pressed("ESC"):
	  get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN if (!((get_window().mode == Window.MODE_EXCLUSIVE_FULLSCREEN) or (get_window().mode == Window.MODE_FULLSCREEN))) else Window.MODE_WINDOWED
		
func dialogic_signal(argument):
	if argument == "Goblin":
		Global.PosI=$Merlim.position
		Transicao.fade_in("res://Cenes/CenaDeBatalha Goblin.tscn")
	elif argument=="Esqueleto":
		Global.PosI=$Merlim.position
		Transicao.fade_in("res://Cenes/CenaDeBatalha Esqueleto.tscn")
	elif argument=="Snake":
		Global.PosI=$Merlim.position
		Transicao.fade_in("res://Cenes/CenaDeBatalha Snake.tscn")
	elif argument=="Dragao":
		Global.PosI=$Merlim.position
		Transicao.fade_in("res://Cenes/CenaDeBatalha Dragao.tscn")
	elif argument=="Morcegosa":
		Global.PosI=$Merlim.position
		Transicao.fade_in("res://Cenes/CenaDeBatalha Morcegosa.tscn")
	elif argument == "Morgana":
		Global.PosI=$Merlim.position
		Transicao.fade_in("res://Cenes/CenaDeBatalha Morgana.tscn")
	elif argument == "Não":
		$Merlim.speed=60
		get_parent().remove_child(GoblinQ)
		get_parent().remove_child(EsqueletoQ)
		get_parent().remove_child(EsqueletoQ2)
		get_parent().remove_child(SnakeQ)
		get_parent().remove_child(SnakeQ2)
		get_parent().remove_child(DragonQ)
		get_parent().remove_child(DragonQ2)
		get_parent().remove_child(MorcegosaQ)
		get_parent().remove_child(MorcegosaQ2)
		get_parent().remove_child(MorganaQ1)
		get_parent().remove_child(MorganaQ2)
		get_parent().remove_child(NPCQ1)
		get_parent().remove_child(NPCQ2)
		get_parent().remove_child(NPCQ3)
		get_parent().remove_child(NPCQ4)
		get_parent().remove_child(NPCQ5)
		get_parent().remove_child(NPCQ6)
		get_parent().remove_child(NPCQ7)
		GoblinQ = Dialogic.start("GoblinQ")
		EsqueletoQ = Dialogic.start("EsqueletoQ")
		EsqueletoQ2 = Dialogic.start("EsqueletoQ2")
		SnakeQ = Dialogic.start("SnakeQ")
		SnakeQ2 = Dialogic.start("SnakeQ2")
		DragonQ = Dialogic.start("DragaoQ")
		DragonQ2 = Dialogic.start("DragaoQ2")
		MorcegosaQ = Dialogic.start("MorcegosaQ")
		MorcegosaQ2 = Dialogic.start("MorcegosaQ2")
		MorganaQ1 = Dialogic.start("MorganaQ1")
		MorganaQ2 = Dialogic.start("MorganaQ2")
		NPCQ1 = Dialogic.start("NPCQ1")
		NPCQ2 = Dialogic.start("NPCQ2")
		NPCQ3 = Dialogic.start("NPCQ3")
		NPCQ4 = Dialogic.start("NPCQ4")
		NPCQ5 = Dialogic.start("NPCQ5")
		NPCQ6 = Dialogic.start("NPCQ6")
		NPCQ7 = Dialogic.start("NPCQ7")

func _boladefogo():
	if GoblinD == true:
		get_parent().remove_child(GoblinQ)
		Transicao.fade_in("res://Cenes/CenaDeBatalha Goblin.tscn")
	elif EsqueletoD == true:
		get_parent().remove_child(EsqueletoQ)
		Transicao.fade_in("res://Cenes/CenaDeBatalha Esqueleto.tscn")
	elif SnakeD == true:
		get_parent().remove_child(SnakeQ)
		Transicao.fade_in("res://Cenes/CenaDeBatalha Snake.tscn")
	elif MorcegosaD == true:
		get_parent().remove_child(MorcegosaQ)
		Transicao.fade_in("res://Cenes/CenaDeBatalha Morcegosa.tscn")
	elif DragaoD== true:
		get_parent().remove_child(DragonQ)
		Transicao.fade_in("res://Cenes/CenaDeBatalha Dragao.tscn")
	elif MorganaD==true:
		get_parent().remove_child(MorganaQ1)
		Transicao.fade_in("res://Cenes/CenaDeBatalha Morgana.tscn")
	elif NPCD==true:
		_furacao()

func _furacao():
	GoblinD = false
	EsqueletoD = false
	SnakeD = false
	MorcegosaD = false
	DragaoD = false
	MorganaD = false
	NPCD = false
	$Merlim.speed=60
	get_parent().remove_child(GoblinQ)
	get_parent().remove_child(EsqueletoQ)
	get_parent().remove_child(EsqueletoQ2)
	get_parent().remove_child(SnakeQ)
	get_parent().remove_child(SnakeQ2)
	get_parent().remove_child(DragonQ)
	get_parent().remove_child(DragonQ2)
	get_parent().remove_child(MorcegosaQ)
	get_parent().remove_child(MorcegosaQ2)
	get_parent().remove_child(MorganaQ1)
	get_parent().remove_child(MorganaQ2)
	get_parent().remove_child(NPCQ1)
	get_parent().remove_child(NPCQ2)
	get_parent().remove_child(NPCQ3)
	get_parent().remove_child(NPCQ4)
	get_parent().remove_child(NPCQ5)
	get_parent().remove_child(NPCQ6)
	get_parent().remove_child(NPCQ7)
	GoblinQ = Dialogic.start("GoblinQ")
	EsqueletoQ = Dialogic.start("EsqueletoQ")
	EsqueletoQ2 = Dialogic.start("EsqueletoQ2")
	SnakeQ = Dialogic.start("SnakeQ")
	SnakeQ2 = Dialogic.start("SnakeQ2")
	DragonQ = Dialogic.start("DragaoQ")
	DragonQ2 = Dialogic.start("DragaoQ2")
	MorcegosaQ = Dialogic.start("MorcegosaQ")
	MorcegosaQ2 = Dialogic.start("MorcegosaQ2")
	MorganaQ1 = Dialogic.start("MorganaQ1")
	MorganaQ2 = Dialogic.start("MorganaQ2")
	NPCQ1 = Dialogic.start("NPCQ1")
	NPCQ2 = Dialogic.start("NPCQ2")
	NPCQ3 = Dialogic.start("NPCQ3")
	NPCQ4 = Dialogic.start("NPCQ4")
	NPCQ5 = Dialogic.start("NPCQ5")
	NPCQ6 = Dialogic.start("NPCQ6")
	NPCQ7 = Dialogic.start("NPCQ7")

func _on_AreadeInteraaoGoblin_body_entered(body):
	if body.name == "Merlim" and Global.GoblinM==false and Global.level == 1:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		GoblinD = true
		await get_tree().create_timer(1).timeout
		get_parent().add_child(GoblinQ)
		GoblinQ.connect("dialogic_signal", Callable(self, "dialogic_signal"))

func _on_AreadeInteraaoEsqueleto_body_entered(body):
	if body.name == "Merlim" and Global.EsqueletoM==false and Global.level == 3:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		EsqueletoD=true
		await get_tree().create_timer(1).timeout
		get_parent().add_child(EsqueletoQ)
		EsqueletoQ.connect("dialogic_signal", Callable(self, "dialogic_signal"))
	elif body.name == "Merlim" and Global.EsqueletoM==false:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		await get_tree().create_timer(1).timeout
		get_parent().add_child(EsqueletoQ2)
		EsqueletoQ2.connect("dialogic_signal", Callable(self, "dialogic_signal"))

func _on_AreadeInteraaoSnake_body_entered(body):
	if body.name == "Merlim" and Global.SnakeM==false and Global.level == 2:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		SnakeD=true
		await get_tree().create_timer(1).timeout
		get_parent().add_child(SnakeQ)
		SnakeQ.connect("dialogic_signal", Callable(self, "dialogic_signal"))
	elif body.name == "Merlim" and Global.SnakeM==false:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		await get_tree().create_timer(1).timeout
		get_parent().add_child(SnakeQ2)
		SnakeQ2.connect("dialogic_signal", Callable(self, "dialogic_signal"))

func _on_AreadeInteraaoMorcegosa_body_entered(body):
	if body.name == "Merlim" and Global.DragaoM==false and Global.level == 5:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		DragaoD=true
		await get_tree().create_timer(1).timeout
		get_parent().add_child(DragonQ)
		DragonQ.connect("dialogic_signal", Callable(self, "dialogic_signal"))
	elif body.name == "Merlim" and Global.DragaoM==false:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		await get_tree().create_timer(1).timeout
		get_parent().add_child(DragonQ2)
		DragonQ2.connect("dialogic_signal", Callable(self, "dialogic_signal"))

func _on_AreadeInteraaoDragao_body_entered(body):
	if body.name == "Merlim" and Global.MorcegosaM==false and Global.level == 4:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		MorcegosaD=true
		await get_tree().create_timer(1).timeout
		get_parent().add_child(MorcegosaQ)
		MorcegosaQ.connect("dialogic_signal", Callable(self, "dialogic_signal"))
	elif body.name == "Merlim" and Global.MorcegosaM==false:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		await get_tree().create_timer(1).timeout
		get_parent().add_child(MorcegosaQ2)
		MorcegosaQ2.connect("dialogic_signal", Callable(self, "dialogic_signal"))


func _on_AreadeInteraaoMorgana_body_entered(body):
	if body.name == "Merlim" and Global.MorganaM==false and Global.level == 6:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		MorganaD=true
		await get_tree().create_timer(1).timeout
		get_parent().add_child(MorganaQ1)
		MorganaQ1.connect("dialogic_signal", Callable(self, "dialogic_signal"))
	elif body.name == "Merlim" and Global.MorganaM == false:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		await get_tree().create_timer(1).timeout
		get_parent().add_child(MorganaQ2)
		MorganaQ2.connect("dialogic_signal", Callable(self, "dialogic_signal"))


func _on_AreadeInteraaoNPC_body_entered(body):
	if body.name == "Merlim" and Global.level==1:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		NPCD=true
		await get_tree().create_timer(1).timeout
		get_parent().add_child(NPCQ1)
		NPCQ1.connect("dialogic_signal", Callable(self, "dialogic_signal"))
	elif body.name == "Merlim" and Global.level==2:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		NPCD=true
		await get_tree().create_timer(1).timeout
		get_parent().add_child(NPCQ2)
		NPCQ2.connect("dialogic_signal", Callable(self, "dialogic_signal"))
	elif body.name == "Merlim" and Global.level==3:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		NPCD=true
		await get_tree().create_timer(1).timeout
		get_parent().add_child(NPCQ3)
		NPCQ3.connect("dialogic_signal", Callable(self, "dialogic_signal"))
	elif body.name == "Merlim" and Global.level==4:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		NPCD=true
		await get_tree().create_timer(1).timeout
		get_parent().add_child(NPCQ4)
		NPCQ4.connect("dialogic_signal", Callable(self, "dialogic_signal"))
	elif body.name == "Merlim" and Global.level==5:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		NPCD=true
		await get_tree().create_timer(1).timeout
		get_parent().add_child(NPCQ5)
		NPCQ5.connect("dialogic_signal", Callable(self, "dialogic_signal"))
	elif body.name == "Merlim" and Global.level==6:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		NPCD=true
		await get_tree().create_timer(1).timeout
		get_parent().add_child(NPCQ6)
		NPCQ6.connect("dialogic_signal", Callable(self, "dialogic_signal"))
	elif body.name == "Merlim" and Global.level==7:
		$Merlim/Camerashake.play("Camerashake")
		$Merlim.speed=0
		NPCD=true
		await get_tree().create_timer(1).timeout
		get_parent().add_child(NPCQ7)
		NPCQ7.connect("dialogic_signal", Callable(self, "dialogic_signal"))
