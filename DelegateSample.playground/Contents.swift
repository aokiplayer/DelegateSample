import Foundation

class MyClass {
    var delegate: MyDelegate?
    
    func show(text: String) {
        self.delegate?.onShowCalled(withText: text)
    }
}

protocol MyDelegate {
    func onShowCalled(withText text: String)
}

//: ---
class MyAdopted1: MyDelegate {
    func onShowCalled(withText text: String) {
        print("MyAdopted1: \(text)")
    }
}

class MyAdopted2: MyDelegate {
    func onShowCalled(withText text: String) {
        print("\(text) from MyAdopted2!")
    }
}

//: ---
let anObject1 = MyClass()
anObject1.delegate = MyAdopted1()
anObject1.show(text: "Hello")

let anObject2 = MyClass()
anObject2.delegate = MyAdopted2()
anObject2.show(text: "Hello")
