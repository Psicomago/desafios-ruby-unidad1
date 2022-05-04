# A. metodo letra_o
def letra_o(n)
    fin = (n - 1)
    n.times do |fila|
        if fila == 0 || fila == (fin)
            n.times do |linea|
                print "*"
            end
            print "\n"
        else
            print "*"
            (n - 2).times do |x|
                print " "
            end
            print "*"
            print "\n"
        end
    end
end

#metodo letra I
def letra_i(n)
    n += 1 if n.even? #en caso de que el argumento sea para, agregamos 1 a n para respetar simetria
    fin = (n - 1)
    centro = (n/2).to_i
    n.times do |fila|
        if fila == 0 || fila == (fin)
            n.times do |linea|
                print "*"
            end
            print "\n"
        else
            (n-2).times do |x|
                if x == (centro)
                   print "*"
                else
                    print " "
                end
            end
            print "\n"
        end
    end
end
#metodo letra z
def letra_z(n)
    fin = (n - 1)
    inverso = (n-2).to_i
    n.times do |fila| # este ciclo imprime la primera y última linea
        if fila == 0 || fila == (fin)
            n.times do |linea|
                print "*"
            end
            print "\n"
        else
            n.times do |x| # este ciclo imprime las lineas intermedias
                if x == inverso
                   print "*"
                else
                    print " "
                end
            end
            inverso = inverso - 1
            print "\n"
        end
    end
end
#metodo letra x
def letra_x(n)
    n += 1 if n.even? #en caso de que el argumento sea para, agregamos 1 a n para respetar simetria
    centro = (n/2).to_i #solo tomamos la parte entera
    final = n - 1
    n.times do |fila|
        n.times do |x|
            if x == centro && final == centro #evalua si ambas variables, de control, son iguales al centro. Para evitar duplicado
                print "*"
                final = final - 1
            else
                if fila == x 
                    print "*"
                else
                    if x == final 
                        print "*"
                        final = final -1
                    else
                        print " "
                    end
                end
            end
        end
        print "\n"
    end
end
#metodo numero 0
def numero_0(n)
    fin = (n - 1)
    n.times do |fila|
        if fila == 0 || fila == (fin)
            n.times do |linea|
                print "*"
            end
            print "\n"
        else
            print "*"
            (n - 2).times do |x|
                if fila == x + 1
                    print "*"
                else
                    print " "
                end
            end
            print "*"
            print "\n"
        end
    end
end
#metodo navidad
def navidad(n)
    n += 1 if n.even? #en caso de que el argumento sea para, agregamos 1 a n para respetar simetria
    centro = (n / 2).to_i
    mitadsup = centro + 1
    mitadinf = n - mitadsup
    eje_y_izq = centro
    eje_y_der = centro
    asterisco = eje_y_izq
    mitadsup.times do |fila|
        #mitad superior
        asterisco = eje_y_izq
        (n).times do |x|
            if ((eje_y_izq == eje_y_der) && (x == eje_y_izq && x == eje_y_der))
               print "*"
            else
                if x == asterisco && asterisco <= eje_y_der
                    print "*"
                    asterisco += 2
                else
                    print " "
                end
            end
        end
        eje_y_izq -= 1
        eje_y_der += 1
        print "\n"
    end
    #mitad inferior
    mitadinf.times do |fila|
        #eje_y_izq = (centro / 2).to_i
        if centro.even?
            if n == 5
                eje_y_izq = 1
                eje_y_der = (n - 1)
            else
                eje_y_izq = 2
                eje_y_der = (n - 2)
            end
        else
            eje_y_izq = 1
            eje_y_der = (n-1)
        end
        n.times do |x|
            if fila == (mitadinf - 1) 
                if x == eje_y_izq && x <= eje_y_der 
                    print "*"
                    eje_y_izq += 2
                else
                    print " "
                end
            else
                if x == centro
                    print "*"
                else
                    print " "
                end
            end
        end
        print "\n"
    end
end

n = letra_o(ARGV[0].to_i)
n = letra_i(ARGV[0].to_i)
n = letra_z(ARGV[0].to_i)
n = letra_x(ARGV[0].to_i)
n = numero_0(ARGV[0].to_i)
n = navidad(ARGV[0].to_i)
