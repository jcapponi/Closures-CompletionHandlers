import UIKit


// Creando closures simples
let driving = {
    print("Conduciendo mi auto")
}

driving()

// closure que recibe parámetros
let driving2 = { (place: String) in
    print("estoy yendo a  \(place) en mi auto")
}

driving2("London")

// closure que retorna valor (String)
let drivingWithReturn = { (place: String) -> String in
    return "estoy yendo a \(place) en mi auto"
}

let message = drivingWithReturn("Miami")
print(message)

// Closures como parámetro
func travel(action: () -> Void) {
    print("Estoy listo para ir")
    action()
    print("Llegué a destino!")
}

travel(action: driving)
 





func getData(url: String, completionHandler:((String) -> Void)) {
    
    print("la url recibida es..: \(url)")
    
    completionHandler("que es esto ahora?")
}

//se puede programar completionHandler de la siguinte manera
getData(url: "www.google.com.ar") { string
    in return print(string)
}

// o puedo obviarlo
getData(url: "url", completionHandler: {_ in })



// secuencia  y didSet
var refreshData = { () -> ()  in
    print("array impreso en refreshData.:\(array)")
}

var array : [String] = [] {
    didSet {
        print("array.:\(array)")
        array.append("c")
        refreshData()
    }
}

array = ["a", "b"]





// Ejemplos simples
func sampleFunction () {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("Respuestas retrasada por 2 segundos")
    }
    print("Acabo de invocar a la función")
}

sampleFunction()


func sampleFunctionWithCompletionHandler (completion: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("Respuestas retrasada por 2 segundos")
        completion()
    }
}


// puedo invocar a completion sin referenciarlo
sampleFunctionWithCompletionHandler {
    print("Acabo de invocar a la función")
}

// o puedo invocarlo refernciandolo
sampleFunctionWithCompletionHandler(completion: {
    print("Acabo de invocar a la función")
    
})





func sampleFunctionWithCHAndParam (completion: @escaping (String) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("Respuestas retrasada por 2 segundos")
        completion("Recibo un string")
    }
}

sampleFunctionWithCHAndParam(completion: { string in
    print(string)
})


// a función operaciones recibe el primer parámetro que luego se lo paso a la función "calculo"
func operaciones(oper: String, calculo: (String, Int, Int) -> ()){
    calculo(oper, 7, 3)
}

//invocando a la
operaciones(oper: "*") { a,b,c in
    switch a {
    case "+":
        let oper = b + c
        print("suma..: \(oper)")
    case "-":
        let oper = b - c
        print("resta..: \(oper)")
    case "*":
        let oper = b * c
        print("Mult..: \(oper)")
    default:
           print("Operador desconocido. No realizo ninguna operación")
    }
}
