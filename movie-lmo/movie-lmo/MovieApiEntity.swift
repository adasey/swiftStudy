//
//  ApiController.swift
//  movie-lmo
//
//  Created by Induk CS on 2022/05/25.
//

import Foundation

struct MovieData : Codable {
    let boxOfficeResult : BoxOfficeResult
}

struct  BoxOfficeResult : Codable {
    let dailyBoxOfficeList : [DailyBoxOfficeList]
}

struct  DailyBoxOfficeList : Codable {
    let movieNm : String
    let audiCnt : String
    let audiAcc : String
}

public class MovieApiEntity {
    final var viewController : ViewController?
    
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
}
