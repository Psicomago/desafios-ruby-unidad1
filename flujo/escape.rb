=begin
Se pide crear el programa escape.rb donde el usuario ingrese la gravedad y el radio, y como
resultado obtenga la velocidad de escape (ocupar la fórmula).
=end
#desarrollado por Carlos Aravena
g = ARGV[0].to_f 
r = ARGV[1].to_f
rmetros = r * 1000 # conversión de km en mts
ve = Math.sqrt(2 * g * rmetros)
puts "velocidad de escape es #{ve.round(1)} mts/seg"