//
//  ProfileViewController.swift
//  SeSACDrinkingWater
//
//  Created by 김정민 on 2021/10/09.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weighLabel: UILabel!
    
    @IBOutlet var nickNameTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weighTextField: UITextField!
    
        
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nickNameLabel.text = "닉네임을 설정해주세요"
        heightLabel.text = "키(cm)를 설정해주세요"
        weighLabel.text = "몸무게(kg)를 설정해수세요"
        
        //R:64 G: 147  B:114
        self.view.backgroundColor = UIColor(red: 65/255, green: 148/255, blue: 114/255, alpha: 1)
        
        nickNameLabel.textColor = .white
        heightLabel.textColor = .white
        weighLabel.textColor = .white
    
        navigationController?.navigationBar.tintColor = .white
                
        
        let waterAmount : Int = UserDefaults.standard.integer(forKey: "waterAmount")
        let waterDrinked : Int = UserDefaults.standard.integer(forKey: "waterDrinked")
        let percentStr = String(format: "%.2f", ( Double(waterDrinked) / Double(waterAmount * 1000)) * 100)
        

        // 색상
        self.navigationItem.title = "물 마시기"
        self.navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.tintColor = .white
 
        
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
    
    @IBAction func Saveprofile(_ sender: UIBarButtonItem) {
        
        let nickNameTextField = nickNameTextField?.text
        let height: Int = Int((heightTextField?.text)!) ?? 0
        let weigh: Int  = Int((weighTextField.text)!) ?? 0
        let waterAmount  = (height + weigh) / 100
        
        UserDefaults.standard.set(nickNameTextField, forKey: "nickName")
        UserDefaults.standard.set(waterAmount,forKey:"waterAmount")
    
    }
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    

}
