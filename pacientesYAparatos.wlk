class Paciente {
  var nivelFortaleza 
  var nivelDolor
  var edad

  method nivelFortaleza() = nivelFortaleza

  method aumentarNivelFortaleza(cantidad) {
    nivelFortaleza += cantidad
  }

  method disminuirNivelDolor(cantidad) {
    nivelDolor = (nivelDolor - cantidad).max(0)
  }

  method nivelDolor() = nivelDolor

  method edad() = edad

  method puedeUsar(unAparato) = unAparato.puedeSerUtilizadoPor(self)

  method usarAparato(unAparato) {
    if (!self.puedeUsar(unAparato)) {
      self.error("El paciente no puede usar ese aparato")
    } 
    unAparato.serUtilizadoPor(self)
  } 
}

class Magneto {
  method puedeSerUtilizadoPor(unPaciente) = true

  method serUtilizadoPor(unPaciente) {
    unPaciente.disminuirNivelDolor(unPaciente.nivelDolor() * 0.1)
  }
}

class Bicicleta {
  method puedeSerUtilizadoPor(unPaciente) = unPaciente.edad() > 8 

  method serUtilizadoPor(unPaciente) {
    unPaciente.disminuirNivelDolor(4) 
    unPaciente.aumentarNivelFortaleza(3)
  }
}

class Minitramp {
  method puedeSerUtilizadoPor(unPaciente) = unPaciente.nivelDolor() < 20

  method serUtilizadoPor(unPaciente) {
    unPaciente.aumentarNivelFortaleza(unPaciente.edad() * 0.1)
  }
}
