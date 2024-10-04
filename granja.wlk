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
  
  method validarPonerAspersor(posicion) {
    if (self.hayAlgoEn(posicion)) self.error("No puedo poner el aspersor acá")
  }
  
  method hayAlgunCultivoAlrededor(cosa) = self.hayAlgunCultivoEnCardinales(
    cosa
  ) or self.hayAlgunCultivoEnOrdinales(cosa)
  
  method hayAlgunCultivoEnCardinales(cosa) = ((self.hayCultivoAlNorteDe(
    cosa
  ) or self.hayCultivoAlEsteDe(cosa)) or self.hayCultivoAlSurDe(
    cosa
  )) or self.hayCultivoAlOesteDe(cosa)
  
  method hayAlgunCultivoEnOrdinales(cosa) = ((self.hayCultivoAlNoresteDe(
    cosa
  ) or self.hayCultivoAlSuresteDe(cosa)) or self.hayCultivoAlSuroesteDe(
    cosa
  )) or self.hayCultivoAlNoroesteDe(cosa)
  
  method hayCultivoAlNoresteDe(cosa) = self.hayCultivoEn(
    game.at(cosa.position().x() - 1, cosa.position().y() + 1)
  )
  
  method hayCultivoAlSuresteDe(cosa) = self.hayCultivoEn(
    game.at(cosa.position().x() - 1, cosa.position().y() - 1)
  )
  
  method hayCultivoAlSurDe(cosa) = self.hayCultivoEn(
    game.at(cosa.position().x(), cosa.position().y() - 1)
  )
  
  method hayCultivoAlEsteDe(cosa) = self.hayCultivoEn(
    game.at(cosa.position().x() - 1, cosa.position().y())
  )
  
  method hayCultivoAlOesteDe(cosa) = self.hayCultivoEn(
    game.at(cosa.position().x() + 1, cosa.position().y())
  )
  
  method hayCultivoAlNoroesteDe(cosa) = self.hayCultivoEn(
    game.at(cosa.position().x() + 1, cosa.position().y() + 1)
  )
  
  method hayCultivoAlSuroesteDe(cosa) = self.hayCultivoEn(
    game.at(cosa.position().x() + 1, cosa.position().y() - 1)
  )
  
  method hayCultivoAlNorteDe(cosa) = self.hayCultivoEn(
    game.at(cosa.position().x(), cosa.position().y() + 1)
  )
  
  method norteDe(posicion) = game.at(posicion.x(), posicion.y() + 1)
  
  method surDe(posicion) = game.at(posicion.x(), posicion.y() - 1)
  
  method esteDe(posicion) = game.at(posicion.x() - 1, posicion.y())
  
  method oesteDe(posicion) = game.at(posicion.x() + 1, posicion.y())
  
  method noresteDe(posicion) = game.at(posicion.x() - 1, posicion.y() + 1)
  
  method suresteDe(posicion) = game.at(posicion.x() - 1, posicion.y() - 1)
  
  method noroesteDe(posicion) = game.at(posicion.x() + 1, posicion.y() + 1)
  
  method suroesteDe(posicion) = game.at(posicion.x() + 1, posicion.y() - 1)
}