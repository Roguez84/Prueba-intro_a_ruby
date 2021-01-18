#content = head() + title() + picture(NASA_pictures) + footer() + bootsrap()

    def head
    '
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
            <title>Fotos ROVER NASA</title>
        </head>
    '
    #return str
    end
    
    
    def header
        '
        <body>
            <header>
                <h1>Fotos de Marte (Fuente: NASA)</h1>
            </header>
    
        '
    #return str
    end
    
    
    
    def picture(nasa_API_data)
        str = ""
     
        nasa_API_data.each do |photo|
#            str += '
#                    <section>
#                        <ul>
#                            <li><img src="'+photo["img_src"]+'" alt="IMAGE FAILE TO LOAD"></li>
#                            <li>Rover Name: '+photo["rover"]["name"]+'</li>
#                            <li>Picture Date: '+photo["earth_date"]+'</li>
#                        </ul>
#                    </section>
#                    '
            str += '        
                    <div class="card my-4 border-primary" style="width: 36rem;">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><img class="img-fluid card-img-top" src="'+photo["img_src"]+'" alt="IMAGE FAILE TO LOAD"></li>
                            <li class="list-group-item">Rover Name: '+photo["rover"]["name"]+'</li>
                            <li class="list-group-item">Camera Name: '+photo["camera"]["full_name"]+'</li>
                            <li class="list-group-item">Picture Date: '+photo["earth_date"]+'</li>
                        </ul>
                    </div>'
        end
    return str
    end
      
    
    def bootstrap
    str =    '
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    
        </body>
    </html>
    '
    return str
    end