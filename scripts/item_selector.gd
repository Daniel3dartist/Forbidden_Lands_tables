extends VBoxContainer

@onready var _FileDialog : FileDialog = $"../../../../../FileDialog"

@export var selected_color : Color = Color('#41ffff')
@export var default_color : Color = Color('ffffff')

@onready var table_panel : Panel = $"../../../.."

func _ready():	
	OS.request_permissions()
	OS.get_granted_permissions()
	OS.request_permission('android.permission.WRITE_EXTERNAL_STORAGE')
	table_panel.connect('dice_result', Callable(self, '_on_Dice_Result'))
	_FileDialog.access = 2
#	$"../../../../../Tests_Label".text = String(OS.get_user_data_dir())
#	print(OS.get_name())

func _on_Dice_Result(result):
	print('Result: %s' % result)
	for i in self.get_children():
		var n_range = i.get_node('roll').text
		if n_range.contains('-') == true:
			var array : Array
			array = n_range.split('-')
			array = [int(array[0]), int(array[1])]
			if  result >= array[0] and result <= array[1]:
				i.modulate = selected_color
				open_book(int(i.get_node('pdf_page').text)+1)
			elif i.modulate == selected_color:
				i.modulate = default_color
		else:
			if int(n_range) == result:
				i.modulate = selected_color
				open_book(int(i.get_node('pdf_page').text)+1)
			elif i.modulate == selected_color:
				i.modulate = default_color


func open_book(page):
	print('page; ', page)
	var book : String = ""
	var book_ptbr : String = ''
	var local_path = 'file:///C:/Users/Daniel/Documents/Godot/Godot_v4.0.3-stable_win64/%s#page=%s' % [book ,page]
	var browser : Array = ['chrome.exe','firefox.exe','msedge.exe',]
#	var read_app = 'firefox.exe'
	
	if OS.get_name() == 'Android':
		pass
	else:
		for i in browser:
			var err = OS.execute('CMD.exe', ['/C', 'start %s %s' % [i ,local_path]])
			if err == OK:
				print(i)
				break
#		OS.execute('CMD.exe', ['/C', 'start %s %s' % [read_app ,local_path]])

# Just idex reference
'''
Abyss Worm 76
Bloodling 78
Demon 80
Death Knight 86
Dragon 88
Drakewyrm 90
Ent 92
Ghost 94
Giant 96
Giant Squid 98
Gray Bear 100
Gryphon 102
Harpies 104
Hydra 106
Insectoids 108
Manticore 110
Minotaur 112
Nightwargs 114
Sea Serpent 116
Strangling Vine 118
Troll 120
Undead 122
Wyvern 124
'''
