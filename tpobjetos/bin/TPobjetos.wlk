object rolando {

	var fuerzaOscura = 5
	var hechizoPreferido = espectroMalefico
	var artefactos = [espadaDelDestino , collarDivino , mascaraOscura]
	var valorBase = 1

	method fuerzaOscura() {
		return fuerzaOscura
	}

	method eclipse() {
		fuerzaOscura = self.fuerzaOscura() * 2
	}

	method seCreePoderoso() {
		return hechizoPreferido.esPoderoso()
	}

	method nivelDeHechiceria() {
		return (3 * self.poderHechizoPreferido()) + self.fuerzaOscura()
	}

	method hechizoPreferido(hechizo) {
		hechizoPreferido = hechizo
	}

	method poderHechizoPreferido() {
		return hechizoPreferido.poder()
	}

	method habilidadDeLucha() {
		return valorBase + artefactos.sum({unArtefacto => unArtefacto.poderDeLucha()})
	}

	method valorBase(unValor){
		valorBase = unValor
	}

	method agregarArtefacto(nuevoArtefacto) {
		artefactos.add(nuevoArtefacto)
	}

	method quitarArtefacto(artefacto) {
		artefactos.remove(artefacto)
	}

	method esHabilidadDeLuchaMayorAlNivelDeHechiceria() {
		return (self.habilidadDeLucha() > self.nivelDeHechiceria())
	}
	
	method artefactos(){
		return artefactos
	}

	method estaCargado() {
		return artefactos.size() > 4
	}
	
	method artefactoMasPoderoso(){
		
		return artefactos.max({artefacto => artefacto.poderDeLucha()})
	}
	
	method poderMasPoderoso(){
		return (self.artefactoMasPoderoso()).poderDeLucha()
	}
	
	method poseeArtefacto(unArtefacto){
		
		return artefactos.contains(unArtefacto)
	}
		
	method cantidadArtefactos(){
		
		return artefactos.size()	
	}
	
	method eliminarArtefactos(){
		
		artefactos.clear()
	}
	
}

/*PRIMER HECHIZO*/
object espectroMalefico {

	var nombre = "espectro Malefico"

	method cambiarNombre(nuevoNombre) { 
		nombre = nuevoNombre
	}

	method nombre() {
		return nombre
	}

	method poder() {
		return nombre.length()
	}

	method esPoderoso() {
		return self.poder() > 15
	}

}

/*SEGUNDO HECHIZO*/
object hechizoBasico {

	var nombre ="hechizo basico"
	
	method nombre() {
		return nombre
		
	}
	
	method poder() {
		return 10
	}

	method esPoderoso() {
		return false
	}
}

/*PUNTO 2 */
object espadaDelDestino{
	
	method poderDeLucha() {
		return 3
	}
}	

object collarDivino {

	var perlas = 5
	
	method perlas(){
		return perlas
	}
	
	method cambiarCantidadDePerlas(cantidadDePerlas){
		perlas = cantidadDePerlas
	}

	method poderDeLucha() {
		return self.perlas()
	}
}

object mascaraOscura {

	method poderDeLucha() {
		if (rolando.fuerzaOscura() == 5) {
			return 4
		} else {
			return rolando.fuerzaOscura() / 2
		}
	}
}

/*PUNTO 3 */
object armadura {
	var valorArmadura = 2
	var refuerzo = ninguno
	
	method poderDeLucha() {
		return valorArmadura + refuerzo.valorRefuerzo()
	}
	
	
	method refuerzo(nuevoRefuerzo){
		refuerzo = nuevoRefuerzo
	}
}

object cotaDeMalla {
				 
	method valorRefuerzo(){
		return 1
	} 
}

object bendicion {
				
		method valorRefuerzo(){
			return rolando.nivelDeHechiceria()
		}
}

object hechizo {
		var elHechizo = hechizoBasico
		
		method elHechizo(unHechizo){
			elHechizo = unHechizo
		}
		method valorRefuerzo(){
			return elHechizo.poder()
		}
}

object ninguno{
				
		method valorRefuerzo(){
			return 0
	}
} 



object espejoFantastico {
	var puntos = 0
		
	method puntosEspejo() {
		if((rolando.poseeArtefacto(self)) and (rolando.cantidadArtefactos() > 1)){
			rolando.quitarArtefacto(self)
			puntos = rolando.poderMasPoderoso()
			rolando.agregarArtefacto(self)
			}
		else{
			puntos = 0
			}
	}
		

	method puntos(){
		self.puntosEspejo()
		return puntos
	}

	method poderDeLucha() {
	
		return self.puntos()
	}
}

object libroDeHechizos {
	var hechizosDelLibro = []

	method agregarHechizo(hechizo) {
		hechizosDelLibro.add(hechizo) 
	}
	
	method quitarHechizo(hechizo) {
		hechizosDelLibro.remove(hechizo) 
	}

	method poder() {
		return (hechizosDelLibro.filter({unHechizo => unHechizo.esPoderoso()})).sum({unHechizo => unHechizo.poder()})
	}
}

