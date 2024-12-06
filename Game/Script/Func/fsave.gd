extends Node

const a = {'b': 1}

func save_data():
    var file = FileAccess.open('user://save.txt', FileAccess.READ)
    
    if !file:
        file = FileAccess.open('user://save.txt', FileAccess.WRITE)
        file.store_string(str(a))
        file.close()
        
    file = FileAccess.open('user://save.txt', FileAccess.WRITE)
    file.close()

func load_data():
    var file = FileAccess.open('user://save.txt', FileAccess.READ)
    
    if !file:
        file = FileAccess.open('user://save.txt', FileAccess.WRITE)
        file.store_string(str(a))
        file.close()
        
    file = FileAccess.open('user://save.txt', FileAccess.READ)
    print(JSON.parse_string(file.get_as_text()))
    file.close()
        
