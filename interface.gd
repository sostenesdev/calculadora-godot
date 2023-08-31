extends Control

@onready var display_text: Label = get_node("Background/Display/Text")
var operacao = "";
var valor1 = 0
var valor2 = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	for botao in get_tree().get_nodes_in_group("botao"):
		botao.pressed.connect(_on_pressed.bind(botao.name))
#		botao.connect("pressed",Callable(self, "_on_clear_pressed"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed(nome_botao: String) -> void:
	match nome_botao:
		"Div":
			operacao = "Div"
			display_text.text = ""
		"x":
			operacao = "x"
			display_text.text = ""
		"Mod":
			operacao = "Mod"
			display_text.text = ""
		"C":
			display_text.text = str(0)
			operacao = ""
			valor1=0
			valor2=0
		"-":
			operacao = "-"
			display_text.text = ""
		"+":
			operacao = "+"
			display_text.text = ""
		"=":
			realiza_operacao(operacao)
		_:
			if display_text.text != "0":
				display_text.text += str(nome_botao)
			else:
				display_text.text = nome_botao
			if operacao == "":
				valor1 = int(display_text.text)
			else:
				valor2 = int(display_text.text)

func realiza_operacao(operacao: String):
	match operacao:
		"Div":
			valor1 = valor1/valor2
		"x":
			valor1 = valor1*valor2
		"Mod":
			valor1 = valor1%valor2
		"-":
			valor1 = valor1-valor2
		"+":
			valor1 = valor1+valor2
		_:
			operacao = ""
	valor2 = 0
	display_text.text = str(valor1)
