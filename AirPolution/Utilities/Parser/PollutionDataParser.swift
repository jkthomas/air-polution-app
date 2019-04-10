//
//  PollutionDataParser.swift
//  AirPolution
//
//  Created by RMS2018 on 10/04/2019.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

public class PollutionDataParser {
    func parseApiRequest(response: StatusDto) -> String{
        let timestamp = response.data.current.weather.ts.components(separatedBy: "T")
        
        //aquis byl nullem - dodac nullchecki
        var dataString = ""
        dataString.append(response.data.city + "\n")
        dataString.append(timestamp[0] + "\n")
        dataString.append(timestamp[1].components(separatedBy: ".")[0] + "\n")
        dataString.append(response.data.current.pollution.mainus + "\n")
        dataString.append(String(response.data.current.weather.tp) + "\n")
        
        return dataString
    }
}
