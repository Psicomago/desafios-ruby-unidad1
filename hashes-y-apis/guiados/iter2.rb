=begin
Crear el programa iter2.rb que itere el hash ventas y muestre en pantalla todos los meses
cuyas ventas sean superiores a 45000.
=end
def filterHash(hash, numFilter)
    array = []
    hash.each do |key,value|
      array.push(key) if value > numFilter
    end
    array
  end
  
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
  
      puts filterHash(ventas,45000)
  
      