object rolando {
	var hechizoPreferido
	var valorBaseHechiceria = 3
	var valorBaseLucha = 1
	
	method hechizoPreferido(unHechizo) {
		hechizoPreferido = unHechizo
	}
	method nivelHechiceria() = 
		valorBaseHechiceria * hechizoPreferido.poder() + fuerzaOscura.valor()
	method seCreePoderoso() = 
		hechizoPreferido.esPoderoso()
	method valorBaseLucha(valor) {
		valorBaseLucha = valor
	}
}

object fuerzaOscura {
	var valor = 5
	
	method valor() = valor
	method valor(unValor) {
		valor = unValor
	}
	method eclipsar() {
		valor = valor * 2
	}
}

object espectroMalefico {
	var nombre = "Espectro maléfico"
	
	method nombre(unNombre) { 
		nombre = unNombre
	}
	method poder() = nombre.length()
	method esPoderoso() = self.poder() > 15
}

object hechizoBasico {
	method poder() = 10
	method esPoderoso() = false
}