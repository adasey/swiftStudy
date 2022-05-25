//
//  ApiController.swift
//  movie-lmo
//
//  Created by Induk CS on 2022/05/25.
//

import Foundation

struct MovieData : Codable {
    let  boxOfficeResult : BoxOfficeResult
}

struct  BoxOfficeResult : Codable {
    let  dailyBoxOfficeList : [DailyBoxOfficeList]
}

struct  DailyBoxOfficeList : Codable {
    let  movieNm : String
    let  audiCnt : String
}

public class MovieApiController {
    let TARGETDATE = "&targetDt="
    let defaultApiPath = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=e1c6780d66859cb59abf4cf5d92b5ae2"
    
    var movieUrl : String
    var yesterDate : String
    var movieData : MovieData?
    
    init() {
        self.yesterDate = "20220520"
        self.movieUrl = self.defaultApiPath + self.TARGETDATE + self.yesterDate
    }
    
    func setApiDateURL(_ date: String) {
        self.setDate(date: date)
        self.movieUrl = self.defaultApiPath + self.TARGETDATE + self.yesterDate
    }
    
    func setDate(date: String) {
        self.yesterDate = date
    }
    
    func getData() {
        if let url = URL(string: movieUrl) {
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
            self.movieData = decodedData
        }
        catch {
            print(error)
        }
    }
}
