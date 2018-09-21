import UIKit

enum Engine {
    case on, off
}

enum Window {
    case open, close
}

enum Amount {
    case full, empty, notEmpty
}

struct HeavyCar {
    let mark: String
    let year: Int
    let amount: Double
    var engine: Engine
    var window: Window
    var amountFull: Amount {
        if cargo <= amount {
            return .full
        }else if cargo == 0.0{
            return .empty
        }else {
            return .notEmpty
        }
    }
    var cargo: Double {
        didSet {
            if cargo > amount {
                print ("Перегруз \(self)\n")
            }
        }
    }
    mutating func closeWindow(){
        self.window = .close
    }
    mutating func openWindow(){
        self.window = .open
    }
    mutating func amountCargoPut(n: Double) {
        self.cargo += n
    }
    mutating func amountCargoOut(n: Double) {
        self.cargo -= n
    }
    mutating func EngineOn(){
        self.engine = .on
    }
    mutating func EngineOff(){
        self.engine = .off
    }
}

struct LightCar {
    let mark: String
    let year: Int
    let amount: Double
    var engine: Engine
    var window: Window
    var amountFull: Amount {
        if amount <= cargo {
            return .full
        }else if cargo == 0{
            return .empty
        }else {
            return .notEmpty
        }
    }
    var cargo: Double {
        didSet {
            if cargo > amount {
                print ("Перегруз \(self)\n")
            }
        }
    }
    mutating func closeWindow(){
        self.window = .close
    }
    mutating func openWindow(){
        self.window = .open
    }
    mutating func amountCargoPut(n: Double) {
        self.cargo += n
    }
    mutating func amountCargoOut(n: Double) {
        self.cargo -= n
    }
    mutating func EngineOn(){
        self.engine = .on
    }
    mutating func EngineOff(){
        self.engine = .off
    }
}

var car1 = LightCar(mark: "Nissan", year: 2005, amount: 300, engine: .off, window: .close, cargo: 5)
var car2 = HeavyCar(mark: "UAZ", year: 1996, amount: 1000, engine: .off, window: .close, cargo: 300)
var car3 = LightCar(mark: "Volvo", year: 2015, amount: 400, engine: .off, window: .close, cargo: 15)
car1.amountCargoPut(n: 1000)
car2.openWindow()
car3.EngineOn()
print (car1)
print (car2)
print (car3)
