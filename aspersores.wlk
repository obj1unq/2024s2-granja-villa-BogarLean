import wollok.game.*
import granja.*

class Aspersor {
  var property position = game.at(2, 2)
  var property cultivosDeAlrededor = #{}
  
  method image() = "aspersor.png"
  
  method regarAlrededor() {
    game.onTick(
      1000,
      "aspersorCultivosAlrededor",
      { self.agregarCultivosAlrededor() }
    )
    game.onTick(
      1000,
      "aspersorRegando",
      { cultivosDeAlrededor.all({ cultivo => cultivo.regado() }) }
    ) //self.agregarCultivosAlrededor()
    //cultivosDeAlrededor.all({cultivo => cultivo.regado()})
  }
  
  method agregarCultivo(cultivo) {
    cultivosDeAlrededor.add(cultivo)
  }
  
  method agregarCultivosAlrededor() {
    self.agregarCultivosCardinalesSiHay()
    self.agregarCultivosOrdinalesSiHay()
  }
  
  method agregarCultivosCardinalesSiHay() {
    self.agregarCultivoAlNorteSiHay()
    self.agregarCultivoAlSurSiHay()
    self.agregarCultivoAlEsteSiHay()
    self.agregarCultivoAlOesteSiHay()
  }
  
  method agregarCultivosOrdinalesSiHay() {
    self.agregarCultivoAlNoroesteSiHay()
    self.agregarCultivoAlNoresteSiHay()
    self.agregarCultivoAlSuroesteSiHay()
    self.agregarCultivoAlSuresteSiHay()
  }
  
  method agregarCultivoAlNorteSiHay() {
    if (granja.hayCultivoAlNorteDe(self)) {
      const cultivo = granja.cultivos.find(
        { cultivo => cultivo.position() == granja.norteDe(self) }
      )
      self.agregarCultivo(cultivo)
    }
  }
  
  method agregarCultivoAlSurSiHay() {
    if (granja.hayCultivoAlSurDe(self)) {
      const cultivo = granja.cultivos.find(
        { cultivo => cultivo.position() == granja.surDe(self) }
      )
      self.agregarCultivo(cultivo)
    }
  }
  
  method agregarCultivoAlEsteSiHay() {
    if (granja.hayCultivoAlEsteDe(self)) {
      const cultivo = granja.cultivos.find(
        { cultivo => cultivo.position() == granja.esteDe(self) }
      )
      self.agregarCultivo(cultivo)
    }
  }
  
  method agregarCultivoAlOesteSiHay() {
    if (granja.hayCultivoAlOesteDe(self)) {
      const cultivo = granja.cultivos.find(
        { cultivo => cultivo.position() == granja.oesteDe(self) }
      )
      self.agregarCultivo(cultivo)
    }
  }
  
  method agregarCultivoAlNoroesteSiHay() {
    if (granja.hayCultivoAlNoroesteDe(self)) {
      const cultivo = granja.cultivos.find(
        { cultivo => cultivo.position() == granja.noroesteDe(self) }
      )
      self.agregarCultivo(cultivo)
    }
  }
  
  method agregarCultivoAlNoresteSiHay() {
    if (granja.hayCultivoAlNoresteDe(self)) {
      const cultivo = granja.cultivos.find(
        { cultivo => cultivo.position() == granja.noresteDe(self) }
      )
      self.agregarCultivo(cultivo)
    }
  }
  
  method agregarCultivoAlSuroesteSiHay() {
    if (granja.hayCultivoAlSuroesteDe(self)) {
      const cultivo = granja.cultivos.find(
        { cultivo => cultivo.position() == granja.suroesteDe(self) }
      )
      self.agregarCultivo(cultivo)
    }
  }
  
  method agregarCultivoAlSuresteSiHay() {
    if (granja.hayCultivoAlOesteDe(self)) {
      const cultivo = granja.cultivos.find(
        { cultivo => cultivo.position() == granja.suresteDe(self) }
      )
      self.agregarCultivo(cultivo)
    }
  }
}