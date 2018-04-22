//
//  CactusViewController.swift
//  cactus_HYEY
//
//  Created by SWUCOMPUTER on 2018. 4. 22..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class CactusViewController: UIViewController {
    @IBOutlet var levelup: UIProgressView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var CactusView: UIImageView!
     var info: String?
    var cactusWho: String?
    var count: Int=0
    @IBOutlet var Cactus2: UIImageView!
    @IBOutlet var restartView: UIView!
    
    //해를 클릭했을 때 count와 progress를 증가시켜서 count가 10일 때 (=progress가 다 찼을 경우) 앞서 선택한 캐릭터에 맞게 해당 캐릭터가 바뀜.
    @IBAction func Sun(_ sender: UIButton) {
       
        self.levelup.progress+=0.1
        count+=1
        if(count==10){
            
            if(cactusWho=="선인장1"){
                self.CactusView.isHighlighted=true
                restartView.isHidden=false
            }else if(cactusWho=="선인장2"){
                
                self.CactusView.isHidden=true
                self.Cactus2.isHidden=false
                restartView.isHidden=false
            }
            
           
        }
        
        

    }
    
//앞서 적용한 해 버튼과 동일한 기능
    @IBAction func Rain(_ sender: UIButton) {
            self.levelup.progress+=0.1
        count+=1
        if(count==10){
            
            if(cactusWho=="선인장1"){
                self.CactusView.isHighlighted=true
                
            }else if(cactusWho=="선인장2"){
                
                self.CactusView.isHidden=true
                self.Cactus2.isHidden=false
            }
        }
        
    }
    
    override func viewDidLoad() {
        count=0
        super.viewDidLoad()
        
        //키우기가 완료됐을 시 나타나야할 subView들을 숨김.
        Cactus2.isHidden=true
        restartView.isHidden=true
        
        //상위 뷰[selectViewController]에서 사용자가 지정한 캐릭터의 이름을 받아옴.
        if let contentString = info{
            nameLabel.text=contentString
        }
        
        

        // Do any additional setup after loading the view.
    }

  

}
