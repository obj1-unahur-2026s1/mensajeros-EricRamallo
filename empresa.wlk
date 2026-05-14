import mensajeros.*
import destinos.*

object empresa {
    var property destino = puenteBrooklyn
  const property mensajeros = []
  const property paquetesEntregados = []
  const property paquetesPendientes = []
  method contratar(unMensajero) {
    mensajeros.add(unMensajero)
  }
  method despedir(unMensajero) {
    mensajeros.remove(unMensajero)
  }
  method despedirATodos() {
    mensajeros.clear()
  }
  method esGrande() = mensajeros.size() >= 2
  method puedeSerEntregadoPorElPrimerMensajero(unPaquete) = if(!mensajeros.isEmpty()) unPaquete.puedeSerEntregadoPor(mensajeros.first())
  method pesoDelUltimoMensajeroDeLaEmpresa() = mensajeros.last().peso()
  //----------------------------------------------------------------------------------
  method algunMensajeroPuedeLlevar(unPaquete) = mensajeros.any({m=> unPaquete.puedeSerEntregadoPor(m)})
  method todosLosMensajerosQuePuedeLlevar(unPaquete) = mensajeros.filter({m=> unPaquete.puedeSerEntregadoPor(m)})
  method haySobrePeso() = mensajeros.sum({m=>m.peso()}) / mensajeros.size() > 500
  method enviar(unPaquete) {
    if(!self.puedeSerEntregadoPorElPrimerMensajero(unPaquete)){
      paquetesPendientes.add(unPaquete)
    }else{
      paquetesEntregados.add(unPaquete)
    }
  }
  method facturacion() = paquetesEntregados.sum({p=>p.precio()})
  method enviarTodosLosPaquetes(unConjunto) {
    unConjunto.forEach({p=> self.enviar(p)})
  }
  method paquetesPendientesMasCaro() = paquetesPendientes.max({p=>p.precio()})
  method enviarSiEstabaPendiente(unPaquetePendiente) {
    if(unPaquetePendiente.estaPago()){
      self.enviar(unPaquetePendiente)
      paquetesPendientes.remove(unPaquetePendiente)
    }
  }
}