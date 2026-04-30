import empresas.*
import destinos.*
import mensajeros.*

object paquete {
  var montoPagado = 0
  var destino = laMatrix
  
  method precio() {
        return 50
  }
  method estaPago() = montoPagado.min(50) == self.precio()
  
  method sumarPaga(cantidad) {
    montoPagado += cantidad
  }
  
  method puedeLLevarlo(mensajero) = self.estaPago() && destino.puedePasar(
    mensajero
  )
  
  method seleccionarDestino(destinoElegido) {
    destino = destinoElegido
  }
}

object paquetito {
  var destino = laMatrix
  method precio() {
    return 0
  }
  method seleccionarDestino(destinoElegido) {
    destino = destinoElegido
  }
  
  method estaPago() = true
  method puedeLLevarlo(mensajero) = true
}

object paquetonViajero {
  const destinos = []
  var cantidadPagada = 0

  method precio() {
    return destinos.size() * 100
  }
  
  method destinos(destino) {
    destinos.add(destino)
  }
  
  method verDestino() = destinos
  
  method estaPago() = self.precio() == cantidadPagada
  
  method sumarPaga(cantidad) {
    cantidadPagada = (cantidadPagada + cantidad).min(self.precio())
  }
  
  method puedeLLevarlo(mensajero){
    return destinos.all({ n => n.puedePasar(mensajero) }) && self.estaPago()
  }
}

object paqueteDeLujo {
  var cantidadPagada = 0
  var destino = laMatrix

  method precio() {
    return 1000
  }
  
  method seleccionarDestino(destinoElegido) {
    destino = destinoElegido
  }
  
  method verDestino() = destino
  
  method estaPago() = self.precio() == cantidadPagada
  
  method sumarPaga(cantidad) {
    cantidadPagada = (cantidadPagada + cantidad).min(self.precio())
  }

  method puedeLLevarlo(mensajero) {
    return destino.puedePasar(mensajero) && self.estaPago()
  }
}