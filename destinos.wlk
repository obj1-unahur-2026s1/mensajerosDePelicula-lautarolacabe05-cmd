import mensajeros.*
object puenteBrooklyn {
    method puedePasar(mensajero) {
      return mensajero.verPesoTotal()<= 1000
    }
}

object laMatrix {
  method puedePasar(mensajero) {
    return mensajero.puedeLLamar()
  }
}