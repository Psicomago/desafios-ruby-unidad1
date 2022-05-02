def numeros(n)
    fin = (n - 1)
    ciclo = 1
    n.times do |fila|
        ciclo.times do |linea|
        print "#{linea + 1}"
        end
        ciclo = ciclo + 1
        print "\n"
    end
end
n = numeros(ARGV[0].to_i)