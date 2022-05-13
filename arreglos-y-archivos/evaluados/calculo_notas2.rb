=begin
Se pide:
● Crear un archivo llamado calculo_notas2.rb.
● Crear un método llamado notas_mas_alta dentro del archivo calculo_notas2.rb,
que reciba un arreglo, con los nombres y notas de los alumnos, y devuelva un arreglo
que contenga solo las notas más alta de cada alumno.
=end

#desarrollado por Carlos Aravena
require 'byebug'# 
#metodo para abrir el archivo
def readFile(file)
    data = open(file).readlines #data almacena los elementos del archivo como, un arreglo con elementos como string
    return data
end

def notas_mas_alta(dataArray)
    arrayNew = []
    dataArray.map!{ |e| e.chomp.split(",")} #convierte cada elemento del arreglo, en un arreglo 
    dataArray.count.times do |fila|
        nombre = dataArray[fila][0] #asigna elemento nombre a nombre
        notaMax = dataArray[fila].map!{ |e| e.to_i} #convierte los string a integer
        arrayNew.push([nombre, notaMax.max()]) #asigna nombre y nota maxima, como un arreglo a un elemento del nuevo arreglo
    end
    return arrayNew
end

#iniciar variables
file = 'notas.data'
#llamar metodos
dataFile = readFile(file)
arrayEnd = notas_mas_alta(dataFile)
#probar output - entrega lo que se grabó en el archivo
print arrayEnd