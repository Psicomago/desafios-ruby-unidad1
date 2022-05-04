
precio = ARGV[0].to_i
n_usuarios_totales = ARGV[1].to_i
n_usuarios_premium = ARGV[2].to_i
n_usuarios_gratiutos = ARGV[3].to_i
gastos = ARGV[4].to_i

usuarios_normales = n_usuarios_totales - (n_usuarios_premium + n_usuarios_gratiutos)

utilidades = ((precio * usuarios_normales) + (precio * 2 * n_usuarios_premium)) - gastos

puts utilidades >= 0 ? utilidades * 0.65 : "Utilidades Negativas"















