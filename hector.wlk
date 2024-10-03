import tablero.*
import wollok.game.*
import cultivos.*

object hector {
	var property position = game.at(5, 5)
	const property image = "player.png"
	const property cosecha = [] //Podría sembrar y cosechar en el mismo lugar
	
	method sembrar(cultivo) {
		//Hector es el que las planta, los cultivos no se plantan ellos mismos
		self.validarSembrar()
		cultivo.position(position)
		game.addVisual(cultivo)
		tablero.agregarCultivo(cultivo)
	}
	
	method validarSembrar() {
		if (self.hayColision()) self.error("No puedo plantar acá")
	}
	
	method hayColision() {
		const colisiones = game.colliders(self)
		return not colisiones.isEmpty()
	}
	
	method regar() {
		const cultivo = game.uniqueCollider(self)
		tablero.validarRegar(self.position())
		cultivo.regar()
	}

	method cosechar() {
		const cultivo = game.uniqueCollider(self)
		tablero.validarCosechar(self.position())
		self.agregarCosecha(cultivo)
		cultivo.cosechar()

	}

	method agregarCosecha(cultivo) {
		cosecha.add(cultivo)
	}
	
	// ↓↓↓↓ BORRAR DESPUÉS
	method text() = (("x:" + position.x()) + " y:") + position.y()
}