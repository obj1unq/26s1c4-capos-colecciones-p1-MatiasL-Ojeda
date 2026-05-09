object rolando {
    const artefactos        = #{}
    const encuentros        = []
    var   limiteDeCapacidad = 2
    var property poderBase  = 5

    method artefactos     () = artefactos
    method tieneEspacio   () = artefactos.size() < limiteDeCapacidad
    method armamentoTotal () = castilloDePiedra.inventarioDeLCastillo().union(artefactos)
    method posee (artefacto) = artefactos.contains(artefacto)
    method poderDePelea   () = poderBase + artefactos.sum(artefacto=> artefacto.poder(poderBase))

    method luchar() {
        poderBase += 1
    }
    method encontrar (artefacto) {
        encuentros.add(artefacto)
        if (self.tieneEspacio ()) {
            artefactos.add(artefacto)
        }
    }
    method aumentarCapacidad () {
        limiteDeCapacidad += 1
    }
    method guardarEnCastillo () {
        castilloDePiedra.depositar(artefactos)
        artefactos.clear()
    }
}
object castilloDePiedra {
    const deposito = {}

    method inventarioDeLCastillo () = deposito

    method depositar (coleccion) {
        deposito.addAll(coleccion)
    }
}
object espadaDelDestino {
    var fueUsada = false
    method poder(poderBase) = if (fueUsada) poderBase / 2 else poderBase
}
object libroDeHechizos {
 
}
object collarDivino {
    var cantBatalla = 0
    method poder(poderBase) = 3 + if (poderBase > 6) cantBatalla else 0
}
object armaduraValyria {
 
}
// Test que hicimos en la clase con nico
// import capos.*
// describe "Capos" {
//   test "Encuentra y recolecta" {
//     // Configuración -- Vacía

//     // Ejercitación
//     rolando.encontrar(espadaDelDestino)

//     // Verificación
//     assert.that(rolando.mochila().contains(espadaDelDestino))
//     assert.equals([espadaDelDestino], rolando.encuentros())
//   }

//   test "Encuentra y no recolecta" {
//     // Configuración => lleno la mochila
//     self.llenarMochila()

//     // Ejercitación => con la mochila llena no puede seguir recolectando
//     rolando.encontrar(collarDivino)

//     // Verificación
//     assert.notThat(rolando.mochila().contains(collarDivino))
//     assert.that(rolando.encuentros().contains(collarDivino))
//     assert.equals(#{espadaDelDestino, libroDeHechizos}, rolando.mochila())
//     assert.equals(#{libroDeHechizos, espadaDelDestino}, rolando.mochila())
//     assert.equals([espadaDelDestino, libroDeHechizos, collarDivino], rolando.encuentros())
//   }

//   test "No se puede recolectar con mochila llena" {
//     // Configuración => lleno la mochila
//     self.llenarMochila()

//     // Ejercitación (+ verificación) => con la mochila llena no puede seguir recolectando
//     assert.throwsExceptionWithMessage(
//       "No tengo lugar en la mochila", 
//       { rolando.recolectar(collarDivino) })

//     // Verificación adicional
//     assert.equals(2, rolando.mochila().size())
//     assert.notThat(rolando.mochila().contains(collarDivino))
//   }

//   method llenarMochila() {
//     rolando.encontrar(espadaDelDestino)
//     rolando.encontrar(libroDeHechizos)
//   }
// }