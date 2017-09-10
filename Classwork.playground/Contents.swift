//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//=============== 1 ЗАДАНИЕ ===============

var array: Array<Int> = [4, 5,1,3,2,4]

print(array)

func bubbleSort(with array: inout [Int]){
    
    for i in 0 ..< array.count   {
        
        for j in 0 ..< (array.count - 1) - i  {
            
            if array[j] > array[j+1]{
                
                let temp = array[j]
                
                array[j] = array[j+1]
                
                array[j+1] = temp
            }
        }
    }
    
}

bubbleSort(with: &array)

print(array)


//=========== 2 ЗАДАНИЕ ===============

class Phone {
    
    private let model: String?
    private let price: Int?
    
    init(model: String, price: Int){
        self.model = model
        self.price = price
    }
    
    
    func call(){
        print("making call...")
    }
    
    func getPrice() -> Int{
        return price!
    }
    
    func getModel() -> String{
        return model!
    }
    
}

class SmartPhone: Phone{
    
    let cameraMPX: Double
    
    init(model: String, price: Int, cameraMPX: Double) {
        self.cameraMPX = cameraMPX
        super.init(model: model, price: price)
    }
    
    func makePhoto(){
        print("making photo...")
    }
    
    override func call(){
        print("making call and record this...")
    }
    
}

var phone = Phone(model:"iphone", price: 123)
phone.call()
print(phone.getPrice())
//print(phone.price) не сработает из за приватного доступа

var smartPhone = SmartPhone(model:"iphone", price: 321, cameraMPX: 312.0)
smartPhone.makePhoto()
smartPhone.call()
print(smartPhone.cameraMPX) //не приватный атрибут, поэтому работает


// ============ 3 ЗАДАНИЕ ===========

class Stack{
    
    var array: [Int]
    
    init() {
        array = []
    }
    
    func isEmpty() -> Bool{
        return array.isEmpty
    }
    
    func peek() -> Int {
        return array.first!
    }
    
    func pop() -> Int {
        let temp = array.first!
        array.remove(at: 0)
        return temp
    }
    
    func push(number: Int){
        array.insert(number, at: 0)
    }
    
}

var stack = Stack()
stack.isEmpty()
stack.push(number: 3)
stack.push(number: 1)
stack.peek()
stack.pop()
stack.peek()
stack.isEmpty()
stack.pop()
stack.isEmpty()




