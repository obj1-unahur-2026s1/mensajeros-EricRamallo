import destinos.*
object paquete {
    var pagado = false
    var destino = puenteBrooklyn
  method puedeSerEntregadoPor(unMensajero) = self.estaPago() && destino.puedePasar(unMensajero)
  method registrarPago() {
    pagado = true
  }
  method cancelarPago() {
    pagado = false
  }
  method estaPago() = pagado
  method cambiarDestino(unDestino) {
    destino = unDestino
  }
  method precio() = 50
}
object paquetito {
  var destino = laMatrix
  method puedeSerEntregadoPor(unMensajero) = true
  method estaPago() = true
  method cambiarDestino(unDestino) {
    destino = unDestino
  }
  method precio() = 0
}
object paquetonViajero {
    var pagoRecibido = 0
  const property destinos = [puenteBrooklyn, laMatrix]
  method precio() = 100 * destinos.size()
  method agregaNuevoDestino(unDestino){
    destinos.add(unDestino)
  }
  method estaPago() = pagoRecibido == self.precio()
  method recibirPago(unValor) {
    pagoRecibido = pagoRecibido + unValor.min(self.precio())
  }
  method puedeSerEntregadoPor(unMesajero) =
  destinos.all({d => d.puedePasar(unMesajero)})
  && self.estaPago()
}
object cajaEnvalada {
   var destino = puenteBrooklyn
  method puedeSerEntregadoPor(unMensajero) = unMensajero.peso() <= 100
  method estaPago() = true
  method cambiarDestino(unDestino) {
    destino = unDestino
  }
  method precio() = 1500
}