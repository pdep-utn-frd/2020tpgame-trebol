import wollok.game.*

class Ship {
    var m_position
    var m_image
    
    method position() {
    	return m_position
    }
    
    method image() {
    	return m_image	
    }
    
    method place(where) {
    	m_position = where	
    	m_image = "assets/barco.png"
    
    	// TODO: Should we call this outside the class?	
    	game.addVisual(self)
    }
    
    method sink() {
    	m_image = "assets/barco_hundido.png"
    }
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

    method prepararJugadores() {
        jugador.colocarBarcos()
        oponente.colocarBarcos()
    }

    method iniciarCombate() {

    }
}

// TODO: Considerar la utilización de herencia en los objetos "jugador" y "oponente".
// TODO: Quizás es más conveniente usar un Issue para esta clase de comentarios =).

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
