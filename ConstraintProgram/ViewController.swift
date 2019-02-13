//
//  ViewController.swift
//  ConstraintProgram
//
//  Created by Varun Kumar on 12/02/19.
//  Copyright © 2019 Varun Kumar. All rights reserved.
//

import UIKit
class keyVakue:NSObject{
    @objc public var new:String?
    
}




class Movie{
    var name:String
    init(name:String){
        self.name = name
    }
}
class song{
    var songName:String
    init(songName:String){
        self.songName = songName
    }
}

class ViewController: UIViewController {
    var k = Bool()
    
    @IBOutlet weak var txt: UITextField!
    
    
   
    
    @objc func typing(){
       k = isValidEmail(testStr: txt.text!)
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    enum err:Error{
        case limit
        case exxess
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var arr1 = [10,20]
        let b = arr1.filter({return $0 == 10})
        print(b)
        let c = arr1.map({return $0 + 1})
        print(c)
        let d = arr1.reduce(0, {sum,number in sum + number})
        print(d)
        
        
        
        
        
        
        var number = 10
        var num = 20
        
        
        
        
        
    var s = keyVakue()
        
        s.setValue("sadas", forKey: "new")
        print(s.new!)
        
        
        print(k)
        
        txt.addTarget(self, action: #selector(typing), for: .editingChanged)
        var upCasting = "varunkumar" as Any
        
        func th(firstInt:Int,secondInt:Int)throws->Int{
            
            if((firstInt+secondInt)>100)&&((firstInt+secondInt)<200){
                throw err.limit
            }
            if((firstInt+secondInt)<100){
                throw err.exxess
            }
            return firstInt+secondInt
        }
        
        do{
            try th(firstInt: 100, secondInt: 95)
        }
        catch err.limit{
            print("This is inbetween 100 - 95")
        }
        catch err.exxess {
            print("this is less than 100")
        }
        catch {
            print("this is default behav")
        }
        
        
        let arr = [Movie(name: "Bahubali"),song(songName: "Inkem Inkem Kavale")] as [Any]
        for i in arr{
            if let downcast = i as? Movie
            {
                print("Movie name is \(downcast.name)\n")
            }
            if let downCast1 = i as? song
            {
                print("Song name is \(downCast1.songName)\n")
            }
        }
        
        let new:(String,String)->String = {
            return $0+$1
            
        }
     let t = new("varun","kumar")
        print(t)
    }
}

