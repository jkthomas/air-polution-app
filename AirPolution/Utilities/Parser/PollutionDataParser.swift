//
//  PollutionDataParser.swift
//  AirPolution
//
//  Created by RMS2018 on 10/04/2019.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

public class PollutionDataParser {
    func parseApiRequest(response: StatusDto) -> String {
        let timestamp = response.data.current.weather.ts.components(separatedBy: "T")
        
        //TODO: Add string builder
        var dataString = ""
        dataString.append("Miasto: " + response.data.city + "\n")
        dataString.append("Data: " + timestamp[0] + "\n")
        dataString.append("Godzina: " + timestamp[1].components(separatedBy: ".")[0] + "\n")
        dataString.append(response.data.current.pollution.mainus + "\n")
        if(response.data.current.pollution.co != nil){
            dataString.append("Dane: " + String(response.data.current.pollution.co.conc) + "\n")
        } else {
            
        }
        dataString.append(String(response.data.current.weather.tp) + "\n")
        
        return dataString
    }
    
    func appendOptionalParameter(concentrationInfo: ConcetrationInfoDto?, dataStringBuilder: String) -> Void {
        if(concentrationInfo != nil){
            //dataStringBuilder.append()
        } else {
            
        }
    }
}
