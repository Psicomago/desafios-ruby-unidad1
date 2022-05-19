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
  result = JSON.parse(response.read_body)
end

# obtiene asigna apiKey del usuario
def keyRequest(apiKeySecret)
  passKey = apiKeySecret
end

# filtrar data por el tipo de camara
def filterData(dataJob,typeCameras) 
  cameras = []
  idx = 1
  dataJob["photos"].each do |ele| #["photos"][idx] != nil?
    if ele["camera"]["name"] == typeCameras
      cameras.push([idx], ele["camera"]["name"], ele["camera"]["full_name"], ele["img_src"], ele["earth_date"])
      idx += 1
      byebug
    end 
  end
  return cameras
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
  headerArrays.push("\s\s<h1>FOTGRAFIAS API NASAS>")
  #headerArrars.push("\s\s\s\s <a>https://www.nasa.gov/sites/all/themes/custom/nasatwo/images/nasa-logo.svg</a>")
  headerArrays.push("\s\s</header>")
end

#Construye el main del html
def build_Main(mainArrays)
  mainArrays.push("\s\s<main>")
  build_Carrousel(mainArrays) #llama al método que construye al carrousel 
  mainArrays.push("\s\s</main>")
end

def build_Carrousel(carrouselArrays)
  carrouselArrays.push("\s\s\s\s<div id=\"carouselExampleIndicators\" class=\"carousel slide\" data-bs-ride=\"carousel\">")
  
  #primer grupo de fotos
  carrouselArrays.push("\s\s\s\s\s\s<div class=\"carousel-item active\">")
  slid = 1
  build_Carrousel_Row(carrouselArrays, slid)
  carrouselArrays.push("\s\s\s\s\s\s</div>")

  #segundo Grupo de fotos
  carrouselArrays.push("\s\s\s\s\s\s<div class=\"carousel-item text-dark\">")
  slid = 5
  build_Carrousel_Row(carrouselArrays, slid)
  carrouselArrays.push("\s\s\s\s\s\s</div>")

  #tercer grupo de fotos
  carrouselArrays.push("\s\s\s\s\s\s<div class=\"carousel-item text-dark\">")
  slid = 9
  build_Carrousel_Row(carrouselArrays, slid)
  carrouselArrays.push("\s\s\s\s\s\s</div>")

  #cuarto Grupo de Fotos
  carrouselArrays.push("\s\s\s\s\s\s<div class=\"carousel-item text-dark\">")
  slid = 1
  build_Carrousel_Row(carrouselArrays, slid)
  carrouselArrays.push("\s\s\s\s\s\s</div>")

  #quinto grupo de fotos
  carrouselArrays.push("\s\s\s\s\s\s<div class=\"carousel-item text-dark\">")
  slid = 1
  build_Carrousel_Row(carrouselArrays, slid)
  carrouselArrays.push("\s\s\s\s\s\s</div>")
  carrouselArrays.push("\s\s\s\s</div>")
end

#construye carrousel este es el que estaba trabajando revisar para integrar lo demas
# def build_Carrousel(carrouselArrays)
#   fotosCamera1 = []
#   carrouselArrays.push("\s\s\s\s<div id=\"carouselExampleIndicators\" class=\"carousel slide\" data-bs-ride=\"carousel\">")
#   carrouselArrays.push("\s\s\s\s\s\s<div class=\"carousel-item active\">")
#   slid = 1
#   nameCamera = "FHAZ" #cámara tipo 1
#   fotosCamera1.push(filterData($data, nameCamera)) #filtra el archivo por el tipo de cámara indicado
#   imagen1Arrays = select_Images(fotosCamera1, nameCamera) #metodo para seleccionar imagenes al azar de la cámara 1
#   puts "byebug de carrousel"
#   byebug
#   build_Carrousel_Row(carrouselArrays, imagen1Arrays, slid)
#   carrouselArrays.push("\s\s\s\s\s\s\s\s</div>")
#   carrouselArrays.push("\s\s\s\s\s\s\s\s<div class=\"carousel-item text-dark\">")
#   slid = 5
#   #cámara tipo 2
#   nameCamera = "RHAZ"
#   fotosCamera2 = filterData($data, nameCamera) #filtra el archivo por el tipo de cámara indicado
#   build_Carrousel_Row(carrouselArrays, imagen2Arrays, slid)
#   carrouselArrays.push("\s\s\s\s\s\s</div>")
#   carrouselArrays.push("\s\s\s\s</div>")
# end

