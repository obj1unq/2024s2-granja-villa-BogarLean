import wollok.game.*
import cultivos.*
import granja.*

object hector {
	var property position = game.at(5, 5)
	const property image = "player.png"
	const property cosecha = [] //Podría sembrar y cosechar en el mismo lugar
	var property oro = 0
	
	method sembrar(cultivo) {
		//Hector es el que las planta, los cultivos no se plantan ellos mismos
		self.validarSembrar()
		cultivo.position(position)
		game.addVisual(cultivo)
		granja.agregarCultivo(cultivo)
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
		granja.validarRegar(self.position())
		cultivo.regar()
	}
	
	method cosechar() {
		const cultivo = game.uniqueCollider(self)
		granja.validarCosechar(self.position())
		self.agregarCosecha(cultivo)
		cultivo.cosechar()
	}
	
	method agregarCosecha(cultivo) {
		cosecha.add(cultivo)
	}

	method decirOroYCultivos() {
	  return game.say(self, oro + " de oro y " + self.cantidadCosechada() + " cultivos para vender")
	}

	method cantidadCosechada() {
		return cosecha.size()
	}

	method vender() {
		self.validarVender()
		cosecha.sum({cultivo => cultivo.valor()})
	}

	method validarVender() {
		if (cosecha.isEmpty()) {
			self.error("No tengo cultvios que vender")
		}
	}

	// ↓↓↓↓ BORRAR DESPUÉS
	method text() = (("x:" + position.x()) + " y:") + position.y()
}