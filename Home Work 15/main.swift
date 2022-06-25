//
//  main.swift
//  Home Work 15
//
//  Created by Rafik on 25.06.22.
//

import Foundation


//Home Work 15


//1. Ստեղծել struct Point անունով որը պետք է ունենա 2 init `
//- պետք է սկզբնական արժեքներ տա x, y։ Օրինակ Point(x: 5, y: -8) -> x = 5, y = -8
//- պետք է միայն դրական սկզբնական արժեքներ տա   x, y-ին: Օրինակ Point(x: -5, y: -8) -> x = 5, y = 8




struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double ) {
        self.x = x
        self.y = y
    }
    init(PointX: Double, PointY: Double) {
        self.x = abs(PointX)
        self.y = abs(PointY)
  }
    
}

let exmpPoint = Point(x: 5, y: -8)


//2. Ստեղծել struct Rect (հետևյալ փրոփրտիներով origin: Point, weight: Double, height: Double ) անունով որը պետք է ունենա հետևյալ init-ները`

//- init(origin: Point, weight: Double, height: Double)
//- init(center: Point, weight: Double, height: Double)
//- init(weight: Double, height: Double) -> Point.x = 0 Point.y = 0



struct Rect {
    var origin: Point
    var weight: Double
    var height: Double

    init(origin: Point, weight: Double, height: Double) {
        self.origin = origin
        self.weight = weight
        self.height = height
    }

    init(center: Point, weight: Double, height: Double){
        let originx = center.x - weight / 2
        let originY = center.y - height / 2
        self.init(origin: Point(x: originx, y: originY), weight: weight, height: height)
    }

    init(weight: Double, height: Double) {
        self.weight = weight
        self.height = height
        self.origin = Point(x: 0, y: 0)
    }

}
let obj = Rect(center: Point(x: 0, y: 0), weight: 0, height: 0)

let object = Rect(origin: Point(x: 2, y: 3), weight: 4, height: 5)

let noCenter = Rect(weight: 3, height: 4)


//3. Ստեղծել struct Color (հետևյալ փրոփրտիներով red, green, blue)
//- init(red: Double, green: Double, blue: Double)
//- init(red: Double)
//- init(green: Double)
//- init(blue: Double)

struct Color {
    var red: Double
    var green: Double
    var blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(red: Double) {
        self.red = red
        self.green = 0
        self.blue = 0
    }
    
    init(green: Double) {
        self.red = 0
        self.green = green
        self.blue = 0
    }
    
    init(blue: Double) {
        self.red = 0
        self.green = 0
        self.blue = blue
    }
}

let exmpColor = Color(red: 2, green: 3, blue: 4)

//4. Ստեղծել Class Car անունով (հետևյալ փրոփրտիներով name, model,speed, isAutomatic)  որը պետք է ունենա հետևյալ init-ները`
//- init(name: String, model: String, speed: String, isAutomatic: Bool)
//- init(name: String, model: String, speed: String)
//- init(name: String, model: String)
//- init(name: String)
//- init()


class Car {
    var name: String
    var model: String
    var speed: String
    var isAutomatic: Bool
    
    init(name: String, model: String, speed: String, isAutomatic: Bool) {
        self.name = name
        self.model = model
        self.speed = speed
        self.isAutomatic = isAutomatic
    }
    
    convenience init(name: String, model: String, speed: String) {
        self.init(name: name, model: model, speed: speed, isAutomatic: true)
    }
    
  convenience init(name: String, model: String) {
      self.init(name: name, model: model, speed: "0km/h")
  }
    
    convenience init(name: String) {
        self.init(name: name, model: "m5")
        
    }
    
  convenience init() {
        
        self.init(name: "BMW")
    }
    
}

let carObj = Car()



//5. Ստեղծել Class View անունով (հետևյալ փրոփրտիներով frame: Rect, backgroundColor: Color, tag: Int)
//որը պետք է ունենա հետևյալ init-ները`
//- init(frame: Rect, backgroundColor: Color, tag: Int)
//- init(frame: Rect, backgroundColor: Color)
//- init(frame: Rect)
//- init()




class View {
    var frame: Rect
    var backgroundColor: Color
    var tag: Int
    
    init(frame: Rect, backgroundColor: Color, tag: Int) {
        self.frame = frame
        self.backgroundColor = backgroundColor
        self.tag = tag
    }
    
    convenience init(frame: Rect, backgroundColor: Color) {
        self.init(frame: frame, backgroundColor: backgroundColor, tag: 0)
    }
    
    convenience init(frame: Rect) {
        self.init(frame: frame, backgroundColor: Color(red: 0, green: 0, blue: 0 ))
    }
    
    convenience init() {
        self.init(frame: Rect(origin: Point(x: 0, y: 0), weight: 0, height: 0))
    }
}

let exempView = View(frame: Rect(origin: Point(x: 0, y: 0), weight: 2, height: 3), backgroundColor: Color(red: 0, green: 0, blue: 0 ), tag: 5)


//6. Ստեղծել Class Button որը կժառանգվի View -ից (հետևյալ փրոփրտիներով titleName: String, isSelected: Bool) որը պետք է ունենա հետևյալ init-ները`
//- init(frame: Rect, titleName: String, isSelected: Bool)
//- init(frame: Rect, titleName: String)

class Button: View {
    var titleName: String
    var isSelected: Bool
    
    init(frame: Rect, titleName: String, isSelected: Bool) {
        self.titleName = titleName
        self.isSelected = isSelected
        super.init(frame: frame, backgroundColor: Color(red: 0, green: 0, blue: 0), tag: 0)
    }
    
    convenience init(frame: Rect, titleName: String) {
        self.init(frame: frame, titleName: titleName, isSelected: true)
        
    }
}

let exmpButton = Button(frame: Rect(weight: 1, height: 2), titleName: "Delete", isSelected: true)

