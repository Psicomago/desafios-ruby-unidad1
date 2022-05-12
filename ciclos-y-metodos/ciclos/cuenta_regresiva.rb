=begin
En el siguiente código, reemplaza la instrucción until por while dentro del programa llamado cuenta_regresiva.rb.
La impresión debe ser la misma:
puts 'Ingrese un número para comenzar la cuenta:'
cuenta_regresiva = ARGV[0].to_i
puts "Contando desde #{cuenta_regresiva}..."
until cuenta_regresiva < 0
puts cuenta_regresiva
cuenta_regresiva -= 1
end
=end
puts 'Ingrese un número para comenzar la cuenta:'
cuenta_regresiva = ARGV[0].to_i
puts "Contando desde #{cuenta_regresiva}..."
while cuenta_regresiva >= 0
    puts cuenta_regresiva
    cuenta_regresiva -= 1
end