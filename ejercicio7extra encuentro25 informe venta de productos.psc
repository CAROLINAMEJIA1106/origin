//Una empresa de venta de productos por correo desea realizar una estadística de las ventas
//realizadas de cada uno de sus productos a lo largo de una semana. Distribuya luego 5
//productos en los 5 días hábiles de la semana. Se desea conocer:
//	a) Total de ventas por cada día de la semana.
//	b) Total de ventas de cada producto a lo largo de la semana.
//	c) El producto más vendido en cada semana.
//	d) El nombre, el día de la semana y la cantidad del producto más vendido.
//El informe final tendrá un formato como el que se muestra a continuación:


Algoritmo ejercicio7extraencuentro25
	
	definir nombreempresa como cadena
	
	ESCRIBIR " "
	escribir "   ESTADISTICA DE VENTAS SEMANALES DE PRODUCTOS POR CORREO"
	Escribir "  ********************************************************"
	Escribir "EMPRESA: " Sin Saltar
	leer nombreempresa
	nombreempresa=Mayusculas(nombreempresa)
	
	diligenciarmatriz(nombreempresa)
	
FinAlgoritmo

SubProceso diligenciarmatriz(nombreempresa)
	definir i,j,k Como Entero
	definir vectorproducto, vectordia como cadena
	definir matriz como real
	Dimension matriz(7,6), vectorproducto(7), vectordia(7)
	
	//Nombre de productos
	escribir "Por favor diligencie la lista de los 5 productos a analizar:"
	Para i=0 Hasta 4 Con Paso 1 Hacer
		leer vectorproducto(i)
	Fin Para
	vectorproducto(5) = "Total semana"
	vectorproducto(6) = "Producto más vendido"
	
	//Diligenciamiento de vector día
	vectordia(0) = "PRODUCTOS/DIAS"
	vectordia(1) = "LUNES"
	vectordia(2) = "MARTES"
	vectordia(3) = "MIÉRCOLES"
	vectordia(4) = "JUEVES"
	vectordia(5) = "VIERNES"
	vectordia(6) = "Total producto"
	
	//Datos de las Ventas de los productos
	escribir "Por favor ingrese los valores de ventas de cada producto por día de la semana: "
	k=1
	Para i=0 Hasta 4 Con Paso 1 Hacer
		Para j=0 Hasta 4 Con Paso 1 Hacer
			escribir " ", vectorproducto(i) " :las ventas totales del día ", vectordia(k) " fueron: " Sin Saltar
			leer matriz(i,j)
			k = k+1
		Fin Para
		k=1
	Fin Para
	
	totalesproductos(vectordia,vectorproducto,matriz)
	
FinSubProceso

SubProceso totalesproductos(vectordia,vectorproducto,matriz)
	definir i,j, cont Como Entero
	definir suma,suma1, mayor, sumatotalsemana Como Real
	
	//sumatoria para generar el total de productos y el total de semana
	suma = 0
	suma1=0
	sumatotalsemana = 0
	Para i=0 Hasta 4 Con Paso 1 Hacer
		Para j=0 Hasta 4 Con Paso 1 Hacer
			suma = suma + matriz(i,j) 
			suma1 = suma1 + matriz(j,i)
		Fin Para
		matriz(i,5) = suma
		matriz(5,i) = suma1
		sumatotalsemana = sumatotalsemana + matriz(5,i)
		suma = 0
		suma1 = 0
	Fin Para
	matriz(5,5) = sumatotalsemana
	
	//producto más vendido por día
	mayor = 0
	cont = 0
	Para i=0 Hasta 4 Con Paso 1 Hacer
		Para j=0 Hasta 4 Con Paso 1 Hacer
			Si matriz(j,i) >= mayor Entonces
				mayor = matriz(j,i)
				
			Fin Si
		Fin Para
		matriz(6,i) = mayor
		mayor = 0
	Fin Para
	
	//producto más vendido en la semana
	mayor = 0
	Para i=0 Hasta 4 Con Paso 1 Hacer
		Si matriz(6,i) >= mayor Entonces
			mayor = matriz(6,i)
		FinSi
	Fin Para
	matriz(6,5) = mayor
	
	mostrarinforme(matriz,vectordia,vectorproducto)
		
FinSubProceso

SubProceso mostrarinforme(matriz,vectordia,vectorproducto)
	definir i,j,k Como Entero
	
	Para k=0 Hasta 6 Con Paso 1 Hacer
		Si k=0 Entonces
			escribir "[ " vectordia(k) " ]" Sin Saltar
		SiNo
			escribir "       [ " vectordia(k) " ]" Sin Saltar
		FinSi
		
		
	Fin Para
	escribir " "
	Para i=0 Hasta 6 Con Paso 1 Hacer
		Para j=0 Hasta 5 Con Paso 1 Hacer
			Si j=0 Entonces
				escribir " ", vectorproducto(i) Sin Saltar
			FinSi
			Si j = 0 Entonces
				escribir "                  [ " matriz(i,j) "   ]" Sin Saltar
			FinSi
			Si j= 5 Entonces
				escribir "                    [ " matriz(i,j) "   ]" Sin Saltar
			FinSi
			Si j<> 0 y j <> 5 Entonces
				escribir "              [ " matriz(i,j) "    ]" Sin Saltar
			FinSi
		Fin Para
		escribir " "
	Fin Para
	
	k = 1
	ESCRIBIR " "
	ESCRIBIR " "
	Para i=0 Hasta 4 Con Paso 1 Hacer
		Para j=0 Hasta 4 Con Paso 1 Hacer
			Si matriz(j,i) = matriz(6,5) Entonces
				ESCRIBIR "El producto más vendido en la semana fue: ", vectorproducto(j)
				ESCRIBIR "El día de la semana que más se vendió este producto fue: ", vectordia(k)
				ESCRIBIR "La cantidad del producto más vendido fue: ", matriz(6,5)
				
			Fin Si
			
		Fin Para
		k = k + 1
	Fin Para
	
	
	
FinSubProceso
	