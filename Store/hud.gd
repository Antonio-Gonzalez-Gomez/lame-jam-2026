extends CanvasLayer

@onready var money_ui: RichTextLabel = $Money
@onready var store: Control = $Store

func _ready() -> void:
	GlobalAutoload.collected_money.connect(update_money_counter)

func update_money_counter(money):
	money_ui.text = str(money) + "$"

func show_store():
	store.show()
	var tween = get_tree().create_tween()
	tween.tween_property(store,"position",Vector2(0,0),0.15).set_trans(Tween.TRANS_CIRC)

func hide_store():
	var tween = get_tree().create_tween()
	tween.tween_property(store,"position",Vector2(0,500),0.15).set_trans(Tween.TRANS_CIRC)
	await tween.finished
	store.hide()
