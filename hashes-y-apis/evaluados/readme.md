PRUEBA DE PROGRAMACIÓN INTRODUCCIÓN A RUBY Desarrollado por Carlos Aravena

DESCRIPCIÓN DE ESTE README

Este readme describe el proceso de desarrollo de la prueba de introducción a ruby,
es un paso a paso, que describe los desafíos y dificultades encontradas, y como se resolvieron.

PRESENTACION DEL PROBLEMA

En este desafío nos conectaremos a la API de la NASA para descargar fotos de los Rovers y
filtrar resultados acorde a lo pedido.

    REQUERIMIENTOS :

    1. Crear el método request que reciba una url y el api_key y devuelva el hash con los
        resultados.
        Concatenar la API Key en la siguiente url
        https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key
        =DEMO_KEY
    2. Crear un método llamado buid_web_page que reciba el hash de respuesta con todos
        los datos y construya una página web. Se evaluará la página creada y tiene que tener
        este formato:
        <html>
        <head>
        </head>
        <body>
        _ 1
        www.desafiolatam.com
        <ul>
        <li><img src='.../398380645PRCLF0030000CC AM04010L1.PNG'></li>
        <li><img src='.../398381687EDR_F0030000CCAM05010M_.JPG'></li>
        </ul>
        </body>
        </html>
    Se revisará la estructura del documento generado.
    3. Pregunta bonus: Crear un método photos_count que reciba el hash de respuesta y
        devuelva un nuevo hash con el nombre de la cámara y la cantidad de fotos.

PASO 1 Crear Metodo request

Establecer la conexion a  la Api, no presentó mayor problema. Se revisó en la web, diferentes formas de conectarse, para complementar lo presentado en clases. No obstante se utilizó el metodo propuesto por el curso. 

Los aprendizajes alcanzados fueron:
    1.- llamado a las bibliotecas a traves de require en el main
        require "uri"
        require "net/http"
        require "json"

    2.- realizar un rquerimiento a la Api, a traves de la creación del metodo request.
        response = https.request(request)
    
    3.-concatenar la ApiKey con la url de la Api. Dado que, se condicionó la presencia de
        la ApiKey en el codigo. se optó por la utilización de la persistencia 

    4.- Tranformacion de la respuesta en un arreglo 
        result = JSON.parse(response.read_body)


No obstante, frente al requerimiento de no incluir la API Key en el codigo 



