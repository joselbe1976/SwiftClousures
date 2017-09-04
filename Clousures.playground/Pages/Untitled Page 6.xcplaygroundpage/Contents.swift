import Foundation


func downloadImage(imageName: String) -> Data{
    //background
    
    
    //al acabar.....
    return Data()
}

let chiquitoData = downloadImage(imageName: "http")
print("jarl")



//segundo argumento una clausura vacia que no recibe ni devuelve

// Void == ()

func downloadImage2(imageName: String, completion: ()->()){
    
}


//La segunda, al ser el ultimo parametro se omite. Son exactamente lo mismo. Sintax Sugar

downloadImage2(imageName: "http-..", completion: {
    //clausura
    print("Finalizado")
})

downloadImage2(imageName: "lalala") {
    //clausura
     print("Finalizado")
}


typealias simpleClouse = ()->()

func readJsonFromServer(url: String, Success: simpleClouse, error: simpleClouse){
    
}

readJsonFromServer(url: "http://",
   Success: {
    
    },
   error: {
        
    })





