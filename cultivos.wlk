import wollok.game.*
import hector.*
import tablero.*

class Maiz {
	var property position = game.at(1, 1)
	var property estado = "baby"

	method image() = ("corn_" + estado) + ".png"
	
	method regado() {
		estado = "adult"
	}
}

class Trigo {
	var property position = game.at(4, 1)
	
	method image() = "wheat_0.png"
	
	method regado() {
		
		// Hm
	}
}

class Tomaco {
	var property position = game.at(3, 2)
	
	method image() = "tomaco.png"
	
	method regado() {
		self.validarSubir()
		position = position.up(1)
	}
	
	method validarSubir() {
		if (not self.puedeSubir(position)) self.error("No puedo moverme")
	}
	
	method puedeSubir(posicion) = posicion != game.at(
		posicion.x(),
		game.height() - 1
	)
}