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
