import wollok.game.*
import hector.*


class Maiz {
	var property position = game.at(1, 1)
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_baby.png"
	}
	method plantar() {
	  self.validarPlantar()
	  self.position(hector.position())
	  game.addVisual(new Maiz())
	}
	method validarPlantar() {
		if (hector.hayColision()) {
			self.error("No se puede plantar acá")
		}
	}
	
}

class Trigo {
	var property position = game.at(4, 1)
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "wheat_0.png"
	}
	method plantar() {
	  self.validarPlantar()
	  self.position(hector.position())
	  game.addVisual(new Trigo())
	}
	method validarPlantar() {
		if (hector.hayColision()) {
			self.error("No se puede plantar acá")
		}
	}
}
class Tomaco {
	var property position = game.at(3, 2)
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "tomaco.png"
	}
	method plantar() {
	  self.validarPlantar()
	  self.position(hector.position())
	  game.addVisual(new Tomaco())
	}
	method validarPlantar() {
		if (hector.hayColision()) {
			self.error("No se puede plantar acá")
		}
	}
}
	const maiz = new Maiz()
	const trigo = new Trigo()
	const tomaco = new Tomaco()