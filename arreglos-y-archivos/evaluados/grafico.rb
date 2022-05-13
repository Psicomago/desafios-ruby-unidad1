=begin
Crear el archivo grafico.rb utilizando el método chart, que construya el siguiente gráfico
en la consola, a partir de un arreglo con datos numéricos.
=end
require 'byebug'
# metodo requerido para dibujar el grafico
def chart(array)
    numMax = array.max() # asigna el valor maximo del arreglo
    array.count.times do |i| #ciclo que recorre los elementos del arreglo
        print "|"
        chr = "*"
        nLaps = calcLaps(array[i]) # asigna a variable nLaps retorno del metodo calcLaps(calcula cantidad de chr a dibujar)
        drawLine(nLaps, chr) #metodo dibuja la linea
        print "\n"
    end
    print ">"
    chr = "-"
    nLaps = calcLaps(numMax) # asigna a variable nLaps retorno del metodo calcLaps
    drawLine(nLaps, chr) #llama metodo que dibuja los char en cada linea
    print "\n"
    print " "
    #en este ciclo se agregan los numeros
    (numMax).times do |i|
        if i > numMax
            print " #{i + 1}"
        else
            print "#{i + 1} " 
        end
    end
end

#metodo que dibuja cada linea
def drawLine(nTimes, char)
    nTimes.times do |ind|
        print char
    end
end

#metodo que calcula la cantidad de char a dibujar
def calcLaps (nFila)
    if nFila > 10
        nRow = nFila - 10
        laps = nFila * 2 + nRow
    else 
        
        laps = nFila * 2
    end
    return laps
end
#main
workArray = [5, 3, 2, 5, 10]
chart(workArray)