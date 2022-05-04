//
//  ViewController.swift
//  hello
//
//  Created by Induk CS on 2022/05/04.
//

import UIKit

/// 클래스 설명문 : 첫 버튼, 텍스트 필드 앱
class ViewController: UIViewController {
    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        
        label.frame = CGRect(x: 125, y: 500, width: 150, height: 50)
        label.text = "made label"
        label.textColor = UIColor.black
        label.backgroundColor = .cyan
        view.addSubview(label)
    }

    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "반가워 " + txtName.text!
    }
}

