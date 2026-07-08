extends Node
const serial_rs = preload("res://bin/gdserial.gdns")
var serial_port = serial_rs.new()
var is_port_open = false
var msg = ''
signal direita(player)
signal esquerda(player)
signal cima(player)
signal baixo(player)
signal boladefogo(player)
signal furacao(player)
signal tempestade(player)
signal trovoada(player)
func _ready():
	is_port_open = serial_port.open_port('COM3',9600)
	print(is_port_open)
func _process(delta):
	if (is_port_open):
		var message = serial_port.read_text()
		if(message.length()>0):
			for i in message:
				if(i == '\n'):
					print(msg)
					_text_interpreter(msg)
					msg = ''
				else:
					msg += i

func _text_interpreter(msg):
	if (msg == "Esquerda"):
		emit_signal("esquerda")
	if (msg == "Direita"):
		emit_signal("direita")
	if (msg == "Cima"):
		emit_signal("cima")
	if (msg == "Baixo"):
		emit_signal("baixo")
	if (msg == "boladefogo"):
		emit_signal("boladefogo")
	if (msg == "furacao"):
		emit_signal("furacao")
	if (msg == "tempestade"):
		emit_signal("tempestade")
	if (msg == "trovoada"):
		emit_signal("trovoada")
