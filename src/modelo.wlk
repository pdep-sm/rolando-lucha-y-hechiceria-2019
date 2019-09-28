class Guerrero {
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
		artefactos.map({artefacto => artefacto.habilidadLucha(self)}).sum()
	
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
		
		return artefactosFiltrados.map({ artefacto => artefacto.habilidadLucha(self) }).maxIfEmpty({0})
	}
	
	method estaCargado() = artefactos.size() >= 5
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

class HechizoDeLogo {
	var property nombre
	var property multiplicador
	
	method poder() = nombre.length() * multiplicador
	
	method esPoderoso() = self.poder() > 15
	
	method valorDeRefuerzo(guerrero) = self.poder()
}

object hechizoBasico {
	method poder() = 10
	
	method esPoderoso() = false
	
	method valorDeRefuerzo(guerrero) = self.poder()
}

object espadaDelDestino {
	method habilidadLucha(guerrero) = 3
}

object collarDivino {
	var property cantidadPerlas
	
	method habilidadLucha(guerrero) = cantidadPerlas
}

object mascaraOscura {
	const habilidadLuchaMinima = 4
	
	method habilidadLucha(guerrero) = 
		habilidadLuchaMinima.max(fuerzaOscura.valor() / 2)
}



object armadura {
	var refuerzo = ningunRefuerzo
	const valorBaseLucha = 2
	
	method refuerzo(unRefuerzo) {
		refuerzo = unRefuerzo
	}
	
	method habilidadLucha(guerrero) = valorBaseLucha + refuerzo.valorDeRefuerzo(guerrero)
}

object cotaDeMalla {
	method valorDeRefuerzo(guerrero) = 1
}

object bendicion {
	method valorDeRefuerzo(guerrero) = guerrero.nivelHechiceria()
}

object ningunRefuerzo {
	method valorDeRefuerzo(guerrero) = 0
}

object espejo {
	method habilidadLucha(guerrero) {
		return guerrero.habilidadMejorArtefactoSin(self)
	}
}

object libroDeHechizos {
	const hechizos = []
	
	method agregar(hechizo) {
		hechizos.add(hechizo)
	}
	
	method poder() =
		self.hechizosPoderosos().sum({ hechizo => hechizo.poder() })
		
	method hechizosPoderosos() = 
		hechizos.filter({hechizo => hechizo.esPoderoso()})
		
	method esPoderoso() = 
		hechizos.any({hechizo => hechizo.esPoderoso()})
}














