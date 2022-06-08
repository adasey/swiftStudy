//
//  DetailViewCellTableViewController.swift
//  movie-lmo
//
//  Created by Induk CS on 2022/06/03.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var movieName = "영화순위"
    var isOn = false
    var naverUrl = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query="
    var youtubeUrl = "https://www.youtube.com/results?search_query="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naverUrl += movieName
        youtubeUrl += movieName
        
        var encodedUrl = naverUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

        if (isOn) {
            encodedUrl = youtubeUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
        
        guard let url = URL(string: encodedUrl) else { return }
        let request = URLRequest(url: url)
        
        self.navigationItem.title = movieName
        webView.load(request)
//        nameLabel.text = movieName
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
}
