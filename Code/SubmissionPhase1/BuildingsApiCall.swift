//
//  BuildingsApiCall.swift
//  SubmissionPhase1
//
//  Created by Mohit on 10/11/18.
//  Copyright © 2018 Mohit D. All rights reserved.
//

// This is a part of my Model - it's a basic Swift class - it returns the JSON from the remote Web API call. 

import Foundation
class BuildingsApiCall
{
    var dummyint:Int?
    var jsonResult:NSDictionary?
    init()
    {
        dummyint = 46290
        loadbuildingsdata() // the JSON will be readied here
    }
    
    func loadbuildingsdata()// -> String
    {
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        var dataTask: URLSessionDataTask?
        let projectID = 12
        var url : String = "https://on6ilrhjvh.execute-api.us-east-1.amazonaws.com/test1"
        var apiURL = URL(string: url)
        print("line 29", apiURL!) // Debugging
        dataTask = defaultSession.dataTask(with: apiURL!) {
            data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    if let responseData = data {
                        if let json = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as? NSDictionary {
                            print(json!)
                            self.jsonResult = json
                        }
                    }
                }
            }
        }
        
        dataTask?.resume()

    } // end of loadbuildingsdata()
    
    func getJSON() -> NSDictionary
    {
        return jsonResult!
    }
    
}
