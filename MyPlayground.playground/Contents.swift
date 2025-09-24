import UIKit

//THE BASICS

var text = "SWIFT"
let max = 0
var average = 0.0


for character in text {
    print (character)
}

let naam = (voornaam: "Mathisse", achternaam: "Pattyn")

print(naam.voornaam)
print (naam.achternaam)


var reversedString : String? = "mathisse"

if let reversedString = reversedString {
    print(reversedString)
} else {
    print("no result")
}



//FUNCTIONS

func reverseString(tekst:String?) -> String{
    if let tekst = tekst {
        return String(tekst.reversed())
    } else{
        return ""
    }
}

print(reverseString(tekst: "Vives"))



//func getUpperLowerCount(tekst:String) -> (upper:String,lower:String, charCount: Int){
//        let upper = tekst.uppercased()
//        let lower = tekst.lowercased()
//        let charCount = tekst.count
//        
//        return (upper, lower, charCount)
//}
//let result = getUpperLowerCount(tekst: "IOS 26")
//
//print(result.upper)
//print(result.lower)
//print(result.charCount)
//
//print(result)



func divide(getal1:Int, getal2: Int) -> Double {
    return Double(getal1/getal2)
}
print(divide(getal1: 10, getal2: 2))


func calculate (numbers: Int...) -> ((avg:Double, min:Int, max:Int, count:Int))?{
    if numbers.isEmpty {
        return nil
    } else {
        var totaal: Double = 0.0
        for number in numbers {
            totaal += Double(number) }
        let avg = totaal / Double(numbers.count)
        let min = numbers.min()!
        let max = numbers.max()!
        let count = numbers.count
        return (avg, min, max, count)
    }
}


print(calculate(numbers: 10, 0,5))
print(calculate(numbers: 4, 5,6,-3))
print(calculate(numbers: -3))
print(calculate())


var x : Double = 10.0
var y : Int = 3

func increment(x: inout Double, y: inout Int) {
    x += 1
    y += 1
}

increment(x: &x, y: &y)
print(x, y)




enum StringConversionError: Error{
    case emptyString (String)
    case nilParameter (String)
}

func getUpperLowerCount(tekst:String?) throws -> (upper:String,lower:String, charCount: Int) {
    guard let tekst = tekst else{
        throw StringConversionError.nilParameter("Nil value not allowed")
    }
    
    guard !tekst.isEmpty else {
        throw StringConversionError.emptyString ("Empty string not allowed")
    }

    
        let upper = tekst.uppercased()
        let lower = tekst.lowercased()
        let charCount = tekst.count
        
        return (upper, lower, charCount)
}

do{
    print(try getUpperLowerCount(tekst: nil))
} catch {
    print(error)
}
do{
    print(try getUpperLowerCount(tekst: ""))
}catch{
    print(error)
}
do{
    print(try getUpperLowerCount(tekst: "iOS 26"))
} catch{
    print(error)
}
