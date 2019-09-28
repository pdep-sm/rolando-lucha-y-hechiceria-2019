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
		
	method habilidadMejorArtefactoSin(unArtefacto) {
		var artefactosFiltrados = artefactos.filter({ artefacto => artefacto != unArtefacto })
		
		return artefactosFiltrados.map({ artefacto => artefacto.habilidadLucha() }).maxIfEmpty({0})
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
	
	method valorDeRefuerzo() = self.poder()
}

object hechizoBasico {
	method poder() = 10
	
	method esPoderoso() = false
	
	method valorDeRefuerzo() = self.poder()
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



object armadura {
	var refuerzo = ningunRefuerzo
	const valorBaseLucha = 2
	
	method refuerzo(unRefuerzo) {
		refuerzo = unRefuerzo
	}
	
	method habilidadLucha() = valorBaseLucha + refuerzo.valorDeRefuerzo()
}

object cotaDeMalla {
	method valorDeRefuerzo() = 1
}

object bendicion {
	method valorDeRefuerzo() = rolando.nivelHechiceria()
}

object ningunRefuerzo {
	method valorDeRefuerzo() = 0
}

object espejo {
	method habilidadLucha() {
		return rolando.habilidadMejorArtefactoSin(self)
	}
}

object libroDeHechizos {
	const hechizos = []
	
	method agregar(hechizo) {
		hechizos.add(hechizo)
	}
	
	method poder() =
		hechizos.sum({ hechizo => hechizo.poder() })
		
	method esPoderoso() = 
		hechizos.any({hechizo => hechizo.esPoderoso()})
}














