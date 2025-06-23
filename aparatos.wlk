import pacientes.*
class Aparato {
  var property color = "blanco"

  method puedeSerUtilizadoPor(unPaciente) = true

  method serUtilizadoPor(unPaciente) 

  method necesitaMantenimiento()

  method recibirMantenimiento()
}

class Magneto inherits Aparato {
  var imantacion = 800

  override method serUtilizadoPor(unPaciente) {
    unPaciente.disminuirNivelDolor(unPaciente.nivelDolor() * 0.1)
    imantacion = (imantacion - 1).max(0)
  }

  override method necesitaMantenimiento() = imantacion < 100

  override method recibirMantenimiento() {
    imantacion += 500
  }
}

class Bicicleta inherits Aparato {
  var desajustes = 0
  var perdidasAceite = 0

  override method puedeSerUtilizadoPor(unPaciente) = unPaciente.edad() > 8 

  override method serUtilizadoPor(unPaciente) {
    if (unPaciente.nivelDolor() > 30) desajustes += 1
    if (unPaciente.edad().between(30, 50)) perdidasAceite += 1
    unPaciente.disminuirNivelDolor(4) 
    unPaciente.aumentarNivelFortaleza(3)
  }

  override method necesitaMantenimiento() = desajustes >= 10 || perdidasAceite >= 5

  override method recibirMantenimiento() {
    desajustes = 0
    perdidasAceite = 0
  }
}

class Minitramp inherits Aparato {
  override method puedeSerUtilizadoPor(unPaciente) = unPaciente.nivelDolor() < 20

  override method serUtilizadoPor(unPaciente) {
    unPaciente.aumentarNivelFortaleza(unPaciente.edad() * 0.1)
  }

  override method necesitaMantenimiento() = false
  
  override method recibirMantenimiento() {}
}
