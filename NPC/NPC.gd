extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Welcome to the game! (Press E to continue)",
	"It's so hot here on Metal Land, they really need to combat the reflectiveness!",
	"The prophecy of Alkaline once said that a newcomer would shoot all of the targets before they ultimately defeat the golden stove and release our land from this cursed terrain.",
	"Oh and they also mentioned that if they did not do it in a strangely predetermined time, the curse would not be lifted.",
	"Hopefully that will not stop you from helping us.",
	"Oh and lastly, the prophecy said that the time would start right after you finish talking to me, best of luck, and watch out for the stove!"
	]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")

func _on_Area_body_entered(body):
	Dialogue.start_dialogue(dialogue)
	print("hi")
	


func _on_Area_body_exited(body):
	Dialogue.hide_dialogue()

func finished():
	get_node("/root/Game/Target_Container").show()
	Global.timer = 120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
