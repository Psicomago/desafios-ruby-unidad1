=begin
Crear un método llamado nota_mas_alta dentro del archivo calculo_notas.rb que
reciba un arreglo con el nombre y notas del alumno y devuelva la nota más alta.
Ejemplos:
○ nota_mas_alta(data[0]) => 9.
○ nota_mas_alta(data[1]) => 8.
=end

require 'byebug'# 
#metodo para abrir el archivo
def readFile(file)
    data = open(file).readlines #data almacena los elementos del archivo como, un arreglo con elementos como string
    arrayFile = data.map!{ |e| e.chomp.split(",")} #convierte cada elemento del arreglo, en un arreglo 
    return arrayFile
end

def nota_mas_alta(dataArray)
    notaMasAlta = dataArray.max()
    return notaMasAlta
end

#main
file = 'notas.data'
dataFile = readFile(file) # metodo abrir achivo convertido
dataFile.count.times do |fila|
    arrayInterno = dataFile[fila].map{ |e| e.to_i} #convierte los string a integer
    notaMax = nota_mas_alta(arrayInterno)
    print "La nota más alta de #{dataFile[fila][0]} es #{notaMax} \n" # probar output
end


