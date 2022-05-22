require "uri"
require "net/http"
require "json"
require "byebug"

def request(urlRequest, keyRequest)
  url = URI(urlRequest + keyRequest)
  https = Net::HTTP.new(url.host, url.port)
  https.verify_mode = OpenSSL::SSL::VERIFY_PEER
  https.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request[keyRequest] = ""

  response = https.request(request)
  result = JSON.parse(response.read_body.to_s)
end

# obtiene asigna apiKey del usuario
def keyRequest(apiKeySecret)
  passKey = apiKeySecret
end

#construye la pagina index.html
def build_web_pages
  pagesIndex = []
  pagesIndex = build_Html #asigna el resultado del método build_html a pagesIndex
  pagesIndex = build_Head(pagesIndex) #asigna a pages index el retorno del metodo buildHead
  pagesIndex = build_Body(pagesIndex) #asigna a pages index el retorno del metodo buildBody
  build_Index(pagesIndex) #
  return pagesIndex
end
def build_Html
  htmlArrays = Array.new
  htmlArrays.push("<!DOCTYPE html>")
  htmlArrays.push('<html lang="en">')
  return htmlArrays
end

#Construye el head tradicional
def build_Head(headArrays)
  headArrays.push("<head>")
  headArrays.push("\s\s<meta charset=\"UTF-8\">")
  headArrays.push("\s\s<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">")
  headArrays.push("\s\s<meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">")
  headArrays.push("\s\s<meta name=\"Description\" content=\"Enter your description here\"/>")
  headArrays.push("\s\s<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/css/bootstrap.min.css\">")
  headArrays.push("\s\s<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\">")
  headArrays.push("\s\s<link rel=\"stylesheet\" href=\"assets/css/styles.css\">")
  headArrays.push("\s\s<link rel=\"icon\" href=\"https://www.nasa.gov/sites/all/themes/custom/nasatwo/images/nasa-logo.svg\">")
  headArrays.push("\s\s<title>Api-Nasa</title>")
  headArrays.push("</head>")
end

#construye el body del htmal
def build_Body(bodyArrays)
  bodyArrays.push("<body class=\"bg-dark\">")
  bodyArrays = build_Header(bodyArrays)
  bodyArrays = build_Main(bodyArrays)
  bodyrArrays = build_Footer(bodyArrays)
  bodyArrays.push("</body>")
  bodyArrays.push("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>")
  bodyArrays.push("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js\"></script>")
  bodyArrays.push("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/js/bootstrap.min.js\"></script>")
end

#constuye el header de la pagina
def build_Header(headerArrays)
  headerArrays.push("\s\s<header class=\"bg-dark\">")
  build_Navbar(headerArrays)
  # headerArrays.push("\s\s<a>")
  # headerArrays.push("\s\s\s\s<img src=\"https://www.nasa.gov/sites/all/themes/custom/nasatwo/images/nasa-logo.svg\" alt=\"\" width=\"53\" height=\"100\">")
  # headerArrays.push("\s\s\s\s<h1 class=\"text-white bg-dark text-center d-inline\">FOTOGRAFÍAS API NASA</h1>")
  # headerArrays.push("\s\s</a>")
  headerArrays.push("\s\s</header>")
end

def build_Navbar(navbarArrays)
  navbarArrays.push("\s\s\s\s<nav class=\"navbar navbar-light bg-transparent fixed-top\">")
  navbarArrays.push("\s\s\s\s\s\s<div class=\"container-fluid px-5\">")
  navbarArrays.push("\s\s\s\s\s\s\s\s<div class=\"d-inline\">")
  navbarArrays.push("\s\s\s\s\s\s\s\s\s\s<a class=\"navbar-brand text-white fs-6\" href=\"#\">")
  navbarArrays.push("\s\s\s\s\s\s\s\s\s\s\s\s<img src=\"https://www.nasa.gov/sites/all/themes/custom/nasatwo/images/nasa-logo.svg\" alt=\"\" width=\"auto\" height=\"24\" class=\"d-inline align-text-top\"> Api Nasa")
  navbarArrays.push("\s\s\s\s\s\s\s\s\s\s</a>")
  navbarArrays.push("\s\s\s\s\s\s\s\s</div>")
      #<!-- botones menú -->
      # <div class="d-inline">
      #   <ul class="nav justify-content-end">
      #     <li class="nav-item">
      #       <a class="nav-link active text-white" aria-current="page" href="#">Inicio</a>
      #     </li>
      #     <li class="nav-item d-none d-md-block">
      #       <a class="nav-link text-white" href="#quienes_somos">Quienes Somos</a>
      #     </li>
      #     <li class="nav-item">
      #       <a class="nav-link text-white" href="#destacados">Destacados</a>
      #     </li>
      #     <li class="nav-item">
      #       <a class="nav-link text-white" href="#contacto">Contacto</a>
      #     </li>
      #   </ul>
      # </div>
  navbarArrays.push("\s\s\s\s\s\s</div>")
  navbarArrays.push("\s\s\s\s</nav>")
end

#Construye el main del html
def build_Main(mainArrays)
  mainArrays.push("\s\s<main>")
  mainArrays.push("\s\s\s\s<section>")
  build_Carousel(mainArrays) #llama al método que construye al carrousel 
  mainArrays.push("\s\s\s\s</section>")
  mainArrays.push("\s\s</main>")
end

#construye el footer del html
def build_Footer(footerArrays)
  footerArrays.push("\s\s<footer class=\"bg-dark\">")
  footerArrays.push("\s\s</footer>")
end

#crea el archivo index.html
def build_Index (htmlFinish)
  file = open("index.html", "w")
  htmlFinish.each do |linea| 
    lineArray = ""
    lineArray = "#{linea.to_s} \n"   
    file.write(lineArray)
  end
end
def build_Carousel(carouselArrays)
  carouselArrays.push("\s\s\s\s\s\s<div id=\"carouselExampleControls\" class=\"carousel slide\" data-bs-ride=\"carousel\">")
  carouselArrays.push("\s\s\s\s\s\s\s\s<div class=\"carousel-inner\">")
  cameras = ["FHAZ", "RHAZ", "MAST", "CHEMCAM", "NAVCAM"]
  #foto N°1
  estado = "active"
  indiceFoto = 0
  numFoto = 0
  imageSelect = $dataFilter.select{|ele| ele["nameF"] == cameras[indiceFoto]} #selecciona imagen según camera
  #print "indice #{indiceFoto}  #{imageSelect[numFoto]}  numFoto #{numFoto}\n\n"
  carousel_Item(carouselArrays, estado, imageSelect[numFoto])
  numFoto += 1
  #foto fotos desde 2 a 10
  nFotos = 9
  nFotos.times do |idx|
    estado = ""
    imageSelect = $dataFilter.select{|ele| ele["nameF"] == cameras[indiceFoto]} #selecciona imagen según camera
    #print "#{idx} = indice #{indiceFoto}  #{imageSelect[numFoto]}  numFoto #{numFoto}\n\n"
    carousel_Item(carouselArrays, estado, imageSelect[numFoto])
    numFoto += 1
    if numFoto > 1 
      numFoto = 0
      indiceFoto += 1
    end
  end
  carouselArrays.push("\s\s\s\s\s\s\s\s</div>")
  carouselArrays.push("\s\s\s\s\s\s\s\s<button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleControls\" data-bs-slide=\"prev\">")
  carouselArrays.push("\s\s\s\s\s\s\s\s\s\s<span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>")
  carouselArrays.push("\s\s\s\s\s\s\s\s\s\s<span class=\"visually-hidden\">Previous</span>")
  carouselArrays.push("\s\s\s\s\s\s\s\s</button>")
  carouselArrays.push("\s\s\s\s\s\s\s\s<button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleControls\" data-bs-slide=\"next\">")
  carouselArrays.push("\s\s\s\s\s\s\s\s\s\s<span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>")
  carouselArrays.push("\s\s\s\s\s\s\s\s\s\s<span class=\"visually-hidden\">Next</span>")
  carouselArrays.push("\s\s\s\s\s\s\s\s</button>")
  carouselArrays.push("\s\s\s\s\s\s</div>")
end

def carousel_Item(carouselItemsArrays, estado, imageSel)
  #print "lo que paso al item  #{imageSel}  \n\n"
  carouselItemsArrays.push("\s\s\s\s\s\s\s\s\s\s<div class=\"carousel-item #{estado}\">")
  carouselItemsArrays.push("\s\s\s\s\s\s\s\s\s\s\s\s<img src=\"#{imageSel["linkImagen"]}\" class=\"d-block w-100\" alt=\"...\">")
  # carouselItemsArrays.push("\s\s\s\s\s\s\s\s\s\s\s\s<div class=\"carousel-caption\">")
  # carouselItemsArrays.push("\s\s\s\s\s\s\s\s\s\s\s\s\s\s<h5>Fotografia Tomada con #{imageSel["fullNameF"]}</h5>")
  # carouselItemsArrays.push("\s\s\s\s\s\s\s\s\s\s\s\s\s\s<p>en Fecha de la tierra #{imageSel["dateF"]}</p>")
  # carouselItemsArrays.push("\s\s\s\s\s\s\s\s\s\s\s\s<div>")
  carouselItemsArrays.push("\s\s\s\s\s\s\s\s\s\s</div>")
end


#principal
# filtrar data por el tipo de camara
def filterData(dataJob) 
  arraysFilter = []
  idx = 1 #indice que sera asiganado a cada elemento del arreglo
  dataJob["photos"].each do |ele|
  arraysFilter.push({"indF" => idx,
    "nameF" => ele["camera"]["name"],
    "fullNameF" => ele["camera"]["full_name"],
    "linkImagen" => ele["img_src"],
    "dateF" => ele["earth_date"]
    }) 
    #print "#{arraysFilter}\n"
    idx += 1
  end
  return arraysFilter
end 

def main_Program
  urlApi = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key="
  $data = request(urlApi, KEYAPI) # asigna a una variable global el retorno del metodo que genera el request
  $dataFilter = filterData($data) #asigna al arreglo global el retorno de datos filtrados
  #print $dataFilter
  # puts $dataFilter.count
  # puts $dataFilter.class
  build_web_pages #metodo construye pagina
end

#definicion de constantes y variables
KEYAPI = ARGV[0] #creamos una variable Globalconstante con la keyapi ingresada
$data = "" #defino una variable global para almacenar el json parseado
$dataFilter = [] #arreglo de trabajo

main_Program