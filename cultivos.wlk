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
	var property estapaDeEvolucion = 0
	
	method image() = ("wheat_" + estapaDeEvolucion) + ".png"
	
	method regado() {
		estapaDeEvolucion = (estapaDeEvolucion + 1) % 4
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
	
	method puedeSubir(posicion) { 
		return (posicion != game.at(posicion.x(), game.height() - 1)) and not
			tablero.hayAlgoArribaDe(self)
	}
}