//
//  MapViewController.swift
//  movie-lmo
//
//  Created by 이민욱 on 2022/06/03.
//

import UIKit
import WebKit

class MapViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    let mapUrl = "https://map.naver.com/v5/search/%EC%98%81%ED%99%94%EA%B4%80"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: mapUrl) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
