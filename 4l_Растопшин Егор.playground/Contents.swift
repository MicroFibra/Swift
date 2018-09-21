import UIKit

enum Window {
    case open, close
}
enum Door {
    case open, close
}
enum Engine {
    case on, off
}
enum Trunk {
    case open, close
}
enum Hatch {
    case open, close
}
class Car {
    let mark: String
    let year: Int
    let km: Double
    var door: Door
    var window: Window
    var engine: Engine
    init(mark: String, year: Int, km: Double, door: Door, window: Window, engine: Engine) {
        self.mark = mark
        self.year = year
        self.km = km
        self.door = door
        self.window = window
        self.engine = engine
    }
    func specialClass() {
    }
}
class TrunkCar: Car {
    var trunk: Trunk
    init(mark: String, year: Int, km: Double, door: Door, window: Window, engine: Engine, trunk: Trunk) {
        self.trunk = trunk
        super.init(mark: mark, year: year, km: km, door: door, window: window, engine: engine)
    }
    override func specialClass() {
        if trunk == .close {
            self.trunk = .open
        }else{
            self.trunk = .close
        }
    }
}
class SportCar: Car {
    var hatch: Hatch
    init(mark: String, year: Int, km: Double, door: Door, window: Window, engine: Engine, hatch: Hatch) {
        self.hatch = hatch
        super.init(mark: mark, year: year, km: km, door: door, window: window, engine: engine)
    }
    override func specialClass() {
        if self.hatch == .close {
            self.hatch = .open
        }else{
            self.hatch = .close
        }
    }
}
var car1 = TrunkCar (mark: "UAZ", year: 1996, km: 200000, door: .close, window: .close, engine: .off, trunk: .close)
var car2 = SportCar (mark: "Lambo", year: 2018, km: 0, door: .close, window: .close, engine: .off, hatch: .close)
car1.specialClass()
print ("Trunk is \(car1.trunk)")
car2.specialClass()
print ("Hatch is \(car2.hatch)")
