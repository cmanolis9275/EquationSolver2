//
//  ViewController.swift
//  EquationSolver2
//
//  Created by Christos Manolis on 5/11/16.
//  Copyright © 2016 Christos Manolis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{

    @IBOutlet weak var equationLabel: UILabel!
    @IBOutlet weak var subjectPickerView: UIPickerView!
    @IBOutlet weak var equationPickerView: UIPickerView!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    @IBOutlet weak var xTextField: UITextField!
    @IBOutlet weak var yTextField: UITextField!
    @IBOutlet weak var zTextField: UITextField!
    @IBOutlet weak var finalEquationLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    @IBOutlet weak var aTextField: UITextField!
    @IBOutlet weak var bTextField: UITextField!
    @IBOutlet weak var cTextField: UITextField!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var solveButton: UIButton!
    
    
    var subjects : [String] = [String]()
    var equations : [String] = [String]()
    var equations2 : [String] = [String]()
    var geometry : [String] = [String]()
    var currentEquationSet : [String] = [String]()
    var preCalc : [String] = [String]()
    var currentEquation = " "
    var x = 0
    var y = 0
    var z = 0
    var a = 0
    var b = 0
    var c = 0
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        subjects = ["Algebra I", "Algebra II", "Geometry", "Pre-Calculus"]
        equations = ["Power", "Power Within a Power", "Diference of two squares", "Standard formula"]
        equations2 = ["Pythagorean Theorem", "Slope", "Distance Formula", "Point-Slope Form"]
        geometry = ["Square", "Rectangle", "Parallelogram", "Trapezoid", "Circle", "Eslipse", "Triangle",]
        preCalc = ["Pre-Calculus_1", "Pre-Calculus_2", "Pre-Calculus_3"]
        currentEquationSet = equations
        subjectPickerView.tag = 1
        equationPickerView.tag = 2
        xLabel.hidden = true
        xTextField.hidden = true
        yLabel.hidden = true
        yTextField.hidden = true
        zLabel.hidden = true
        zTextField.hidden = true
        aLabel.hidden = true
        aTextField.hidden = true
        bLabel.hidden = true
        bTextField.hidden = true
        cLabel.hidden = true
        cTextField.hidden = true
        setButton.hidden = true
        solveButton.hidden = true
        finalEquationLabel.hidden = true
        resultLabel.hidden = true
        xTextField.text = "0"
        yTextField.text = "0"
        zTextField.text = "0"
        aTextField.text = "0"
        bTextField.text = "0"
        cTextField.text = "0"

        

    }
    
   
    @IBAction func SubjectPicker(sender: AnyObject)
    {
        subjectPickerView.hidden = false
        subjects = ["Algebra I", "Algebra II", "Geometry", "Precalculus"]

        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView.tag == 1
        {
            return subjects.count
        }
        else if pickerView.tag == 2
        {
            return currentEquationSet.count
        }
        else
        {
            return 2
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView.tag == 1
        {
            return "\(subjects[row])"
        }
        else
        {
            return "\(currentEquationSet[row])"
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
       if pickerView.tag == 1
       {
            if(row == 0)
            {
                subjects = ["Algebra I", "Algebra II", "Geometry", "Precalculus"]
                currentEquationSet = equations
                equationPickerView.reloadAllComponents()
                print("[Log] Algebra I picked")

            }
            else if(row == 1)
            {
                subjects = ["Algebra I", "Algebra II", "Geometry", "Precalculus"]
                currentEquationSet = equations2
                equationPickerView.reloadAllComponents()
                print("[Log] Algebra II picked")

            }
            else if(row == 2)
            {
                subjects = ["Algebra I", "Algebra II", "Geometry", "Precalculus"]
                currentEquationSet = geometry
                equationPickerView.reloadAllComponents()
                print("[Log] Geometry picked")


            }
            else
            {
                subjects = ["Algebra I", "Algebra II", "Geometry", "Precalculus"]
                currentEquationSet = preCalc
                equationPickerView.reloadAllComponents()
                print("[Log] Pre-Calculus picked")


            }
        }
        else if pickerView.tag == 2 && currentEquationSet == equations
       {
        
            if(row == 0)
            {
                equationLabel.text = "x^y"
                currentEquation = "Power"
                xLabel.hidden = false
                xTextField.hidden = false
                yLabel.hidden = false
                yTextField.hidden = false
                zLabel.hidden = true
                zTextField.hidden = true
                aLabel.hidden = true
                aTextField.hidden = true
                bLabel.hidden = true
                bTextField.hidden = true
                cLabel.hidden = true
                cTextField.hidden = true
                setButton.hidden = false
            }
            else if(row == 1)
            {
                equationLabel.text = "(x^y)^z"
                currentEquation = "Power within a power"
                xLabel.hidden = false
                xTextField.hidden = false
                yLabel.hidden = false
                yTextField.hidden = false
                zLabel.hidden = false
                zTextField.hidden = false
                aTextField.hidden = true
                bLabel.hidden = true
                bTextField.hidden = true
                cLabel.hidden = true
                cTextField.hidden = true
                setButton.hidden = false
            }
            else if(row == 2)
            {
                equationLabel.text = "x^2 - y^2"
                currentEquation = "Difference of two squares"
                xLabel.hidden = false
                xTextField.hidden = false
                yLabel.hidden = false
                yTextField.hidden = false
                zLabel.hidden = true
                zTextField.hidden = true
                aTextField.hidden = true
                bLabel.hidden = true
                bTextField.hidden = true
                cLabel.hidden = true
                cTextField.hidden = true
                setButton.hidden = false
            }
            else if(row == 3)
            {
                equationLabel.text = "ax^2 + bx + c"
                currentEquation = "Difference of two squares"
                xLabel.hidden = false
                xTextField.hidden = false
                yLabel.hidden = false
                yTextField.hidden = false
                zLabel.hidden = true
                zTextField.hidden = true
                aTextField.hidden = false
                bLabel.hidden = false
                bTextField.hidden = false
                cLabel.hidden = false
                cTextField.hidden = false
                setButton.hidden = false
                aLabel.hidden = false

            }

        }
        else if pickerView.tag == 2 && currentEquationSet == equations2
        {

            if row == 0
            {
                equationLabel.text = "a^2 + b^2 = c^2"
                currentEquation = "Pythagoream Theorem"
                xLabel.hidden = true
                xTextField.hidden = true
                yLabel.hidden = true
                yTextField.hidden = true
                zLabel.hidden = true
                zTextField.hidden = true
                aTextField.hidden = false
                aLabel.hidden = false
                bLabel.hidden = false
                bTextField.hidden = false
                cLabel.hidden = false
                cTextField.hidden = false
                setButton.hidden = false

            }
            else if row == 1
            {
                equationLabel.text = "m = (y2 - y1)/(x2 - x1)"
                currentEquation = "Slope"
                xLabel.hidden = false
                xTextField.hidden = false
                yLabel.hidden = false
                yTextField.hidden = false
                zLabel.hidden = true
                zTextField.hidden = true
                aTextField.hidden = false
                bLabel.hidden = false
                bTextField.hidden = false
                cLabel.hidden = true
                cTextField.hidden = true
                setButton.hidden = false
                aLabel.hidden = false
                bLabel.text = "Y2 = "
                aLabel.text = "X2 = "
            }
            else if row == 2
            {
                equationLabel.text = "D = √((X2 - X1)^2 + (Y2 - Y1)^2)"
                currentEquation = "Distance formula"
                xLabel.hidden = false
                xTextField.hidden = false
                yLabel.hidden = false
                yTextField.hidden = false
                zLabel.hidden = true
                zTextField.hidden = true
                aTextField.hidden = false
                bLabel.hidden = false
                bTextField.hidden = false
                cLabel.hidden = true
                cTextField.hidden = true
                setButton.hidden = false
                aLabel.hidden = false
                bLabel.text = "Y2 = "
                aLabel.text = "X2 = "
            }
            else if row == 3
            {
                equationLabel.text = "Y - Y1 = M(X - X1)"
                currentEquation = "Pont-Slope Form"
                xLabel.hidden = false
                xTextField.hidden = false
                yLabel.hidden = false
                yTextField.hidden = false
                zLabel.hidden = true
                zTextField.hidden = true
                aTextField.hidden = false
                bLabel.hidden = false
                bTextField.hidden = false
                cLabel.hidden = true
                cTextField.hidden = true
                setButton.hidden = false
                aLabel.hidden = false
                bLabel.text = "Y1 = "
                aLabel.text = "X1 = "
            }
            
            
        }
        else if pickerView.tag == 2 && currentEquationSet == geometry
        {
            if (row == 0)
            {
                equationLabel.text = "a^2"
                currentEquation = "Area of a square"
                xLabel.hidden = true
                xTextField.hidden = true
                yLabel.hidden = true
                yTextField.hidden = true
                zLabel.hidden = true
                zTextField.hidden = true
                aTextField.hidden = false
                bLabel.hidden = true
                bTextField.hidden = true
                cLabel.hidden = true
                cTextField.hidden = true
                setButton.hidden = false
                aLabel.hidden = false
            }
            else if (row == 1)
            {
                equationLabel.text = "ab"
                currentEquation = "Area of a rectangle"
                xLabel.hidden = true
                xTextField.hidden = true
                yLabel.hidden = true
                yTextField.hidden = true
                zLabel.hidden = true
                zTextField.hidden = true
                aTextField.hidden = false
                bLabel.hidden = false
                bTextField.hidden = false
                cLabel.hidden = true
                cTextField.hidden = true
                setButton.hidden = false
                aLabel.hidden = false
            }
            else if (row == 2)
            {
                equationLabel.text = "bh"
                currentEquation = "Parallelogram"
                xLabel.hidden = true
                xTextField.hidden = true
                yLabel.hidden = false
                yTextField.hidden = false
                zLabel.hidden = true
                zTextField.hidden = true
                aTextField.hidden = true
                bLabel.hidden = false
                bTextField.hidden = false
                cLabel.hidden = true
                cTextField.hidden = true
                setButton.hidden = false
                aLabel.hidden = true
                yLabel.text = "h = "
            }
            else if (row == 3)
            {
                equationLabel.text = "h/2 (b1 + b2)"
                currentEquation = "Trapezoid"
                xLabel.hidden = true
                xTextField.hidden = true
                yLabel.hidden = false
                yTextField.hidden = false
                zLabel.hidden = true
                zTextField.hidden = true
                aTextField.hidden = false
                bLabel.hidden = false
                bTextField.hidden = false
                cLabel.hidden = true
                cTextField.hidden = true
                setButton.hidden = false
                aLabel.hidden = false
                aLabel.text = "b1 = "
                bLabel.text = "b2 = "
            }
            else if (row == 4)
            {
                equationLabel.text = "πr^2"
                currentEquation = "Circle"
                xLabel.hidden = true
                xTextField.hidden = true
                yLabel.hidden = false
                yTextField.hidden = false
                zLabel.hidden = true
                zTextField.hidden = true
                aTextField.hidden = true
                bLabel.hidden = true
                bTextField.hidden = true
                cLabel.hidden = true
                cTextField.hidden = true
                setButton.hidden = false
                aLabel.hidden = true
                yLabel.text = "r = "

            }
            else if (row == 5)
            {
                equationLabel.text = "π(r1)(r2)"
                currentEquation = "Elipse"
                xLabel.hidden = false
                xTextField.hidden = false
                yLabel.hidden = false
                yTextField.hidden = false
                zLabel.hidden = false
                zTextField.hidden = true
                aTextField.hidden = true
                bLabel.hidden = true
                bTextField.hidden = true
                cLabel.hidden = true
                cTextField.hidden = true
                setButton.hidden = false
                aLabel.hidden = true
                xLabel.text = "π = "
                yLabel.text = "r1 = "
                zLabel.text = "r2 = "
            }
            else if (row == 6)
            {
                equationLabel.text = "1/2(bh)"
                currentEquation = "Elipse"
                xLabel.hidden = true
                xTextField.hidden = true
                yLabel.hidden = true
                yTextField.hidden = true
                zLabel.hidden = false
                zTextField.hidden = false
                aTextField.hidden = true
                bLabel.hidden = false
                bTextField.hidden = false
                cLabel.hidden = true
                cTextField.hidden = true
                setButton.hidden = false
                aLabel.hidden = true
                xLabel.text = "h = "
  
            }
        }
        
        else if pickerView.tag == 2 && currentEquationSet == preCalc
        {
            
        }
    }

    @IBAction func viewTapped(sender: UITapGestureRecognizer)
    {
    }

    @IBAction func pickEquation(sender: AnyObject)
    {
        subjectPickerView.tag == 2
    }
    
    
    
    @IBAction func setVariables(sender: AnyObject)
    {
        
            finalEquationLabel.hidden = false
            solveButton.hidden = false
            if currentEquationSet == equations
            {
                if currentEquation == "Power"
                {
                    finalEquationLabel.text = "\(xTextField.text!) ^ \(yTextField.text!)"
                }
                if currentEquation == "Power within a power"
                {
                    finalEquationLabel.text = "(\(xTextField.text!) ^ \(yTextField.text!)) ^ \(zTextField.text!)"
                }
                if currentEquation == "Difference of two squares"
                {
                    finalEquationLabel.text = "\(xTextField.text!)^2 - \(yTextField.text!)^2"
                }
            }
            else if currentEquationSet == equations2
            {
                if currentEquation == "Pythagoream Theorem"
                {
                    finalEquationLabel.text = "\(aTextField.text!)^2 + \(bTextField.text!)^2 = \(cTextField.text!)^2"
                }
                else if currentEquation == "Slope"
                {
                    finalEquationLabel.text = "M = (\(bTextField.text!) - \(yTextField.text!))/(\(aTextField.text!) - \(xTextField.text!))"
                }
                else if currentEquation == "Distance Formula"
                {
                    finalEquationLabel.text = "D = √((\(aTextField.text!) - \(xTextField.text!))^2 + (\(bTextField.text!) - \(yTextField.text))^2)"
                }

                
            }
            else if currentEquationSet == geometry
            {
                if currentEquation == "Area of a square"
                {
                    finalEquationLabel.text = "\(aTextField.text!)^2"
                }
                if currentEquation == "Area of a rectangle"
                {
                    finalEquationLabel.text = "\(aTextField.text!)(\(bTextField.text!))"
                }
                if currentEquation == "Parallelogram"
                {
                    finalEquationLabel.text = "\(bTextField.text!)(\(yTextField.text!))"
                }
                if currentEquation == "Trapezoid"
                {
                    finalEquationLabel.text = "\(yTextField.text!)(\(aTextField.text!) + \(bTextField.text!))"
                }
                if currentEquation == "Circle"
                {
                    finalEquationLabel.text = "π(\(yTextField.text!))^2"
                }
                if currentEquation == "Elipse"
                {
                    finalEquationLabel.text = "π(\(yTextField.text!))(\(xTextField.text!))"
                }
                if currentEquation == "Triangle"
                {
                    finalEquationLabel.text = "1/2(\(bTextField.text!))(\(zTextField.text!))"
                }
                
            }
            else if currentEquationSet == preCalc
            {
                
            }
        
    }
    
    
    
    
    
    
    

    
    @IBAction func solve(sender: AnyObject)
    {
        resultLabel.hidden = false
         x = Int(xTextField.text!)!
         y = Int(yTextField.text!)!
         z = Int(yTextField.text!)!
         a = Int(aTextField.text!)!
         b = Int(bTextField.text!)!
         c = Int(cTextField.text!)!
        
        if currentEquationSet == equations
        {
            if currentEquation == "Power"
            {
                let result = pow(Double(x), Double(y))
                print("\(result)")
                resultLabel.text = "\(result)"

            
            
            }
            if currentEquation == "Power within a power"
            {
            
                if z == 0
                {
                    resultLabel.text = "1"
                }
                else if z != 0
                {
                    let yz = y * z
                    let result = pow(Double(x), Double(yz))
                    print("\(result)")
                    resultLabel.text = "\(result)"

                }
            }
        
            if currentEquation == "Difference of two squares"
            {
                let xroot = sqrt(Double(x))
                let yroot = sqrt(Double(y))
                let result = "(\(xroot) - \(yroot))(\(xroot) + \(yroot))"
                print(result)
                resultLabel.text = result
            }
        }
        if currentEquationSet == equations2
        {
            if currentEquation == "Pythagoream Theorem"
            {
                let asqrt = pow(Double(a), 2)
                let bsqrt = pow(Double(b), 2)
                let csqrt = pow(Double(c), 2)
                let result = asqrt - bsqrt
                resultLabel.text = "\(result)"
            }
            else if currentEquation == "Slope"
            {
                 let result = (b - y)/(a - x)
                 resultLabel.text = "\(result)"
            }
            else if currentEquation == "Distance Formula"
            {

                let part1 = a + x
                let part2 = b - y
                let part1sqrt = pow(Double(part1), 2)
                let part2sqrt = pow(Double(part2), 2)
                let tempFinal = part1sqrt + part2sqrt
                let result = sqrt(Double(tempFinal))
                resultLabel.text = "\(result)"


            }
            else if currentEquation == "Slope"
            {
                let part1 = b - y
                let part2 = a - x
                let result  = part1 / part2
                print("\(result)")
                resultLabel.text = "\(result)"

            }
            
            
        }
        if currentEquationSet == geometry
        {
            if currentEquation == "Area of a square"
            {
                let result = sqrt(Double(a))
                print("\(result)")
                resultLabel.text = "\(result)"
            }
        }

    }

    
//    func addEquation(Name : String, Equation : String, Solve: Int) -> String
//    {
//        
//        return "\(Solve)"
//        
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

