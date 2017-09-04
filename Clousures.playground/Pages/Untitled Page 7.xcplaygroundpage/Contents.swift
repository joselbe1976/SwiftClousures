import Foundation

//usamos smartdown

/*:
 # titulo
 ## subtitulo
 
 - one
 - two
 
 1. one
 2. Two
 

 ![](https://www.prestigia.es/wp-content/uploads/2017/04/Prestigia-HTTPS.jpg)
 
 
 
 */


typealias codeIntParam = (Int) -> Int
func createCounter() -> codeIntParam{
    
    func inc1(n: Int) -> Int{
        return n + 1
    }
    //devolvemos el codigo que es la funcion inc1
    return inc1
    
}

//forma de ejecutar 1
let count = createCounter()
count(1)

 //forma de ejecutar 2
createCounter()(1)


//creamos un array
let marxBrothers = ["Chicco", "Harpo", "Zeppo","Groucho"]
let loveCities = ["Madrid", "Valencia", "Palencia","Teruel","Alovera","PozoRrubio"]

func orderBigArray(a: [String]) -> [String]{
    return a.sorted()
}

func orderSmallArray(a: [String]) -> [String]{
    //imagine that are diferents forms of sort
    return a.reversed()
}

func selectSortMethod(a: [String]) -> ([String])->([String]){
    if a.count > 4{
        return orderBigArray
    }
    else{
        return orderSmallArray
    }
}

//funcion que me devuelve un trozo de codigo y lo ejecutamos
selectSortMethod(a: marxBrothers)(marxBrothers)
selectSortMethod(a: loveCities)(loveCities)







