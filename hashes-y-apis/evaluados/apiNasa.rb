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

def keyRequest(apiKeySecret)
  passKey = apiKeySecret
end

# filtrar data por el tipo de camara
def filterData(dataJob,typeCamera) 
  cameras = []
  ind = 0
  #prueba recorriendo el hash
  dataJob.each do |ele|
    byebug
   if dataJob["photos"][ind]["camera"]["name"] == typeCamera
    cameras.push(dataJob["photos"][ind])
    #  cameras.push{
    #    "id" => ind,
    #    "nameCam" => name,
    #    "fullNameCam" => full_name,
    #    "earthDateCam" => earth_date,
    #    "launchDateCam" => launch_date,
    #    "imageCam" => img_src
    #  }     
   end
    #cameras.push() #if ['photos'][i]['camera']['name': value] == "FHAZ"
    #print "soy ele #{ele} \n"#"soy data job #{dataJob['photos'][0]['camera']} /n" 
    ind += 1
  end
  return cameras
end

def build_web_pages
  pagesIndex = Array.new
  pagesIndex = build_Html #asigna el resultado de build_html a pagesIndex
  pagesIndex = build_Head(pagesIndex)
  pagesIndex = build_Body(pagesIndex)

  build_Index(pagesIndex)
  # puts "construyendo html"
  # puts pagesIndex
  return pagesIndex

end
def build_Html
  htmlArrays = Array.new
  htmlArrays.push("<!DOCTYPE html>")
  htmlArrays.push('<html lang="en">')
  return htmlArrays
end

#abre archivos como arreglos
def openFileAsArray(file)
  dataFile = open(file).read.chomp.split(",")
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
   #<script src="https://kit.fontawesome.com/35207aa8d7.js" crossorigin="anonymous"></script>

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
  headerArrays.push("\s\s<header>")
  headerArrays.push("\s\s<h1>FOTGRAFIAS API NASAS>")
  imagen1 = "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/rcam/RLB_486265291EDR_F0481570RHAZ00323M_.JPG"
  imagen2 = "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG"
  imagen3 = "http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631290305226E03_DXXX.jpg"
  buildCarrousel(headerArrays,imagen1,imagen2,imagen3)
  #headerArrars.push("\s\s\s\s <a>https://www.nasa.gov/sites/all/themes/custom/nasatwo/images/nasa-logo.svg</a>")
  headerArrays.push("\s\s</header>")
end

#Construye el main del html
def build_Main(mainArrays)
  mainArrays.push("\s\s<main>")

  mainArrays.push("\s\s</main>")
end

#construye el carrusel
def buildCarrousel(carrouselArrays,img1,img2,im3)
  carrouselArrays.push("\s\s\s\s<div id=\"carouselExampleCaptions\" class=\"carousel slide\" data-bs-ride=\"false\">")
  carrouselArrays.push("\s\s\s\s\s\s<div class=\"carousel-indicators\">")
  carrouselArrays.push("\s\s\s\s\s\s\s\s<button type=\"button\" data-bs-target=\"#carouselExampleCaptions\" data-bs-slide-to=\"0\" class=\"active\" aria-current=\"true\" aria-label=\"Slide 1\"></button>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s<button type=\"button\" data-bs-target=\"#carouselExampleCaptions\" data-bs-slide-to=\"1\" aria-label=\"Slide 2\"></button>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s<button type=\"button\" data-bs-target=\"#carouselExampleCaptions\" data-bs-slide-to=\"2\" aria-label=\"Slide 3\"></button>")
  carrouselArrays.push("\s\s\s\s\s\s</div>")
  carrouselArrays.push("\s\s\s\s\s\s<div class=\"carousel-inner\">")
  carrouselArrays.push("\s\s\s\s\s\s\s\s<div class=\"carousel-item active\">")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s<img src=\"#{img1}\" class=\"d-block w-100\" alt=\"...\">")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s<div class=\"carousel-caption d-none d-md-block\">")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s\s\s<h5>First slide label</h5>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s\s\s<p>Some representative placeholder content for the first slide.</p>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s</div>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s</div>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s<div class=\"carousel-item\">")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s<img src=\"#{img2}\" class=\"d-block w-100\" alt=\"...\">")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s<div class=\"carousel-caption d-none d-md-block\">")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s\s\s<h5>Second slide label</h5>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s\s\s<p>Some representative placeholder content for the second slide.</p>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s</div>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s</div>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s<div class=\"carousel-item\">")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s<img src=\"#{img1}\" class=\"d-block w-100\" alt=\"...\">")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s<div class=\"carousel-caption d-none d-md-block\">")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s\s\s<h5>Thid slide label</h5>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s\s\s<p>Some representative placeholder content for the third slide.</p>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s\s\s</div>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s</div>")
  carrouselArrays.push("\s\s\s\s\s\s</div>")
  carrouselArrays.push("\s\s\s\s\s\s<button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"carouselExampleCaptions\" data-bs-slide=\"prev\">")
  carrouselArrays.push("\s\s\s\s\s\s\s\s<span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s<span class=\"visually-hidden\">Previous</span>")
  carrouselArrays.push("\s\s\s\s\s\s</button>")
  carrouselArrays.push("\s\s\s\s\s\s<button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"carouselExampleCaptions\" data-bs-slide=\"next\">")
  carrouselArrays.push("\s\s\s\s\s\s\s\s<span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>")
  carrouselArrays.push("\s\s\s\s\s\s\s\s<span class=\"visually-hidden\">Next</span>")
  carrouselArrays.push("\s\s\s\s\s\s</button>")
  carrouselArrays.push("\s\s\s\s</div>")
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
#main
keyApi = ARGV[0].to_s
urlApi = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key="
#keyApi = requestKey(keySecret)
data = request(urlApi, keyApi) #metodo genera el request
nameCamera = "FHAZ"
dataFilter = filterData(data, nameCamera) #filtra el archivo por el tipo de cámara indicado
print "#{dataFilter}\n"
print "total fotos #{dataFilter.count} \n"
print dataFilter.class
print "clase de data #{data.class} \n"
build_web_pages #metodo construye pagina

# print cameras



#photos = data.map{|x| x["img_src"]}#
# photos = [[["id: value"]]]
#camaras = data.map{|x| x["name"]}
# html = ""
# photos[0..5].each do |photo|
#     html += "<img src=\"#{photo}\">\n"
# end
#File.write('output.html',html)
#print camaras
# print photos
# puts data.class