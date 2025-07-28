🧮 Algoritmo: Calculadora de Costos

📋 Descripción
Este algoritmo permite calcular el costo total de una compra, considerando:
- Precio del producto
- Cantidad de artículos
- Cupón de descuento (opcional)
- Descuento por cantidad comprada
- Costo de envío según destino
- Impuesto (IVA 19%)
- Monto pagado y cálculo de cambio

También genera un resumen con todos los detalles de la compra.

🛍️ Productos disponibles
El usuario puede elegir entre los siguientes productos:
1. Zapatillas
2. Polera
3. Short
4. Calcetines
5. Polerón

⚠️ El precio de cada producto es ingresado manualmente por el usuario.

🧾 Funcionalidades
- ✅ Aplicación de cupones (5% o 10%)
- ✅ Descuentos por cantidad (5% para ≥10 unidades, 10% para ≥20 unidades)
- ✅ Cálculo automático de envío:
  - Regional: $500 por kg
  - Nacional: $1000 por kg
- ✅ Cálculo del IVA (19%)
- ✅ Verificación de monto pagado (cambio o advertencia si no alcanza)
- ✅ Resumen final con desglose de costos

⚙️ Entradas requeridas
- Número del producto (1 al 5)
- Precio del producto
- Cupón (opcional)
- Cantidad de productos
- Peso del paquete
- Tipo de destino (regional o nacional)
- Monto con el que se pagará

🧮 Fórmulas utilizadas
- precioConDescuento = precioProducto - (precioProducto * descuento_cupon)
- descuentoCantidad = precioConDescuento * 0.05 o 0.10 (según cantidad)
- subtotal = (precioConDescuento * cantidad) - (descuentoCantidad * cantidad) + costoEnvio
- impuesto = subtotal * 0.19
- total = subtotal + impuesto
- totalDescuento = descuento por cupón + descuento por cantidad
- precioFinal = precioConDescuento - descuentoCantidad

📦 Salidas del programa
- Producto seleccionado
- Precio original y con descuento
- Cantidad y peso
- Descuentos aplicados
- Subtotal, impuesto, total
- Cambio o aviso si no alcanza el dinero