# image1Arrays = "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/rcam/RLB_486265291EDR_F0481570RHAZ00323M_.JPG"
#   imagen2Arra = "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG"
#   imagen3 = "http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631290305226E03_DXXX.jpg"

#agrega item al carrousel
def build_Carrousel_Row(carrouselArraysRow, slid)
  carrouselArraysRow.push("\s\s\s\s\s\s\s\s<div class=\"row\">")
  sli = slid
  build_Carrousel_Img(carrouselArraysRow, sli)
  sli += 1
  build_Carrousel_Img(carrouselArraysRow, sli)
  sli += 1
  build_Carrousel_Img(carrouselArraysRow, sli)
  sli += 1
  build_Carrousel_Img(carrouselArraysRow, sli)
  carrouselArraysRow.push("\s\s\s\s\s\s\s\s</div>")
  # carrouselArraysRow.push("\s\s\s\s\s\s</div>")
  # carrouselArraysRow.push("\s\s\s\s</div>")
end

#agrega imagen al item carrousel
def build_Carrousel_Img(carrouselArraysImg, sli)
  carrouselArraysImg.push("\s\s\s\s\s\s\s\s\s\s<div class=\"col-md-3 col-lg-3\">")
  #carrouselArraysImg.push("\s\s\s\s\s\s\s\s\s\s\s\s<img src=\"img1\" class=\"img-fluid\" alt=\"slider-#{sli}\">")
  carrouselArraysImg.push("\s\s\s\s\s\s\s\s\s\s</div>")
end

def select_Images(arraysPhotosCamera, nameCamera)
  arraysFotosGroup = []
  totalFotosCamera = arraysPhotosCamera.count
  cantFotosRow = 4
  byebug
  cantFotosRow.times do |ind|
    fotoIndice = rand(0..totalFotosCamera).to_i
    arraysFotosGroup.push(arrayPhotosCamera[ind][3])
  end
  return arraysFotosGroup
end
#construye el footer del html
def build_Footer(footerArrays)
  footerArrays.push("\s\s<footer>")
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

#abre archivos como arreglos
def openFileAsArray(file)
  dataFile = open(file).read.chomp.split(",")
end

# def select_Images(data)

#   #camara tipo 3
#   nameCamera = "MAST"
#   fotosCamera3 = filterData(data, nameCamera) #filtra el archivo por el tipo de cámara indicado

#   #camara tipo 4
#   nameCamera = "CHEMCAM"
#   fotosCamera4 = filterData(data, nameCamera) #filtra el archivo por el tipo de cámara indicado

#   #camara tipo 5
#   nameCamera = "NAVCAM"
#   fotosCamera5 = filterData(data, nameCamera) #filtra el archivo por el tipo de cámara indicado
# end






def revisa_json(datos)
  
  # {
  #   "photos": [
  #       {
  #           "id": 102693,
  #           "sol": 1000,
  #           "camera": {
  #               "id": 20,
  #               "name": "FHAZ",
  #               "rover_id": 5,
  #               "full_name": "Front Hazard Avoidance Camera"
  #           },
  #           "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG",
  #           "earth_date": "2015-05-30",
  #           "rover": {
  #               "id": 5,
  #               "name": "Curiosity",
  #               "landing_date": "2012-08-06",
  #               "launch_date": "2011-11-26",
  #               "status": "active"
  #           }
  #       },
  #       {
  #           "id": 102694,
  #           "sol": 1000,
  #           "camera": {
  #               "id": 20,
  #               "name": "FHAZ",
  #               "rover_id": 5,
  #               "full_name": "Front Hazard Avoidance Camera"
  #           }}]}
end

#principal

def main_Program
  #keyApi = ARGV[0].to_s
  # urlApi = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key="
  # $data = request(urlApi, KEYAPI) #metodo genera el request
  build_web_pages #metodo construye pagina
end

#definicion de constantes y variables
KEYAPI = ARGV[0].to_s #creamos una constante con la keyapi ingresada
$data = "" #defino una variable global para almacenar el json parseado

main_Program