//
//  SplashViewController.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/23.
//  Copyright © 2018年 stu1. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    // score.azurewebsites.net/api/version/1
    
    var appVersion:String=""
    @IBOutlet weak var lbVersion: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaults:UserDefaults=UserDefaults.standard
        defaults.synchronize()
        
        appVersion=""+(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!
        lbVersion.text=appVersion
        
        
        let from="https://score.azurewebsites.net/api/version/\(String(describing:appVersion))"
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
            }
            
            
        })
        task.resume()
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
