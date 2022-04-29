=begin
Se pide crear el programa juego.rb, donde el usuario pasará como argumento piedra, papel
o tijera, y el programa escogerá una opción al azar.
=end
#iniciacion de variables
valcompu = "vacio"
jugador = 3 .to_i
compu = 3 .to_i
juego = ARGV[0].downcase #transforma el argumento ingrersado en minusculas
compu = rand(0..2).to_i
# transformación de var juego en numero para evaluación de posibilidades
jugador = 0 if juego == "piedra"
jugador = 1 if juego == "papel"
jugador = 2 if juego == "tijera"
# transformación de var compu en palabra // contiene opcion de juego de computador
valcompu = "piedra" if compu == 0
valcompu = "papel" if compu == 1
valcompu = "tijera" if compu == 2
#calculo posiblidades
if jugador >= 0 && jugador <= 2 
    puts "computador juega #{valcompu}"
    if jugador == compu
        puts "empataste"
    else
        if ((jugador == 1 && compu == 0) || (jugador == 2 && compu == 1) || (jugador == 0 && compu == 2))
            puts "ganaste" 
        else
            puts "perdiste" 
        end
    end
else 
    puts "Argumento invalido debe ser piedra, papel o tijera"
end