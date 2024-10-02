import wollok.game.*
import cultivos.*


object hector {
	var property position = game.center()
	const property image = "player.png"

	method text() {
		return "x:" + position.x() + " y:" + position.y()
		//Para probar
	}
	method sembrar(cultivo) {
		//Hector es el que las planta, los cultivos no se plantan ellos mismos
		self.validarSembrar()
		cultivo.position(position)
		game.addVisual(cultivo)
		
	}
	method validarSembrar() {
	  if (self.hayColision()) {
		self.error("No puedo plantar acá")
		//No aparece el texto por algún motivo
	  }
	}
	method hayColision() {
      const colisiones = game.colliders(self)
      return not(colisiones.isEmpty())
    }
}