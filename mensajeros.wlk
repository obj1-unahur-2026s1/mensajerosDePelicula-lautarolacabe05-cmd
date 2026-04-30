import destinos.*
import paquetes.*
import vehiculos.*


object roberto {
  var peso = 0
  
  method puedeEntregarPaquete(paquete){
    return paquete.puedeLLevarlo(self) && paquete.estaPago()
  }
  
  method pesoTotal(pesoRoberto, vehiculo) {
    peso = pesoRoberto + vehiculo.peso()
  }
  
  method verPesoTotal() = peso
  
  method puedeLLamar() = false
}

object chuckNorris {
  method puedeEntregarPaquete(paquete){
    return paquete.puedeLLevarlo(self) && paquete.estaPago()
    }
  
  method verPesoTotal() = 80
  
  method puedeLLamar() = true
}

object neo {
  var credito = 0
  
  method puedeEntregarPaquete(paquete){
    return paquete.puedeLLevarlo(self) && paquete.estaPago()
  }
  
  method comprarCredito(valor) {
    credito += valor
  }
  
  method consumirCredito(valor) {
    credito = (credito - valor).max(0)
  }
  
  method verPesoTotal() = 0
  
  method puedeLLamar() = credito > 0
}

object ironMan {
  method puedeEntregarPaquete(paquete){
    return paquete.puedeLLevarlo(self) && paquete.estaPago()
  }
  
  method verPesoTotal() = 150
  
  method puedeLLamar() = true
}