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
    	
    	game.removeVisual(self)
    	game.addVisual(self)
    	game.say(self, "Me hundieron.")
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

object player {
    const m_navy = []
    
    method navy() {
    	return m_navy
    }

	method setup() {
		keyboard.enter().onPressDo({self.tryToPlaceShip()})
		keyboard.space().onPressDo({self.tryToAttackShip()})
    }		

    method tryToPlaceShip() {
    	if (m_navy.size() < 5) {
    		// TODO: Check upper and lower limits.
    		// TODO: Check if there's already a ship in the
    		// selector's position.
    		
    		// Create and place the ship in the game.
    		const ship = new Ship()
    		ship.place(selector.position())
    		
    		m_navy.add(ship)
    	} else {
    		game.say(selector, "Ya colocaste todos tus barcos.")
    	}
    }

    method tryToAttackShip() {
    	enemy.navy().forEach({ s => self.tryToAttackShip(s) })
    }
    
    method tryToAttackShip(ship) {
    	if (selector.position() == ship.position()) {
    		ship.sink()
    	}
    }
}

object enemy {
	const m_navy = []
	
	method navy() {
		return m_navy
	}
	
	method setup() {
		self.tryToPlaceShip()
	}
	
	method tryToPlaceShip() {
		if (m_navy.size() < 5) {
			// TODO: Check upper and lower limits.
			// TODO: Check if there's already a ship in the
    		// selector's position.
    		
    		// Create and place the ship in the game.
    		const ship = new Ship()
    		ship.place(game.at(0.randomUpTo(11).truncate(0), 0.randomUpTo(10).truncate(0)))
    		
    		m_navy.add(ship)
    		
    		// TODO: Not sure if the teacher is gonna like this;
    		// find more information about ranges.
			self.tryToPlaceShip()
		}
	}
}
