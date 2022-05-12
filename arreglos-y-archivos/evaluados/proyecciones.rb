=begin
El desafío consiste en hacer 2 simulaciones.
● Las ventas totales del primer semestre, dado que en la primera mitad del semestre se vende un 10% más.
● Las ventas totales del segundo semestre, dado que en la segunda mitad del semestre se vende un 20% más.
El resultado debe ser presentado en un archivo llamado resultados.data. Los datos deben
contener máximo 2 decimales y estar cada uno en una sola línea.
=end

# Desarrollado por Carlos Aravena 
# Aprovecho de practicas 

#metodo para abrir el archivo
def readFile (file)
    data = open(file).read.chomp.split(",")
    return data
end

#metodo para calcular la proyección de venta 
def proyeccion_venta(dataArray,aumento,mesInicio,mesFin)
    #en la linea 14 se seleccionan los elementos correspondientes al semestre  y se convierten cada elemento a integer
    dataSelect = dataArray.select.with_index{ |e, ind| ind >= mesInicio - 1 && ind <= mesFin - 1}.map{ |e| e.to_i}
    # con el metodo map se hace la proyeccion de venta (aumento de acuerdo al porcentaje) según el semestre indicado
    dataProyection = dataSelect.map{ |item| (item + item * aumento / 100.to_f).truncate(2)}
    return dataProyection
end

#metodo para grabar las proyecciones en un archivo nuevo
def saveFile (file2,first,second)
    dataFinal = first + second
    file = open(file2, "w")
        file.write(dataFinal)
end

#inicia variable
proyection = 10
indIni = 1 #enero
indFin = 6 #Junio
file = 'ventas_base.db'
file2 = 'resultados.data'


#llamar metodos

#metodo abrir archivo
dataFile = readFile (file)
dataFirst = proyeccion_venta(dataFile,proyection,indIni,indFin) # llama a metodo para proyeccion primer semestre
#reinicia variables
indIni = 7 #julio
indFin = 12 #diciembre
proyection = 20
dataSecond = proyeccion_venta(dataFile,proyection,indIni,indFin) # llama metodo para proyeccion segundo semestre
saveFile(file2,dataFirst,dataSecond) #llama metodo para crear archivo nuevo




