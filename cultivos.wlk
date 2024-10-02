import wollok.game.*
import hector.*


class Maiz {
	var property position = game.at(1, 1)
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_baby.png"
	}
	
	
}

class Trigo {
	var property position = game.at(4, 1)
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_0.png"
	}
	
}
class Tomaco {
	var property position = game.at(3, 2)
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco.png"
	}
	
}