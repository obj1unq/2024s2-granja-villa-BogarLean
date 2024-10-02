import wollok.game.*
import hector.*

object tablero {
  var property cultivos = #{}
  
  method validarDentro(position) {
    if (not self.estaDentro(position)) self.error(
        "No puedo moverme fuera del tablero"
      )
  }
  
  method estaDentro(position) = position.x().between(
    0,
    game.width() - 1
  ) and position.y().between(0, game.height() - 1)
  
  method agregarCultivo(cultivo) {
    cultivos.add(cultivo)
  }
  
  method quitarCultivo(cultivo) {
    cultivos.remove(cultivo)
  }
  
  method validarRegar() {
    if (not self.hayPlantaConHector()) self.error("No puedo regar acá")
  }
  
  method hayPlantaConHector() = cultivos.any(
    { cultivo => cultivo.position() == hector.position() }
  )
}