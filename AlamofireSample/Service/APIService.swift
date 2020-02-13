//
//  ApiService.swift
//  Questions
//
//  Created by Admin on 2/8/20.
//  Copyright © 2020 Questions. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    static let shared = APIService()
    private init(){
        
    }
    func getQuestionCategories(completion: @escaping (Error?, Any?)->()){
        let url = ConstantData.GET_CATEGORIES
        Alamofire.request(url, method: .post, encoding:  JSONEncoding.default).responseJSON { response in
            switch response.result{
            case .success(let data):
                completion(nil, data)
            case .failure(let error):
                completion(error, nil)
            }
        }
    }
//
//    func getQuestions(completion: @escaping (Error?, Any?)->()){
//        let url = ConstantData.GET_QUESTIONS
//        Alamofire.request(url, method: .get, encoding:  JSONEncoding.default).responseJSON { response in
//            switch response.result{
//            case .success(let data):
//                completion(nil, data)
//            case .failure(let error):
//                completion(error, nil)
//            }
//        }
//    }
//
//    func getScores(completion: @escaping (Error?, Any?)->()){
//        let url = ConstantData.GET_SCORES
//        Alamofire.request(url, method: .post, encoding:  JSONEncoding.default).responseJSON { response in
//            switch response.result{
//            case .success(let data):
//                completion(nil, data)
//            case .failure(let error):
//                completion(error, nil)
//            }
//        }
//    }
//
//    func getGlobalScores(completion: @escaping (Error?, Any?)->()){
//        let url = ConstantData.GET_SCORES
//        Alamofire.request(url, method: .post, encoding:  JSONEncoding.default).responseJSON { response in
//            switch response.result{
//            case .success(let data):
//                completion(nil, data)
//            case .failure(let error):
//                completion(error, nil)
//            }
//        }
//    }
//
    
//    func changeDeviceInfo(deviceId: Int, body: [String: Any], completion: @escaping (Error?, Any?)->()) {
//        let url = Constants.EDIT_DEIVE + "?lang=en&user_api_hash=\(GlobalData.user_api_hash)&device_id=\(deviceId)"
//        Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default).responseJSON { response in
//
//            switch response.result {
//            case .success(let JSON):
//                let data = JSON as! NSDictionary
//                completion(nil, data)
//            case .failure(let error):
//                completion(error, nil)
//            }
//        }
//    }
    
    func saveMyScores(body: [String: Any],completion: @escaping (Error?, Any?)->()){
        let url = ConstantData.SAVE_SCORES
        Alamofire.request(url, method: .post, parameters: body, encoding:  JSONEncoding.default).responseJSON { response in
            switch response.result{
            case .success(let data):
                completion(nil, data)
            case .failure(let error):
                completion(error, nil)
            }
        }
    }
    
}
