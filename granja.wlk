import wollok.game.*
import hector.*

object granja {
  const property cultivos = #{}
  const property cosas = #{}
  
  method validarDentro(position) {
    if (not self.estaDentro(position)) self.error("No puedo seguir caminando")
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
  
  method agregarCosa(cosa) {
    cosas.add(cosa)
  }
  
  method validarRegar(posicion) {
    if (not self.hayCultivoEn(posicion)) self.error("No puedo regar acá")
  }
  
  method hayCultivoEn(posicion) = not cultivos.filter(
    { cultivo => cultivo.position() == posicion }
  ).isEmpty()
  
  method hayCosaEn(posicion) = not cosas.filter(
    { cosa => cosa.position() == posicion }
  ).isEmpty()
  
  method hayAlgoEn(posicion) = self.hayCultivoEn(posicion) or self.hayCosaEn(
    posicion
  )
  
  method hayAlgoAlNorteDe(cosa) = self.hayAlgoEn(
    game.at(cosa.position().x(), cosa.position().y() + 1)
  )
  
  method validarCosechar(posicion) {
    if (not self.hayCultivoCosechable(posicion)) self.error(
        "No tengo nada para cosechar"
      )
  }
  
  method hayCultivoCosechable(posicion) = self.hayCultivoEn(
    posicion
  ) and cultivos.find(
    { cultivo => cultivo.position() == posicion }
  ).esCosechable()
}