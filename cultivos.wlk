import wollok.game.*
import hector.*
import tablero.*

class Maiz {
	var property position = game.at(1, 1)
	var property estado = "baby"
	
	method image() = ("corn_" + estado) + ".png"
	
	method regar() {
		estado = "adult"
	}
	method cosechar() {
		game.removeVisual(self)
	}
	method esCosechable() {
		return estado == "adult"
	}
}

class Trigo {
	var property position = game.at(4, 1)
	var property estapaDeEvolucion = 0
	
	method image() = ("wheat_" + estapaDeEvolucion) + ".png"
	
	method regar() {
		estapaDeEvolucion = (estapaDeEvolucion + 1) % 4
	}
	method cosechar() {
		game.removeVisual(self)
	}
	method esCosechable() {
		return estapaDeEvolucion >= 2
	}
}

class Tomaco {
	var property position = game.at(3, 2)
	
	method image() = "tomaco.png"
	
	method regar() {
		self.validarSubir()
		position = position.up(1)
	}
	
	method validarSubir() {
		if (not self.puedeSubir(position)) self.error("No puedo moverme")
	}
	
	method puedeSubir(posicion) = (posicion != game.at(
		posicion.x(),
		game.height() - 1
	)) and not tablero.hayAlgoArribaDe(self)
	// No me gustaba que atravezase a otros cultivos)

	method cosechar() {
		game.removeVisual(self)
	}
	method esCosechable() {
		return true
	}
}