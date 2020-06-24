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
}

object jugador {
    var property flota

    method colocarBarcos() {

    }

    method atacar() {

    }
}

object oponente {
    var property flota

    method colocarBarcos() {

    }

    method atacar() {

    }
}
