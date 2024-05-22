class VagonDePasajeros{
	const property ancho
	const property largo
	var property estaOrdenado = true
	var property tieneBanio = true
	
	method cantidadDePasajeros() = largo * if (ancho <= 3){8}else{10} - if (not estaOrdenado) {15}else{0}
		
	method cantMaximaCarga() = if (tieneBanio){300}else{800}
	method pesoMaximo() = 2000+ 80* self.cantidadDePasajeros() + self.cantMaximaCarga()
	method esPopular() = self.cantidadDePasajeros() > 50
	method esCarguero() = self.pesoMaximo() > 1000
	method hacerMantenimiento(){estaOrdenado = true}
	
}

class VagonDeCarga{
	const property cargaMaximaIdeal
	var property cantMaderasSueltas
	
	method tieneBanio() = false 
	method cantidadDePasajeros() = 0
	method cantMaximaCarga() = cargaMaximaIdeal - cantMaderasSueltas * 400
	method pesoMaximo() = 1500 + self.cantMaximaCarga()
	method esPopular() = self.cantidadDePasajeros() > 50
	method esCarguero() = self.pesoMaximo() > 1000
	method hacerMantenimiento(){ cantMaderasSueltas = 0.max(cantMaderasSueltas - 2)}
	
	
	
}

class VagonDeDormitorio{
	var property compartimentos
	var property camasPorCompartimento
	
	method tieneBanio()=true
	method cantidadDePasajeros()= compartimentos*camasPorCompartimento
	method cantMaximaCarga()= 1200
	method pesoMaximo() = 4000+80*self.cantidadDePasajeros()+self.cantMaximaCarga()
	method esPopular() = self.cantidadDePasajeros() > 50
	method esCarguero() = self.pesoMaximo() > 1000
	method hacerMantenimiento(){}
}

