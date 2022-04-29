=begin 
    Un emprendedor quiere crear una aplicación y necesita saber si es rentable, para eso tiene
    que:
    ● El producto planea venderse en 50 dólares.
    ● Se espera tener 1000 usuarios al año.
    ● Los gastos del año son 20000 dólares.
    ● Las utilidades se calculan como : 𝑝𝑟𝑒𝑐𝑖𝑜_ 𝑣𝑒𝑛𝑡𝑎𝑠 * 𝑢𝑠𝑢𝑎𝑟𝑖𝑜𝑠 − 𝑔𝑎𝑠𝑡𝑜𝑠
    ● Los impuestos aplicados a las utilidades son el 35% y solo aplican si es positivo.
    Utilizando ARGV en lugar de gets:
    ● 2.1) Crear el programa emprendedor1.rb donde el usuario ingrese el precio, el
    número de usuarios, los gastos y el programa calcula las utilidades.
=end
#desarrillado por Carlos Aravena
 
precio = ARGV[0].to_i
cantidad = ARGV[1].to_i
gastos = ARGV[2].to_i
utilidades = (precio * cantidad) - gastos
if utilidades > 0
    impuestos = utilidades * 0.35
    utilidad_neta = utilidades - impuestos
    puts "utilidad imponibles serán $ #{utilidades}" 
    puts "el impuesto a pagar será $ #{impuestos}"
    puts "tus utilidades netas serán $ #{utilidad_neta}"
else 
    if utilidades == 0
        puts "SIN ULTILIDADES"
    else
        puts "UTILIDADES"
    end
end
