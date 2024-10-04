import wollok.game.*
import hector.*
import granja.*

class Maiz {
	var property position = game.at(1, 1)
	var property estado = "baby"
	const property valor = 150
	
	method image() = ("corn_" + estado) + ".png"
	
	method regado() {
		estado = "adult"
	}
	
	method cosechar() {
		granja.quitarCultivo(self)
		game.removeVisual(self)
	}
	
	method esCosechable() = estado == "adult"
}

class Trigo {
	var property position = game.at(4, 1)
	var property estapaDeEvolucion = 0
	
	method image() = ("wheat_" + estapaDeEvolucion) + ".png"
	
	method regado() {
		estapaDeEvolucion = (estapaDeEvolucion + 1) % 4
	}
	
	method cosechar() {
		granja.quitarCultivo(self)
		game.removeVisual(self)
	}
	
	method esCosechable() = estapaDeEvolucion >= 2
	
	method valor() = (estapaDeEvolucion - 1) * 100
}

class Tomaco {
	var property position = game.at(3, 2)
	const property valor = 80
	
	method image() = "tomaco.png"
	
	method regado() {
		self.validarSubir()
		position = position.up(1)
	}
	
	method validarSubir() {
		if (not self.puedeSubir(position)) self.error("No puedo moverme")
		// Esto se vuelve molesto con el aspersos xD
	}
	
	method puedeSubir(posicion) = (posicion != game.at(
		posicion.x(),
		game.height() - 1
	)) and not granja.hayAlgoArribaDe(self)
	// ↑ No me gustaba que atravezase a otros cultivos
	
	method cosechar() {
		granja.quitarCultivo(self)
		game.removeVisual(self)
	}
	
	method esCosechable() = true
}