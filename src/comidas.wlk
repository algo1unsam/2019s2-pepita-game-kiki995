import wollok.game.*

object manzana {
	method image() = "manzana.png"
	method position() = game.at(5,1)
	method energia() = 80
	

	method teEncontro(alguien){
		game.removeVisual(self)
		alguien.come(self)
	}
}

object alpiste {
	method image() = "alpiste.png"
	method position() = game.at(5,5)
	method energia() = 5
	
	method teEncontro(alguien){
		game.removeVisual(self)
		alguien.come(self)
	}
}
