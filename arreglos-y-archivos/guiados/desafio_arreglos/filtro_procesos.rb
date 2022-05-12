=begin
Se necesita crear un programa llamado `filtro_procesos.rb` que lea un archivo que tiene
datos por línea. Estos datos representan la cantidad de milisegundos que demoran en
terminar algunos procesos del sistema operativo. Se necesita un programa que pueda leer un archivo de las mismas características y generar
un archivo llamado `procesos_filtrados.data` donde todos los valores sean mayor a un
número.
=end
require 'csv'

def filtro_procesos(punto_critico)
    data = CSV.open('procesos.data', converters: :numeric).readlines
    new_array = data.select {|x| x[0] > punto_critico}
    CSV.open("procesos_filtrados.data", "w") do |csv|
        new_array.map {|x| csv << x}
    end
end

filtro_procesos(ARGV[0].to_i)
puts "Archivo Generado procesos_filtrados.data"