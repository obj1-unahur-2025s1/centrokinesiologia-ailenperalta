import aparatos.*
class Paciente {
  var nivelFortaleza 
  var nivelDolor
  const edad
  const rutina = []

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

  method puedeRealizarRutina() = rutina.all({a => self.puedeUsar(a)})

  method realizarSesionCompleta() {
    if (!self.puedeRealizarRutina()) {
      self.error("El paciente no puede realizar la rutina completa")
    }
    rutina.forEach({a => self.usarAparato(a)})
  }
}

class Resistente inherits Paciente {
  override method realizarSesionCompleta() {
    super()
    nivelFortaleza = nivelFortaleza + rutina.size()
  }
}

class Caprichoso inherits Paciente {
  override method puedeRealizarRutina() = super() && self.tieneAlgunAparatoColor("rojo")

  method tieneAlgunAparatoColor(unColor) = rutina.any({a => a.color() == unColor})

  override method realizarSesionCompleta() {
    super()
    super()
  }
}

class RapidaRecuperacion inherits Paciente {
  override method realizarSesionCompleta() {
    super()
    self.disminuirNivelDolor(puntosDolor.cantidad())
  }
}

object puntosDolor {
  var property cantidad = 3
}