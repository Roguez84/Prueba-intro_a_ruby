#Consolidacion prueba NASA

require_relative 'components'
require_relative 'request'


def build_web_page(respuesta_api_nasa)
    array_api_nasa = respuesta_api_nasa["photos"] #agrego esto para que usemos los datos como array en vez de un hash
    content = head() + header() + picture(array_api_nasa) + bootstrap()
    
    File.write('./index.html', content)
end

def photos_count(respuesta_api_nasa)
    array_api_nasa = respuesta_api_nasa["photos"] #agrego esto para que usemos los datos como array en vez de un hash
    bonus_hash =Hash.new
    
    array_api_nasa.each do |picture|
        if bonus_hash[picture["camera"]["name"]]==nil
            bonus_hash[picture["camera"]["name"]]=1
        else
            bonus_hash[picture["camera"]["name"]]+=1
        end
    end
    puts bonus_hash
end


#nasa_pictures = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=RFcfDKKZQpVDOxlOwaR6Wk0rj59NsD4GCfADKXE0')
#request_without_key = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000'
#api_key = '&api_key=RFcfDKKZQpVDOxlOwaR6Wk0rj59NsD4GCfADKXE0'
#request_link = request_without_key+api_key
nasa_pictures = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000','&api_key=RFcfDKKZQpVDOxlOwaR6Wk0rj59NsD4GCfADKXE0')
#puts nasa_pictures.class ##informacion llega como un hash con solo 1 key. El value de ese unico hash es un array que contiene las fotos que queremos
#puts nasa_pictures

build_web_page(nasa_pictures)
puts "cantidad de fotos por camara: "
puts photos_count(nasa_pictures)

