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



func getUpperLowerCount(tekst:String) -> (upper:String,lower:String, charCount: Int){
        let upper = tekst.uppercased()
        let lower = tekst.lowercased()
        let charCount = tekst.count
        
        return (upper, lower, charCount)
}
let result = getUpperLowerCount(tekst: "IOS 26")

print(result.upper)
print(result.lower)
print(result.charCount)

print(result)



func divide(getal1:Int, getal2: Int) -> Double {
    return Double(getal1/getal2)
}
print(divide(getal1: 10, getal2: 2))


func calculate (_ numbers: double)
