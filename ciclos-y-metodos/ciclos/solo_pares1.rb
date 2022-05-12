=begin
Crea un programa llamado solo_pares.rb que muestre los primeros n números pares,
donde n es ingresado por el usuario.
=end

def solo_pares(npares)
    print "primeros #{npares}: incluye el 0: "
    npares.times do |i|
        print "#{i} " if i.even?
    end
end
puts "ingrese la cantidad de los primeros numeros pares que quiere visualizar"
num = gets.chomp
solo_pares(num)