import wollok.game.*
import hector.*

object tablero {
  var property cultivos = #{}
  var property cosas = #{}
  
  method validarDentro(position) {
    if (not self.estaDentro(position)) self.error(
        "No puedo seguir caminando"
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
  
  method validarRegar(posicion) {
    if (not self.hayCultivoEn(posicion)) self.error("No puedo regar acá")
  }

  /* ↓ mal no se debe poner a hector
  method hayPlantaConHector() = cultivos.any(
    { cultivo => cultivo.position() == hector.position() }
  )
  */

  method hayCultivoEn(posicion) {
      return not cultivos.filter({cultivo => cultivo.position() == posicion}).isEmpty()
  }
  method hayCosaEn(posicion) {
      return not cosas.filter({cosa => cosa.position() == posicion}).isEmpty()
  }
  method hayAlgoArribaDe(cosa) {
      return self.hayCultivoEn(game.at(cosa.position().x(), cosa.position().y() + 1)) 
      or self.hayCosaEn(game.at(cosa.position().x(), cosa.position().y() + 1 ))
}
}