import wollok.game.*
import cultivos.*


object hector {
	var property position = game.center()
	const property image = "player.png"

	method text() {
		return "x:" + position.x() + " y:" + position.y()
		//Para probar
	}
	method sembrar() {
		//¿Funciona con la clase o debo hacer un objecto? ej:
		//const maiz = new Maiz()
		//const trigo = new Trigo()
		//const tomaco = new Tomaco()
		keyboard.m().onPressDo({Maiz.plantar()})
		keyboard.t().onPressDo({Trigo.plantar()})
		keyboard.o().onPressDo({Tomaco.plantar()})
	}
	method hayColision() {
      const colisiones = game.colliders(self)
      return not(colisiones.isEmpty())
    }
}