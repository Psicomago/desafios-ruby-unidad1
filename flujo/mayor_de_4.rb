=begin
Se pide crear el programa mayor_de_4.rb.
● Este script debe tomar los 4 argumentos y determinar cuál es el mayor.
● Si el cuarto argumento es omitido sólo se debe calcular el mayor de 3.
¿Qué será ARGV[3] si se entregan sólo tres argumentos?
=end
#desarrollado por Carlos Aravena
n1 = ARGV[0].to_i
n2 = ARGV[1].to_i
n3 = ARGV[2].to_i
n4 = ARGV[3].to_i
m = 0
if ARGV[3].nil?
    n1 > n2 ? m = n1 : m = n2
    m = n3 if n3 > m
    puts "el mayor de 3 numeros es #{m}"
else
    n1 > n2 ? m = n1 : m = n2
    m = n3 if n3 > m
    m = n4 if n4 > m
    puts "el numero mayor de 4 numeros es #{m}"
end

