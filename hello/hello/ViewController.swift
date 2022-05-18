//
//  ViewController.swift
//  hello
//
//  Created by Induk CS on 2022/05/04.
//

import UIKit

/// 클래스 설명문 : 첫 버튼, 텍스트 필드 앱
class ViewController: UIViewController {
    @IBOutlet weak var lblHello1: UILabel!
    @IBOutlet weak var txtName: UITextField!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let label1 = UILabel()
//        let label2 = UILabel()
//
//        label1.frame = CGRect(x: 125, y: 500, width: 150, height: 50)
//        label1.text = "made label1"
//        label1.textColor = UIColor.black
//        label1.backgroundColor = .cyan
//        view.addSubview(label1)
//
//        label2.frame = CGRect(x: 125, y: 550, width: 150, height: 50)
//        label2.text = "made label2"
//        label2.textColor = UIColor.black
//        label2.backgroundColor = .cyan
//        view.addSubview(label2)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let l1 = UILabel()
        l1.frame = CGRect(x: 10, y: 10, width: 100, height: 200)
        
        print("DidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("WillAppear")
    }

    @IBAction func btnSend(_ sender: UIButton) {
        lblHello1.text = "반가워 " + txtName.text!
    }
}

