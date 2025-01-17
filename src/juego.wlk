import wollok.game.*

/* `Ship` objects are the game's main entity. They are placed across the grid
   by both sides (player and computer) at the start of the match. Then, they
   may or may not be sunk on a given turn. */
class Ship {
    var m_position
    var m_image = "assets/barco.png"
    
    method position() {
    	return m_position
    }
    
    method image() {
    	return m_image	
    }
    
    method place() {
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

/* The `selector` object is controlled by the player. It is used
   to move across the grid, representing the current cell being
   selected. It can be used to place or attack ships. */
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

/* The core object. This is where the game begins. */
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
        game.start()
        
    }

    method setupWollokGame() {
    	// Grid size (in number of cells).
        game.width(11)
        game.height(10)

        game.title("Batalla naval")

        
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
    		const ship = new Ship(m_position = selector.position())
    		ship.place()
    		
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
    		const ship = new Ship(m_position = game.at(0.randomUpTo(11).truncate(0), 0.randomUpTo(10).truncate(0)))
    		ship.place()
    		
    		m_navy.add(ship)
    		
    		// TODO: Not sure if the teacher is gonna like this;
    		// find more information about ranges.
			self.tryToPlaceShip()
		}
	}
}
