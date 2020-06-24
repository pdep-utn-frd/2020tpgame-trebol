import wollok.game.*

class Barco {
    const property position

    // TODO: Luego.
    // const image = "barco.png"
}

object juego {
    method iniciar() {
        self.prepararWollokGame()
        self.prepararJugadores()

        self.iniciarCombate()
    }

    method prepararWollokGame() {
        // Cantidad de celdas. Usamos una extra en el ancho que usaremos para seleccionar
        // los barcos a colocar.
        game.width(11)
        game.height(10)

        // Título de la ventana.
        game.title("Batalla naval")

        // Abrimos la ventana del juego.
        game.start()
    }

    method prepararWollokGame() {
        jugador.colocarBarcos()
        oponente.colocarBarcos()
    }

    method iniciarCombate() {

    }
}

object jugador {
    var property flota
    var property celdas_atacadas

    method colocarBarcos() {

    }

    method atacar() {

    }

    method recibirAtaqueEnPosicion() {

    }
}

object oponente {
    var property flota
    var property celdas_atacadas

    method colocarBarcos() {

    }

    method atacar() {

    }

    method recibirAtaqueEnPosicion() {

    }
}
