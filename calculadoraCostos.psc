Algoritmo calculadoraCostos
	Definir precioProducto, precioConDescuento, impuesto, descuentoCantidad Como Real
	Definir cantidad, peso, costoEnvio, total Como Real
	Definir seleccion, cupon Como Entero
	Definir porcentajeDescuento, subtotal, totalDescuento Como Real
	Definir tieneCupon, destino, productos como cadena
	dimension productos[5]
	dimension porcentajeDescuento[2]
	
	Desc_5 <- 0.05
	Desc_10 <- 0.10
	
		//Productos Disponible
	productos[1] <- "Zapatillas"
	productos[2] <- "Polera"
	productos[3] <- "Short"
	productos[4] <- "Cacetines"
	productos[5] <- "Poleron"
	
	//Mostrar Productos disponibles
	escribir "Ingrese el numero del producto que desea"
	para i <- 1 hasta 5
		escribir i, ". ", productos[i]
	FinPara
	
	//Seleccionar el productos
	
	Leer seleccion
	
	Si seleccion >= 1 y seleccion <= 5 Entonces
		Escribir "producto seleccionado: ", productos[seleccion]
	SiNo
		Escribir "Producto no disponible"
	FinSi
		
	Escribir "Ingrese el precio del producto"
	leer precioProducto
	
	//Aplicar cupon de descuento
	
	Escribir "¿Tiene cupón de descuento? (si/no):"
	leer tieneCupon
	
	Si tieneCupon = "si" Entonces
		porcentajeDescuento[1] <- Desc_5
		porcentajeDescuento[2] <- Desc_10
		
		Escribir "Ingrese el número del cupon de descuento: "
		Escribir "1. 5%"
		Escribir "2. 10%"
		leer cupon
		
		Si cupon = 1 o cupon = 2 entonces
			precioConDescuento <- precioProducto - (precioProducto * porcentajeDescuento[cupon])
			
		FinSi
		
	FinSi
	
	Escribir "Ingrese la cantidad de artículos que va a comprar:"
	Leer cantidad
	
	Escribir "Ingrese el peso del paquete en kilogramos:"
	Leer peso
	
	Escribir "Ingrese el destino (Regional o Nacional:)"
	Leer destino
			
	//Calcular descuento por cantidad
	
	descuentoCantidad <- 0
	
	Si cantidad >= 5 Entonces
		descuentoCantidad <- precioConDescuento * Desc_5
	SiNo
		Si cantidad >= 3 Entonces
			descuentoCantidad <- precioConDescuento * Desc_10
		SiNo
			descuentoCantidad <- 0
		FinSi
	FinSi
	
	//Total descuento
	
	totalDescuento <- precioConDescuento - descuentoCantidad
	
		//Calcular Costo de Envío
	Si destino = "Regional" Entonces
		costoEnvio <- peso * 500
	SiNo
		si destino = "Nacional" Entonces
			costoEnvio <- peso * 1000
		SiNo
			Escribir "Destino Inválido. Asignando envío nacional por defecto"
			costoEnvio <- peso * 1000
		FinSi
	FinSi
			
	//Calcular subtotal
	subtotal <- ((totalDescuento) * cantidad) + costoEnvio
	
	//Calcular impuesto (IVA 19%)
	impuesto <- subtotal * 0.19
	
	total <- subtotal + impuesto
	
	
	totalDescuento <- (precioProducto * cantidad) - subtotal
	
	// Detalle
	Escribir"---------------------------------------"
	Escribir "Precio del producto: $", precioProducto
	Escribir "Descuento por cupón aplicado: ", porcentajeDescuento[cupon], "%"
	Escribir "Precio con descuento por unidad: $", precioConDescuento
	Escribir "Cantidad de productos: " , cantidad
	Escribir "Descuento por cantidad total: $", descuentoCantidad * cantidad
	Escribir "Total descuentos aplicados: ", totalDescuento
	Escribir "Costo de envío: $", costoEnvio
	Escribir "Subtotal: ", subtotal
	Escribir "Impuesto (IVA 19%): $", impuesto
	Escribir "Costo total a pagar: $", total
	
	
	
FinAlgoritmo
