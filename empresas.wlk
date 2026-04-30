import paquetes.*
import mensajeros.*
import destinos.*

object mensajeria {
  const mensajeros = []
  const paquetes = []
  const paquetesPendientes = []
  var facturacion = 0
  method listaDeMensajeros() = mensajeros
  
  method contratarMensajero(mensajero) {
    mensajeros.add(mensajero)
  }
  
  method despedirMensajero(mensajero) {
    mensajeros.remove(mensajero)
  }
  
  method despedirATodos() {
    mensajeros.clear()
  }
  
  method mensajeriaEsGrande() = mensajeros.size() > 2
  
  method pesoDelUltimoMensajero() = mensajeros.last().verPesoTotal()
  
  method paquetePuedeSerEntregadoPorElPrimerMensajero(
    paquete
  ) = paquete.puedeLLevarlo(mensajeros.first())
  
  method paquetePuedeSerEntregadoPorAlguien(paquete) = mensajeros.any(
    { mensajero => paquete.puedeLLevarlo(mensajero) }
  )
  
  method obtenerListaDeQuienesPuedenEntregarlo(paquete) {
    return mensajeros.filter({ mensajero => paquete.puedeLLevarlo(mensajero) })
  }

  method haySobrePeso(){
    return (mensajeros.sum({ mensajero => mensajero.verPesoTotal() }) / mensajeros.size()) > 500
  }

  method enviarPaquete(paquete) {
    if (self.paquetePuedeSerEntregadoPorAlguien(paquete)) {
      paquetes.remove(paquete)
      facturacion += paquete.precio()
    } else {
      paquetesPendientes.add(paquete)
    }
  }

  method enviarTodosLosPaquetes() {
    paquetes.forEach({ paquete => self.enviarPaquete(paquete)})
  }
  method enviarPaqueteMasCaro() {
    self.enviarPaquete(self.paquetePendienteMasCaro())
    facturacion += self.paquetePendienteMasCaro().precio()
    paquetesPendientes.remove(self.paquetePendienteMasCaro())
  }
  method paquetePendienteMasCaro() {
    return paquetesPendientes.max({ paquete => paquete.precio()})
  }

  method facturacionTotal() {
    return facturacion
  }

  method paquetesPendientes() {
    return paquetesPendientes
  }

  method añadirPaquetes(conjuntoPaquetes) {
    paquetes.addAll(conjuntoPaquetes)
  }
  method contratarMensajeros(conjuntoMensajeros) {
    mensajeros.addAll(conjuntoMensajeros)
  }
}