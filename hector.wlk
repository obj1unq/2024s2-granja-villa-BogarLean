import wollok.game.*
import cultivos.*
import granja.*

object hector {
	var property position = game.at(5, 5)
	const property image = "player.png"
	const property cosecha = #{}
	var property oro = 0
	
	method sembrar(cultivo) {
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
		granja.validarRegar(position)
		const cultivo = game.uniqueCollider(self)
		cultivo.regado()
	}
	
	method cosechar() {
		granja.validarCosechar(position)
		const cultivo = game.uniqueCollider(self)
		self.agregarCosecha(cultivo)
		cultivo.cosechar()
	}
	
	method agregarCosecha(cultivo) {
		cosecha.add(cultivo)
	}
	
	method decirOroYCosechados() {
		game.say(
			self,
			((("Tengo " + oro) + " de oro y ") + self.cantidadCosechada()) + " cultivos para vender"
		)
	}
	
	method cantidadCosechada() = cosecha.size()
	
	method vender() {
		self.validarVender()
		oro = cosecha.sum({ cultivo => cultivo.valor() })
		self.vaciarCosechados()
	}
	
	method validarVender() {
		if (cosecha.isEmpty()) self.error("No tengo cultvios que vender")
	}
	
	method vaciarCosechados() {
		cosecha.clear()
	}
}