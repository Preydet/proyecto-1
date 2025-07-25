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
	IVA <- 0.19
	
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
	
	//Seleccionar el productos hasta que este disponible
	
	Repetir
		Escribir "Ingrese el n�mero del producto que desea (1 a 5):"
		Leer seleccion
		
		Si seleccion < 1 o seleccion > 5 Entonces
			Escribir "producto no disponible, Intente nuevamente."
		FinSi
	Hasta Que seleccion >= 1 y seleccion <= 5
	Escribir "Producto seleccionado: ", productos[Seleccion]
		
	Escribir "Ingrese el precio del producto"
	leer precioProducto
	
	//Aplicar cupon de descuento
	
	Escribir "�Tiene cup�n de descuento? (si/no):"
	leer tieneCupon
	
	Si tieneCupon = "si" Entonces
		porcentajeDescuento[1] <- Desc_5
		porcentajeDescuento[2] <- Desc_10
		
		Repetir
		
		Escribir "Ingrese el n�mero del cupon de descuento: "
		Escribir "1. 5%"
		Escribir "2. 10%"
		leer cupon
		
		Si cupon <> 1 o cupon <> 2 Entonces
			Escribir "Ingrese un numero de cupon correcto:"
		FinSi
		Hasta que cupon = 1 o cupon =2
		
		Si cupon = 1 o cupon = 2 entonces
			precioConDescuento <- precioProducto - (precioProducto * porcentajeDescuento[cupon])
			
						
		FinSi
				
	FinSi
	
		
	Escribir "Ingrese la cantidad de art�culos que va a comprar:"
	Leer cantidad
	
	Escribir "Ingrese el peso del paquete en kilogramos:"
	Leer peso
	
	Escribir "Ingrese el destino (Regional o Nacional:)"
	Leer destino
			
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
	
	//Total descuento
	
	totalDescuento <- (precioProducto - precioConDescuento) + descuentoCantidad
	
		//Calcular Costo de Env�o
	Si destino = "Regional" Entonces
		costoEnvio <- peso * 500
	SiNo
		si destino = "Nacional" Entonces
			costoEnvio <- peso * 1000
		SiNo
			Escribir "Destino Inv�lido. Asignando env�o nacional por defecto"
			costoEnvio <- peso * 1000
		FinSi
	FinSi
			
	//Calcular subtotal
	subtotal <- ((totalDescuento) * cantidad) + costoEnvio
	
	//Calcular impuesto (IVA 19%)
	impuesto <- subtotal * IVA
	
	total <- subtotal + impuesto
	
	
	totalDescuento <- (precioProducto * cantidad) - subtotal
	
	// Detalle
	Escribir"---------------------------------------"
	Escribir "Producto: ", productos[Seleccion]
	Escribir "Precio del producto: $", precioProducto
	Si tieneCupon = "Si" Entonces
		Escribir "Descuento por cup�n aplicado: ", porcentajeDescuento[cupon] *100, "%"
	SiNo
		Escribir "Descuento por cup�n aplicado: 0%"
		
	FinSi
		Escribir "Precio con descuento por unidad: $", precioConDescuento
	Escribir "Cantidad de productos: " , cantidad
	Escribir "Descuento por cantidad total: $", descuentoCantidad * cantidad
	Escribir "Total descuentos aplicados: ", totalDescuento
	Escribir "Costo de env�o: $", costoEnvio
	Escribir "Subtotal: ", subtotal
	Escribir "Impuesto (IVA 19%): $", impuesto
	Escribir "Costo total a pagar: $", total
	
	
	
FinAlgoritmo
