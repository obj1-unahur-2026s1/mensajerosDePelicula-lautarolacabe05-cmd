object bicicleta {
  method peso() {
    return 5
  }
}

object camion {
    const peso = cantidadAcoplados * 500
    var cantidadAcoplados = 0
    method peso() {
        return peso
  }
    method cantidadAcoplados(cantidad) {
        cantidadAcoplados = cantidad
    }
}