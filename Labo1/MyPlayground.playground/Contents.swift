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

enum IphoneType{
  case iPhoneAir
  case iPhone17Pro
  case iPhone17ProMax
  case iPhone17
}

struct Iphone {
  let supplier: String = "Apple"
  var type: IphoneType?
  var dimension: (height: Double, width: Double)
  
  var description : String {
    guard let types = type else { return "onbekend"}
    switch types {
      case .iPhoneAir: return "iPhone air"
      case .iPhone17: return "iPhone 17"
      case .iPhone17Pro: return "iPhone 17 Pro"
      case .iPhone17ProMax: return "iPhone 17 Pro Max"
    }
  }

  init() {
    self.type = nil
    self.dimension = (height: 0.0, width: 0.0)
  }

  init(type: IphoneType, dimension: (height: Double, width: Double)) {
    self.type = type
    self.dimension = dimension
  }
}

let iPhoneAir = Iphone()
let iPhoneAir2 = Iphone(type: .iPhoneAir, dimension: (height: 15.62, width: 7.47))

print(iPhoneAir.description)
print(iPhoneAir2.description)



let arr = ["Dirk", "Els", "Marc", "Eline", "Dominiek"]
//let namenBeginnendMetD = arr.filter{arr in return arr.hasPrefix("D")}
//print(namenBeginnendMetD)

func filterArrExtended(letter: String) -> (String) -> Bool {
  func filterArr(naam: String) -> Bool {
    return naam.hasPrefix(letter)
  }
  return filterArr
}

//let filtered2 = arr.filter(filterArr)
//print(filtered2)

let filtered3 = arr.filter(filterArrExtended(letter: "M"))
let filteredUpper = filtered3.map {
  naam in naam.uppercased()
}

print(filteredUpper)

let lengths = arr.map {
  naam in naam.count
}
let sortedLengths = lengths.sorted()
print(sortedLengths)
