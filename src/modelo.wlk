object rolando {
	var hechizoPreferido
	var valorBaseHechiceria = 3
	var property valorBaseLucha = 1
	const artefactos = #{}
	
	method hechizoPreferido(unHechizo) {
		hechizoPreferido = unHechizo
	}
	method nivelHechiceria() = 
		valorBaseHechiceria * hechizoPreferido.poder() + fuerzaOscura.valor()
	method seCreePoderoso() = 
		hechizoPreferido.esPoderoso()
	method habilidadLucha() =
		valorBaseLucha + 
		artefactos.map({artefacto => artefacto.habilidadLucha()}).sum()
	method agregar(artefacto) {
		artefactos.add(artefacto)
	}
	method quitar(artefacto) {
		artefactos.remove(artefacto)
	}
	method masLuchadorQueHechicero() = 
		self.habilidadLucha() > self.nivelHechiceria()
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

object espadaDelDestino {
	method habilidadLucha() = 3
}

object collarDivino {
	var property cantidadPerlas
	
	method habilidadLucha() = cantidadPerlas
}

object mascaraOscura {
	const habilidadLuchaMinima = 4
	
	method habilidadLucha() = 
		habilidadLuchaMinima.max(fuerzaOscura.valor() / 2)
}