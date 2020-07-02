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

// Used to select positions to place a new ship or
// attack one (if any).
object selector {
	var m_position = game.center()
	
	method position() {
		return m_position
	}
	
	method position(new_position) {
		m_position = new_position
	}
	
	method image() {
		return "assets/casilla.png"
	}
}

object app {
	var m_stage
	
	method maximumNavyCapacity() {
		return 5
	}
	
	method stage() {
		return m_stage
	}
	
	method stage(new_stage) {
		m_stage = new_stage
	}
	
    method start() {
        self.setupWollokGame()
        self.setupPlayers()
    }

    method setupWollokGame() {
    	// Grid size (in number of cells).
        game.width(11)
        game.height(10)

        game.title("Batalla naval")

        game.start()
        
        game.addVisualCharacter(selector)
    }

    method setupPlayers() {
        enemy.setup()
        player.setup()
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
