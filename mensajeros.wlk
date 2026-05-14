object roberto {
  var property vehiculo = bici
  var property pesoPropio = 4
  method peso() = pesoPropio + vehiculo.peso()
  method puedeLlamar() = false
}
object chuckNorris {
  method peso() = 80
  method puedeLlamar() = true
}
object neo {
  var credito = true
  method peso() = 0
  method puedeLlamar() = credito
  method gastarCredito() {
    credito = !credito
  }
  method acreditar() {
    if (not credito){
        credito = true
    }
  }
}
object camion {
  var property acoplados = 1
  method peso() = 500 * acoplados
}
object bici {
  method peso() = 5
}
object teo {
  method peso() = 60
  method puedeLlamar() = true
}