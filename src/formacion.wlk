class Formacion {
	const property vagones = #{}
	
	method pasajerosQuePuedeLlevar()= vagones.sum{v => v.cantidadDePasajeros()}
	method cuantosVagonesPopulares()= vagones.count {v=> v.esPopular()}
	method esFormacionCarguera()= vagones.all{v=>v.esCarguero()}
	method vagonMasPesado() = vagones.max{v=> v.pesoMaximo()}
	method vagonMenosPesado() = vagones.min{v => v.pesoMaximo()}
	method dispercionDePeso()= self.vagonMasPesado().pesoMaximo() - self.vagonMenosPesado().pesoMaximo()
	method cantBanios()= vagones.map({v => if (v.tieneBanio()){1}else{0}}).sum()
	method hacerMantenimiento(){
		vagones.forEach{v=>v.hacerMantenimiento()}
	}
	method equilibradaEnPasajeros() =  self.vagonMasPasajeros().cantidadDePasajeros() - self.vagonMaenosPasajeros().cantidadDePasajeros() < 20
	method vagonesQueLlevanPasajeros() = vagones.filter{v=> v.cantidadDePasajeros() > 0}
	method vagonMasPasajeros() = self.vagonesQueLlevanPasajeros().max{v=> v.cantidadDePasajeros()} 
	method vagonMaenosPasajeros() = self.vagonesQueLlevanPasajeros().min{v=> v.cantidadDePasajeros()}
	method estaOrganizada(){
		vagones.forEach{v => calculoOrganizacion.procesarVagon(v)}
		return calculoOrganizacion.hayOrden()
	}  
	

	
}
object calculoOrganizacion{
	var property hayOrden = true
	var todosConPasajeros = true
	
	method procesarVagon(vagon){
		if (vagon.cantidadDePasajeros() > 0){
			if (not todosConPasajeros){hayOrden = false}
		}else {todosConPasajeros = false}
	}
}