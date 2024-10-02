import wollok.game.*
import hector.*
import tablero.*



class Maiz {
	var property position = game.at(1, 1)
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_baby.png"
	}
	method regado() {
	  
	}
	
	
}

class Trigo {
	var property position = game.at(4, 1)
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_0.png"
	}
	method regado() {
	  
	}
	
}
class Tomaco {
	var property position = game.at(3, 2)
	method image() {
		return "tomaco.png"
	}
	method regado() {
	  self.validarSubir()
	  position = position.up(1)
	}
	method validarSubir() {
		if (not self.puedeSubir(position)) {
			self.error("No puedo moverme")
		}
	}
	method puedeSubir(posicion) {
        return (posicion != game.at(game.width() - 1, posicion.y()))
    }
	
}