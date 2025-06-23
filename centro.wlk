import pacientes.*
import aparatos.*

object centro {
  const aparatos = []
  const pacientes = #{}

  method agregarPaciente(unPaciente){
    pacientes.add(unPaciente)
  }
  
  method agregarAparato(unAparato){
    aparatos.add(unAparato)
  }

  method coloresAparatos() = aparatos.map{a => a.color()}.asSet()

  method pacientesMenoresDe8() = pacientes.filter({p => p.edad() < 8})

  method cantPacientesQueNoPuedenRealizarSesionCompleta() = pacientes.count({p => !p.puedeRealizarRutina()})

  method estaEnOptimasCondiciones() = self.cantAparatosQueNecesitanMantenimiento() == 0

  method estaComplicado() = self.cantAparatosQueNecesitanMantenimiento() >= aparatos.size() / 2

  method cantAparatosQueNecesitanMantenimiento() = aparatos.count({a => a.necesitaMantenimiento()})

  method visitaDeTecnico() {
    self.aparatosQueNecesitanMantenimiento().forEach({a => a.recibirMantenimiento()})
  }

  method aparatosQueNecesitanMantenimiento() = aparatos.filter({a => a.necesitaMantenimiento()})
}