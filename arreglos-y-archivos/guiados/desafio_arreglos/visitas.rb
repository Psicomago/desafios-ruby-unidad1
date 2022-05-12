#visitas = [1000, 800, 250, 300, 500, 2500]
#Crear un método llamado promedio que devuelva la cantidad promedio de visitas en el arreglo.
def promedio(array)
    array.each do |num|
        suma += num
    end
    (suma.to_f / array.count).truncate (2)
end

def promedio_fast(array)
    (array.sum.to_f / array.count).truncate(2)
end

puts promedio = ([1000, 800, 250, 300, 500, 2500])

puts promedio_fast = ([1000, 800, 250, 300, 500, 2500])
