#Building request for NASA
#Se necesita enlazar un archivo para que funcione URI

#require_relative ''
require 'uri' 
require 'net/http'
require 'openssl'
require 'json'

def request(url)

    uri = URI(url) #URI es una funcion de RUBY que transforma a uri
    http = Net::HTTP.new(uri.host, uri.port) #Esta instruccion esta creando un elemento http y un puerto donde se pueda comunicar
    request = Net::HTTP::Get.new(uri) # request --> peticion
    http.use_ssl=true #Configuramos para que se use ssl
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER #Una vez que reciba certificado ssl, va a verificar este certificado ssl
    response = http.request(request)

    #return response.read_body #esto viene como string, entonces vamos a usar la linea de abajo para convertirlo a hash
    return JSON.parse(response.read_body) #esto nos hace transformar el string que se retorna inmediatamente a un hash

end

#Este string url, hay que transformarlo a URI (uniform resource identifier)
#print request(url)