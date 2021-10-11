//
//  DrinkWaterViewController.swift
//  SeSACDrinkingWater
//
//  Created by 김정민 on 2021/10/09.
//

import UIKit

class DrinkWaterViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nicknameInputLabel: UILabel!
    @IBOutlet var waterInputTextField: UITextField!
    @IBOutlet var waterCurrent: UILabel!
    @IBOutlet var waterDrinkUIButton: UIButton!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var percentLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nickName: String = UserDefaults.standard.string(forKey: "nickName")!
        let waterAmount : Int = UserDefaults.standard.integer(forKey: "waterAmount")
        let waterDrinked : Int = UserDefaults.standard.integer(forKey: "waterDrinked")
        let percentStr = String(format: "%.2f", ( Double(waterDrinked) / Double(waterAmount * 1000)) * 100)
        
        
        waterDrinkUIButton.titleLabel?.text = "물 마시기"
        nicknameInputLabel.text = "\(nickName)님의 하루 물 권장 섭취량은 \(waterAmount)L 입니다."
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.numberOfLines = 0
        textLabel.text = "잘하셨어요! \n오늘 마신 양은 "
        waterCurrent.text = "\(waterDrinked)ml"
        percentLabel.text = "목표의 \(percentStr)%"


        // 색상
        self.navigationItem.title = "물 마시기"
        self.navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.tintColor = .white
        textLabel.font = textLabel.font.withSize(20)
        textLabel.textColor = .white
        waterCurrent.textColor = .white
        percentLabel.textColor = .white
        nicknameInputLabel.textColor = .white
        //R:64 G: 147  B:114
        self.view.backgroundColor = UIColor(red: 65/255, green: 148/255, blue: 114/255, alpha: 1)
        
        waterDrinkUIButton.setTitle("물 마시기", for: .normal)
        waterDrinkUIButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        waterDrinkUIButton.setTitleColor(.white, for: .normal)
        waterDrinkUIButton.backgroundColor = .black
        
        // 이미지
        
        let percentFloat : Float = Float(percentStr)!
        
        if percentFloat == 100 {
            imageView.image = UIImage(named:"1-10.jpg")
        } else if percentFloat >= 90 {
            imageView.image = UIImage(named:"1-9.jpg")
        } else if percentFloat >= 80 {
            imageView.image = UIImage(named:"1-8.jpg")
        } else if percentFloat >= 70 {
            imageView.image = UIImage(named:"1-7.jpg")
        } else if percentFloat >= 60 {
            imageView.image = UIImage(named:"1-6.jpg")
        } else if percentFloat >= 50 {
            imageView.image = UIImage(named:"1-5.jpg")
        } else if percentFloat >= 40 {
            imageView.image = UIImage(named:"1-4.jpg")
        } else if percentFloat >= 30 {
            imageView.image = UIImage(named:"1-3.jpg")
        } else if percentFloat >= 20 {
            imageView.image = UIImage(named:"1-2.jpg")
        } else  {
            imageView.image = UIImage(named:"1-1.jpg")
        }
        
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        let nickName: String = UserDefaults.standard.string(forKey: "nickName")!
//        let waterAmount : Int = UserDefaults.standard.integer(forKey: "waterAmount")
//        let waterDrinked : Int = UserDefaults.standard.integer(forKey: "waterDrinked")
//
//        nicknameInputLabel.text = "\(nickName)님의 하루 물 권장 섭취량은 \(waterAmount)L 입니다."
//        waterCurrent.text = "\(waterDrinked)"
        
        
        let nickName: String = UserDefaults.standard.string(forKey: "nickName")!
        let waterAmount : Int = UserDefaults.standard.integer(forKey: "waterAmount")
        let waterDrinked : Int = UserDefaults.standard.integer(forKey: "waterDrinked")
        let percentStr = String(format: "%.2f", ( Double(waterDrinked) / Double(waterAmount * 1000)) * 100)
        
        
        waterDrinkUIButton.titleLabel?.text = "물 마시기"
        nicknameInputLabel.text = "\(nickName)님의 하루 물 권장 섭취량은 \(waterAmount)L 입니다."
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.numberOfLines = 0
        textLabel.text = "잘하셨어요! \n오늘 마신 양은 "
        waterCurrent.text = "\(waterDrinked)ml"
        percentLabel.text = "목표의 \(percentStr)%"
        waterInputTextField.text?.removeAll()
        
        
        
        // 이미지
        let percentFloat : Float = Float(percentStr)!
        
        if percentFloat == 100 {
            imageView.image = UIImage(named:"1-10.jpg")
        } else if percentFloat >= 90 {
            imageView.image = UIImage(named:"1-9.jpg")
        } else if percentFloat >= 80 {
            imageView.image = UIImage(named:"1-8.jpg")
        } else if percentFloat >= 70 {
            imageView.image = UIImage(named:"1-7.jpg")
        } else if percentFloat >= 60 {
            imageView.image = UIImage(named:"1-6.jpg")
        } else if percentFloat >= 50 {
            imageView.image = UIImage(named:"1-5.jpg")
        } else if percentFloat >= 40 {
            imageView.image = UIImage(named:"1-4.jpg")
        } else if percentFloat >= 30 {
            imageView.image = UIImage(named:"1-3.jpg")
        } else if percentFloat >= 20 {
            imageView.image = UIImage(named:"1-2.jpg")
        } else  {
            imageView.image = UIImage(named:"1-1.jpg")
        }
        

    }
    
    

    
    @IBAction func drinkWater(_ sender: UIButton) {
        
        let waterDrink : Int = Int(( waterInputTextField?.text )!) ?? 0
        var waterDrinked = UserDefaults.standard.integer(forKey: "waterDrinked")
        
        
        waterDrinked += waterDrink
        UserDefaults.standard.set(waterDrinked, forKey: "waterDrinked")
        
    }
    
    
    @IBAction func resetData(_ sender: UIBarButtonItem) {
        
        UserDefaults.standard.set(0, forKey: "waterDrinked")

    }
    

    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    

}
