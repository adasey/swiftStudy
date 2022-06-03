//
//  ViewController.swift
//  movie-lmo
//
//  Created by Induk CS on 2022/05/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let apiCtrl = MovieApiController()
    
    open var refreshControl : UIRefreshControl?

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.delegate = self
        table.dataSource = self
        
        apiCtrl.setApiDateURL(self.makeYesterdayString())
        getData()
    }
    
    func getData() {
        if let url = URL(string: apiCtrl.movieUrl) {
            let task = self.sessionTaskSetting(url)
            task.resume()
        }
    }
    
    func sessionTaskSetting(_ url: URL) -> URLSessionDataTask{
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            if let JSONData = data {
//                print(JSONData, response!)
                self.JSONdataDecoder(JSONData)
            }
        }
        return task
    }
    
    func JSONdataDecoder(_ JSONData: Data) {
        let dataString = String(data: JSONData, encoding: .utf8)
        print(dataString!)
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MovieData.self, from: JSONData)
            apiCtrl.movieData = decodedData
            DispatchQueue.main.async {
                self.table?.reloadData()
            }
        }
        catch {
            print(error)
        }
    }
    
    func makeYesterdayString() -> String {
        let y = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let dateF = DateFormatter()
        dateF.dateFormat = "yyyyMMdd"
        let day = dateF.string(from: y)
        return day
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "박스오피스 영화진흥위원회제공:" + makeYesterdayString()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.movieName.text = apiCtrl.movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieNm
        
        if let Count = apiCtrl.movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].audiCnt {
            let numF = NumberFormatter()
            numF.numberStyle = .decimal
            let reAudi = Int(Count)!
            let result = numF.string(for: reAudi)! + "명"
            cell.audiCount.text = "어제 : \(result)"
        }
        if let Acc = apiCtrl.movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].audiAcc {
            cell.audiAccumulate.text = "누적 : \(Acc)명"
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }

}

