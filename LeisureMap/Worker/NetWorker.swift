//
//  NetWorker.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/26.
//  Copyright © 2018年 stu1. All rights reserved.
//

import Foundation
protocol AsyncResponseDelegate {
    func receivedResponse (_ sender:AsyncRequestWorker,responseString:String,tag:Int)
    }

class AsyncRequestWorker {
    var responseDelegate:AsyncResponseDelegate?
    func getResponse(from:String,tag:Int) -> Void {
//        let from="https://score.azurewebsites.net/api/version/\(String(describing:appVersion))"
        let url=URL(string:from)!
        let requst=URLRequest(url: url)
        let config=URLSessionConfiguration.default
        let session=URLSession(configuration:config)
        let task=session.dataTask(with: requst, completionHandler: {(data,response,error) in
            let httpResponse=response as! HTTPURLResponse
            let statusCode=httpResponse.statusCode
            if(200==statusCode){
                let dataString=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let responseString=String(dataString!)
                //                print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>)
                print(responseString)
                self.responseDelegate?.receivedResponse(self, responseString: "", tag: tag)
                
            }
            
            
        })
        task.resume()
       
    }
}
