import wollok.game.*

class Aspersor {
    var property position = game.at(2, 2)
    
    method image() = "aspersor.png"

    method regarAlrededor() {
        self.regar3Arriba()
        self.regar2Cetro()
        self.regar3Abajo()
    }

    method regar3Arriba() {
      //riega al norte
      //riega al noreste
      //riega al noroeste
    }
    method regar2Cetro() {
      //riega al este
      //riega al oeste
    }
    method regar3Abajo() {
      //riega al sur
      //riega al sureste
      //riega al suroeste
    }
    /*
    ¿Dónde pondré el metódo regarEn(posicion)?
    */
}