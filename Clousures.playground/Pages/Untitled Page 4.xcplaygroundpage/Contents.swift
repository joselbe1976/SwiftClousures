import Foundation

let concatNameAndSurname = {(s1 : String, s2 : String) -> String in
    return s1 + s2
}

concatNameAndSurname("Hola ", "Adios")

let CitiAndStret = concatNameAndSurname

CitiAndStret("Alovera ", "España")

//Creo el type Alias
typealias StringJoiner = (String, String) -> String

let cityAndFutbolName : (String, String) -> String  = CitiAndStret
let cityAndFutbolName2 : StringJoiner  = CitiAndStret

cityAndFutbolName2("Sevilla ", "Betis")




