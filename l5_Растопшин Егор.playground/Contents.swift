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

protocol Car {
    var mark: String {get}
    var year: Int {get}
    var km: Double {get}
    var door: Door {get}
    var window: Window {get}
    var engine: Engine {get}
}

extension Car {
    func switchWindow() -> Window {
        if self.window == .open {
            return .close
        }else{
            return .open
        }
    }
}
extension Car {
    func switchDoor() -> Door {
        if self.door == .close {
            return .open
        }else{
            return .close
        }
    }
}
extension Car {
    func switchEngine() -> Engine {
        if self.engine == .on{
            return .off
        }else{
            return .on
        }
    }
}
class TrunkCar: Car {
    var trunk: Trunk
    var mark: String
    var year: Int
    var km: Double
    var door: Door
    var window: Window
    var engine: Engine
    init(mark: String, year: Int, km: Double, door: Door, window: Window, engine: Engine, trunk: Trunk) {
        self.mark = mark
        self.year = year
        self.km = km
        self.door = door
        self.window = window
        self.engine = engine
        self.trunk = trunk
    }
    func switchTrunk() {
        if trunk == .close {
            self.trunk = .open
        }else{
            self.trunk = .close
        }
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Марка: \(mark), Год выпуска: \(year), Статус дверей: \(door), Статус окон: \(window), Статус двигателя: \(engine), Статус цистерны: \(trunk)"
    }
}

class SportCar: Car {
    var hatch: Hatch
    var mark: String
    var year: Int
    var km: Double
    var door: Door
    var window: Window
    var engine: Engine
    init(mark: String, year: Int, km: Double, door: Door, window: Window, engine: Engine, hatch: Hatch) {
        self.mark = mark
        self.year = year
        self.km = km
        self.door = door
        self.window = window
        self.engine = engine
        self.hatch = hatch
    }
    func switchHatch() {
        if self.hatch == .close {
            self.hatch = .open
        }else{
            self.hatch = .close
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Марка: \(mark), Год выпуска: \(year), Статус дверей: \(door), Статус окон: \(window), Статус двигателя: \(engine), Статус крыши: \(hatch)"
    }
}

var car1 = TrunkCar (mark: "UAZ", year: 1996, km: 100000, door: .close, window: .close, engine: .off, trunk: .close)
var car2 = SportCar (mark: "Lambo", year: 2018, km: 0, door: .close, window: .close, engine: .off, hatch: .close)
car1.switchTrunk()
car1.window = car1.switchWindow() //Не понял как через extension сделать, чтобы сразу window был нужного статуса. Extension может только возвращать значения.
car2.engine = car2.switchEngine() // Алтернатива сделать расширение не в протокол а в класс. Тогда наверное это будет работать как нужно без "=", но это не точно :)
car2.switchHatch()
print (car1)
print (car2)
