//
//  DataReceiver.swift
//  AirPolution
//
//  Created by RMS2018 on 13/03/2019.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

class DataReceiver {
    
    var urlStr = String()
    var body = String()
    
    init(url: String) {
        self.urlStr = url
    }
    
    public func setUrl(url: String){
        self.urlStr = url
    }
    
    func call(){
        
        //"https://api.airvisual.com/v2/city?city=Wroclaw&state=Lower%20Silesia&country=Poland&key=bZYjJr9cgRteuwwB2"
        //dziala
        let url = URL(string: urlStr)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            if let data = data,
                let urlContent = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                if let jsonData = urlContent.data(using: 4){
                    let decoder = JSONDecoder()
                    let response = try! decoder.decode(StatusDto.self, from: jsonData)
                    self.body = response.data.current!.pollution!.mainus as String
                }
                else{
                    //ERROR
                }
            }
        }
        task.resume()
    }
    
    func getBody()->String{
        return self.body
    }
}
