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
    1.- llamado a las bibliotecas a traves de require en el principio del main
        require "uri"
        require "net/http"
        require "json"

    2.- realizar un rquerimiento a la Api, a traves de la creación del metodo request.
        response = https.request(request)
    
    3.-concatenar la ApiKey con la url de la Api. Dado que, se condicionó la presencia de
        la ApiKey en el codigo. se optó por que el usuario ingrese su api personal a traves del metodo ARGV.
        Con la ApiKey ingresada se creó una constante, la cual se concatenó con la url de la api. 

    4.- Tranformacion de la respuesta en un arreglo 
        result = JSON.parse(response.read_body)

        Para obtener un mejor rendimiento de trabajo y considerando que los datos de la api se podía ocupar en varias partes del programa. se decidió crear 2 variables globales:
        
             $data, que almacena el resultado entregado por la Api y
             $dataFilter, que almacena los datos filtrados de acuerdo a la información que se iba a utilizar
             especificamente el nombre corto de las cámaras, para las busquedas
             el nombre largo de las cámaras para la presentación de las fotografías seleccionadas 
             la fecha en que fue tomada la fotografía y el link de la imagen.
        
    5.- La odisea de entender, el como accceder a cada elemento de la información entregada por la api. 

        Está fue la mayor dificultad que encontré, dado que el json proporciona un hash que contiene un arreglo que a su vez contiene un hash que contiene 2 hash más a partir de algunos de sus elementos. 

        revisando las clases, solamente encontré que los ejemplos trabajados correspondían a hash o arreglos unidimensionales y no multidimensionales como entregó la información la Api. incluso la documentación ofrece ejemplos similares. Esto me llevó a hacer muchas pruebas, buscando acceder a un elemento en particular. 
        Los metodos escogidos, para cotejar si el codigo estaba entregando el valor que estaba buscando, fueron en ocasiones el byebug y en otras el print. 
        Finalmente logré, luego de recorrer e investigar muchas formas, entender como acceder a estas estructuras multidimensionales, que se presentan como unidimensionales y es ahí donde radica la complejidad. 

        por ejemplo, esto es parte de lo entrega la Api

        {"photos":[{"id":102693,"sol":1000,"camera":{"id":20,"name":"FHAZ","rover_id":5,"full_name":"Front Hazard Avoidance Camera"},"img_src":"http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG","earth_date":"2015-05-30","rover":{"id":5,"name":"Curiosity","landing_date":"2012-08-06","launch_date":"2011-11-26","status":"active"}},{"id":102694,"sol":1000,"camera":{"id":20,"name":"FHAZ","rover_id":5,"full_name":"Front Hazard Avoidance Camera"},"img_src":"http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FRB_486265257EDR_F0481570FHAZ00323M_.JPG","earth_date":"2015-05-30","rover":{"id":5,"name":"Curiosity","landing_date":"2012-08-06","launch_date":"2011-11-26","status":"active"}},

        como entender esta información:
        primero: tenemos un hash cuya clave es "photos". Este hash esta compuesto por un arreglo que contiene varios elementos. En esta caso puntual, la información presentada, corresponde a 2 elementos de ese arreglo de un total de 856 fotos. 
        Entonces: tomaremos el primer elemento del arreglo, que es un hash que contiene 6 pares de elementos 

        par 1 = "id":102693
        par 2 = "sol":1000
        par 3 = "camera":{"id":20,"name":"FHAZ","rover_id":5,"full_name":"Front Hazard Avoidance Camera"}
        par 4 = "img_src":"http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/ FLB_486265257EDR_F0481570FHAZ00323M_.JPG"
        par 5 = "earth_date":"2015-05-30"
        par 6 = "rover":{"id":5,"name":"Curiosity","landing_date":"2012-08-06","launch_date":"2011-11-26","status":"active"}

        como se puede observar los elementos 3 y 6 del arreglo contienen, cada uno un hash, el primero con 4 pares de elemento y el segundo con 5 pares de elementos.

            sigamos el análisis del tercer elemento del arreglo:
            
            par 3: la clave es "camera" y el valor es el hash {"id":20,"name":"FHAZ","rover_id":5,"full_name":"Front Hazard Avoidance Camera"}
                pares de elementos de hash  par 1 = "id":20
                                            par 2 = "name":"FHAZ"
                                            par 3 = "rover_id":5
                                            par 4 = "full_name":"Front Hazard Avoidance Camera"
                                            
        entonces, si queremos acceder al full_name de la cámara que tomó la fotografía, del elemento 1, ¿cómo lo hacemos? 

            primero: Toda la estructura es un hash, por tanto se accede a través de su clave, que en este caso es "photos"
            segundo: como es un arreglo, hay que acceder al elemento que deseamos a traves de un indice. en este ejemplo [1]
            tercero: como el elemento que necesitamos ocupar está dentro de un hash, debemos acceder primero a la clave del hash,
                    que sería "camera" 
            cuarto: accedemos a la clave del par que necesitamos: "full_name"

            entonces para acceder al elemento en cuestión, la consulta quedaría así:
                            ["photos"][1]["cameras"]["full_name"]

            y el resultado entregado sería:

                            Front Hazard Avoidance Camera
            
        Una vez resuelto el tema de como acceder a la información. comencé a explorar varios de los metodos vistos en clases, lo que me permitió
        descubrir y profundizar en los resultados que entregan. Antes de profundizar en ello, continuaré con el paso a paso.

    6.- Metodo build_web_pages. 
        Construir la pagina index.html, no fue dificil. La primera decisión que tomé, fue intentar hacer algo más de lo que se solicitaba en la prueba. Todo, con el animo de practicar y aprender a usar los distintos metodos.

        Como se puede leer en el enunciado, se solicita que la presentación de las imágenes sea en una lista. Lo que me parece que está bien, pero no me permitía, como yo quiero, profundizar en el lenguaje. Esto, me llevó a decidir, intentar, diseñar desde el codigo una pagina completa y con la mayor parte de sus secciones. 

        Lo primero que hice fue, determinar donde iba almacenar cada linea de codigo y decidí hacerlo en un arreglo. Luego creé el metodo para grabar ese arreglo en un archivo, el cual se ejecuta al final del metodo build_web_pages. Esto me permitió ir verificando como quedaba el index.html en la medida en que que le agregaba codigo.

        El primero metodo que escribí con codigo fue el html y el head. Aquí pobre algunas cosas, como intentar tener los cdn de boostraps etc, grabados en un archivo y solicitarlos para inluir en el index. No obstante, deseché esa opción porque agregaba mas lineas al codigo y preferí escribirlos directamente.

        Luego, comence a trabajar en presentar las imagenes en un carousel. Mientras trabajaba en ello decidí escribir toda la estructura del index que iba a ocupar. 

        Así fue como agregué un navBar, un carousel, los iconos de la nasa, y finalmente un card Group.

        La forma de trabajo que ejecuté fue de la siguiente manera:

        a) Escribir un metodo por cada sección del index,html
        b) determinar cuales de las acciones se repetían y crear un metodo que fuese llamado iterativamente.
        c) escribir toda la estructura del html, en un arreglo temporal 
        d) acceder a la información preferentemente a través de metodos ruby, mezclandolo con metodos más tradicionales
        e) agregar la información y los link de las fotografías en el carousel y card


    CONCLUSIÓN

    Realizar esta prueba, fue muy provechoso, ya que la utilicé para profundizar en cada uno de los métodos estudiados en clases. Por lo cual en alguna secciones ocupo diferentes formas de extrer la información o trabajar sobre los arreglos y los hash. 

    Entre las cosas que logré mejorar fue en la utilización de algunos metodos que permiten reducir la cantidad de lineas de codigo. 

    Por lo mismo, para contar la cantidad de fotografías tomadas con cada cámara, en vez de escribir el metodo photos_count, utilicé la siguiente linea:

        hashCam = $dataFilter.group_by{ |ele, value| ele["nameF"] }.transform_values{ |values| values.count }

        Esta linea simplifica mucho el codigo y se explica de la siguiente manera.

        a la variable global $dataFilter le aplicamos el metodo group_by el cual devuelve un hash que será almacenado en hashCam, de clase hash. 

        la conidición ingresada entre las {} es que cada elemento de $dataFilter lo agrupará por la clave "nameF" y con transform_values contará todos los elementos que se agrupen bajo cada clave y se lo asignará como valor.

        el resultado de este hash fue el nombre corto de cada cámara y la cantida de fotos que se tomaron con  ella. 

    Recuerda que debes agregar tu keyApi personal al momento de ejecutar el programa. sino la tienes puedes conseguir en la Api de la nasa. 

    


        

        





