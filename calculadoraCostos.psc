Algoritmo calculadoraCostos
	Definir precioProducto, precioConDescuento, impuesto, descuentoCantidad, precioFinal Como Real
	Definir cantidad, peso, costoEnvio, total Como Real
	Definir seleccion, cupon, montoPago,cambio Como Entero
	Definir porcentajeDescuento, subtotal, totalDescuento Como Real
	Definir tieneCupon, productos como cadena
	dimension productos[5]
	dimension porcentajeDescuento[2]
	dimension destinos[2]
		
	Desc_5 <- 0.05
	Desc_10 <- 0.10
	IVA <- 0.19
	
		//Productos Disponible
	productos[1] <- "Zapatillas"
	productos[2] <- "Polera"
	productos[3] <- "Short"
	productos[4] <- "Calcetines"
	productos[5] <- "Poleron"
	
	//Mostrar Productos disponibles
	escribir "Ingrese el numero del producto que desea"
	para i <- 1 hasta 5
		escribir i, ". ", productos[i]
	FinPara
	
	//Seleccionar el productos hasta que este disponible
	
	Repetir
		Escribir "Ingrese el número del producto que desea (1 a 5):"
		Leer seleccion
		
		Si seleccion < 1 o seleccion > 5 Entonces
			Escribir "producto no disponible, Intente nuevamente."
		FinSi
	Hasta Que seleccion >= 1 y seleccion <= 5
	Escribir "Producto seleccionado: ", productos[Seleccion]
		
	Escribir "Ingrese el precio del producto"
	leer precioProducto
	
	//Aplicar cupon de descuento
	
	Escribir "¿Tiene cupón de descuento? (si/no):"
	leer tieneCupon
	
	Si tieneCupon = "si" Entonces
		porcentajeDescuento[1] <- Desc_5
		porcentajeDescuento[2] <- Desc_10
		
		Repetir
		
		Escribir "Ingrese el número del cupon de descuento: "
		Escribir "1 5%"
		Escribir "2 10%"
		leer cupon
		
		Si cupon <> 1 y cupon <> 2 Entonces
			Escribir "Ingrese un numero de cupon correcto:"
		FinSi
		Hasta que cupon = 1 o cupon = 2
		
		Si cupon = 1 o cupon = 2 entonces
			precioConDescuento <- precioProducto - (precioProducto * porcentajeDescuento[cupon])
			
			FinSi
			
	Sino precioConDescuento <- precioProducto
			
	FinSi
			
	Escribir "Ingrese la cantidad de artículos que va a comprar:"
	Leer cantidad
	
	Escribir "Ingrese el peso del paquete en kilogramos:"
	Leer peso
	
	//Seleccion de destinos
	
	destinos[1] <- "regional"
	destinos[2] <- "nacional"
	
	Escribir "Seleccione el destino de envío:"
	para i <- 1 hasta 2
		Escribir i, ". ", destinos[i]
	FinPara
	
	Repetir
		Escribir "Ingrese el número del destino (1 o 2):"
		leer seleccionDestino
		Si seleccionDestino < 1 o seleccionDestino > 2 Entonces
			Escribir "Destino no válido. Intente nuevamente."
		FinSi
	Hasta Que seleccionDestino >= 1 y seleccionDestino <= 2
	
	destino <- destinos[seleccionDestino]
	
	//Calcular descuento por cantidad
	
	descuentoCantidad <- 0
	
	Si cantidad >= 20 Entonces
		descuentoCantidad <- precioConDescuento * Desc_10
	SiNo
		Si cantidad >= 10 Entonces
			descuentoCantidad <- precioConDescuento * Desc_5
		SiNo
			descuentoCantidad <- 0
		FinSi
	FinSi
			
		//Calcular Costo de Envío
	SI destino = "regional" Entonces
		costoEnvio <- peso * 500
	SiNo
		costoEnvio <- peso * 1000
	FinSi
			
	//Calcular subtotal
	subtotal <- (precioConDescuento * cantidad) - (descuentoCantidad * cantidad) + costoEnvio
	
	//Calcular impuesto (IVA 19%)
	impuesto <- subtotal * IVA
	
	total <- subtotal + impuesto
	
	//Total de descuentos aplicados
	totalDescuento <- (precioProducto - precioConDescuento) * cantidad + (descuentoCantidad * cantidad)
	
	//Precio final del producto
	precioFinal <- precioConDescuento - descuentoCantidad
	
	//Muestro el monto total a pagar
	
	Escribir "Costo total a pagar: $", total
	
	//Solicitar al usuario que ingresa el monto a pagar
	Escribir "Ingrese el monto con el que va a pagar:"
	leer montoPago
	
	//Evaluar 
	
	Si montoPago > total Entonces
		cambio <- montoPago - total
		
		// Resumen
		Escribir"---------------------------------------"
		Escribir "Producto: ", productos[Seleccion]
		Escribir "Precio del producto: $", precioProducto
		Si tieneCupon = "si" Entonces
			Escribir "Descuento por cupón aplicado: ", porcentajeDescuento[cupon] *100, "%"
		SiNo
			Escribir "Descuento por cupón aplicado: 0%"
			
		FinSi
		Escribir "Precio con descuento por unidad: $", precioConDescuento
		Escribir "Cantidad de productos: " , cantidad
		Escribir "Descuento por cantidad total: $", descuentoCantidad * cantidad
		Escribir "Total descuentos aplicados: $", totalDescuento
		Escribir "Precio del producto final: $", precioFinal 
		Escribir "Costo de envío: $", costoEnvio
		Escribir "Subtotal: ", subtotal
		Escribir "Impuesto (IVA 19%): $", impuesto
		Escribir "Costo total a pagar: $", total
		Si montoPago > total Entonces
			Escribir "su cambio es: $", cambio
		FinSi
		Escribir"----------------------------------------"
	SiNo
		Si montoPago < total Entonces
			Escribir "No le alcanza la plata"
		SiNo
			Escribir "Monto exacto"
			
			// Resumen
			Escribir"---------------------------------------"
			Escribir "Producto: ", productos[Seleccion]
			Escribir "Precio del producto: $", precioProducto
			Si tieneCupon = "si" Entonces
				Escribir "Descuento por cupón aplicado: ", porcentajeDescuento[cupon] *100, "%"
			SiNo
				Escribir "Descuento por cupón aplicado: 0%"
				
			FinSi
			Escribir "Precio con descuento por unidad: $", precioConDescuento
			Escribir "Cantidad de productos: " , cantidad
			Escribir "Descuento por cantidad total: $", descuentoCantidad * cantidad
			Escribir "Total descuentos aplicados: $", totalDescuento
			Escribir "Precio del producto final: $", precioFinal 
			Escribir "Costo de envío: $", costoEnvio
			Escribir "Subtotal: ", subtotal
			Escribir "Impuesto (IVA 19%): $", impuesto
			Escribir "Costo total a pagar: $", total
			Escribir"----------------------------------------"
		FinSi
		
	Finsi
		
FinAlgoritmo
