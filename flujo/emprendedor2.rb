=begin
● 2.2) Crear el programa emprendedor2.rb para obtener el cálculo de las utilidades,
donde el usuario ingrese previamente los siguientes datos:
○ Precio.
○ Número de usuarios totales.
○ Número de usuarios premium (pagan el doble).
○ Número de usuarios gratuitos (no pagan).
○ Gastos.
=end
# desarrollado por Carlos Aravena
precio = ARGV[0].to_i
n_usuarios_totales = ARGV[1].to_i
n_usuarios_premium = ARGV[2].to_i
n_usuarios_gratiutos = ARGV[3].to_i
gastos = ARGV[4].to_i
#calculo de usuarios normales
usuarios_normales = n_usuarios_totales - (n_usuarios_premium + n_usuarios_gratiutos)
#calculo de utilidades brutas
utilidades = (((precio * usuarios_normales) + (precio * 2 * n_usuarios_premium)) - gastos)
if utilidades > 0
    impuestos = utilidades * 0.35 #calculo de impuestos
    utilidad_neta = utilidades - impuestos #calculo de utilidades - impuestos
    puts "utilidad imponibles serán $ #{utilidades}" 
    puts "el impuesto a pagar será $ #{impuestos}"
    puts "tus utilidades netas serán $ #{utilidad_neta}"
else
    if utilidades == 0  
        puts "no hubo utilidades" 
    else
        puts "utilidades negativas"
    end
end















