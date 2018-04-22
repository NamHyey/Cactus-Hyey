//
//  SelectViewController.swift
//  cactus_HYEY
//
//  Created by SWUCOMPUTER on 2018. 4. 22..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
    @IBOutlet var cactusName: UIPickerView!
    @IBOutlet var cactusNameFild: UITextField!
    @IBOutlet var cactusImage: UIImageView!
    
    @IBOutlet var subView: UIView!
    let cactusArray: Array<String> = ["선인장1", "선인장2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cactusImage.isHidden=true
        subView.isHidden=true
        
    }
    var cactusWhat: String!

    //선택한 선인장1,2의 캐릭터에 맞게 이미지를 보여줌.
    @IBAction func ShowImage(_ sender: UIButton) {
        
        let cactus: String = cactusArray[self.cactusName.selectedRow(inComponent: 0)]
        if(cactus == "선인장1"){
            cactusWhat="선인장1"
            cactusImage.isHighlighted=false
            
            cactusImage.isHidden=false
        }else if(cactus == "선인장2"){
            cactusWhat="선인장2"
            cactusImage.isHighlighted=true
            cactusImage.isHidden=false
        }
        subView.isHidden=false
    }
    
    //캐릭터를 다시 선택할 수 있도록 캐릭터이미지 뷰를 숨김.
    @IBAction func reset(_ sender: UIButton) {
        subView.isHidden=true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cactusArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cactusArray[row]
    }
    
    //x표시 입력 시 키보드 사라지게 함.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
        return true
    }
    
    //하위뷰[CactusViewController]에서 받아온 info와 cactusWho의 변수에 사용자가 지정할 캐릭터의 이름, 어떤 캐릭터를 선택했는 지에 대한 정보를 넣음.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMyCactus" {
            let destVC = segue.destination as! CactusViewController
            let ordered: String! = cactusNameFild.text
        
          
            destVC.info = ordered
            destVC.cactusWho=cactusWhat
        } }
  
    

    

}
