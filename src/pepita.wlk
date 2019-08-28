import ciudades.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property ciudad = buenosAires
	var property position = game.at(3, 3)

	method image() = if (energia > 100) {
		"pepita-gorda-raw.png"
	} else {
		"pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energia()
	}

	method irAcomer(comida) {
		self.move(comida.position())
		comida.teEncontro(self)
	}

	method volaHacia(lugar) {
		if (ciudad != lugar) {
			if (self.energia() < self.energiaParaVolar(self.distaciaHacia(lugar.position()))) {
				game.say(self, "Dame de comer primero!")
			} else {
				self.move(lugar.position())
				ciudad = lugar
			}
		} else {
			game.say(self, "ya estoy en " + lugar + " !")
		}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(self.distaciaHacia(nuevaPosicion))
		self.position(nuevaPosicion)
	}

	method distaciaHacia(posicion) {
		return position.distance(posicion)
	}

}

