=begin
  Crear un programa llamado busqueda.rb que pueda buscar a que mes pertenece una o más
  cifras específicas. En caso de no encontrarlo mostrar el mensaje "no encontrado".
=end
require 'byebug'
def busqueda(hash,listSearch)
  print hash
  newArray = []
  listSearch.each do |element|
    byebug
    if hash[value].include? (element)
      newArray.push hash[key]
    end
      newArray.push "no encontrado"
  end
  newArray
end
# hash.select {|key,value| arreglo.include?(value)}
# hash.each do |key,value|
#   if hash
# end

ventas = {
  Enero: 15000,
  Febrero: 22000,
  Marzo: 12000,
  Abril: 17000,
  Mayo: 81000,
  Junio: 13000,
  Julio: 21000,
  Agosto: 41200,
  Septiembre: 25000,
  Octubre: 21500,
  Noviembre: 91000,
  Diciembre: 21000
}

arraySearch = ARGV.map {|x| x.to_i}
puts busqueda(ventas, arraySearch)