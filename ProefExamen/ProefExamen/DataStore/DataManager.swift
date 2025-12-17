import Foundation
@Observable
class DataManager {
    var cars: [Car] = []
    
    var favorieteCars : [Car] = []
    
    init(){
        
    }
    
    func toggleFavorite(car: Car){
        if(favorieteCars.contains(car)){
            favorieteCars.removeAll{$0 == car}
        } else {
            favorieteCars.append(car)
        }
    }
    
    func getFavoriteCars() -> [Car] {
        return favorieteCars
    }
    
    func getCarByFuelType(fueltype: String) -> [Car]{
        if(fueltype == "Alle"){
            return cars
        } else{
            return cars.filter({$0.fuelType == fueltype})
        }
    }
    
    func getAllCars () -> [Car] {
        return cars
    }
    
    func sort(){
        cars.sort(by: {$0.brand < $1.brand})
    }
    
    
     
    func loadCars() async {
        do {
            print("⏳ Loading car data...")
            try await Task.sleep(for: .seconds(1))
            
            let root : CarsResponse = load("cars.json")
            cars = root.cars
            print("✅ Data loaded successfully.")
        } catch {
            cars = []
            print("❌ Failed to load cars:", error)
        }
    }
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
