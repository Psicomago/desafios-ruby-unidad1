=begin
Se pide crear el programa mayor_de_3.rb. Este script debe tomar los 3 argumentos y
determinar cuál es el mayor.
=end
# desarrollado por Carlos Aravena
m = 0.to_i # variable contendrá el numero mayor
puts "Programa para determinar el mayor de 3 numeros"
n1 = ARGV[0].to_i
n2 = ARGV[1].to_i
n3 = ARGV[2].to_i
#/ sintaxis ruby
n1 > n2 ? m = n1 : m = n2
m = n3 if n3 > m
puts "el numero mayor es #{m}"