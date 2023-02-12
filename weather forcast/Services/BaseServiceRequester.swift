//
//  BaseServiceRequester.swift
//  weather forcast
//
//  Created by Naphat Sottiyaphai on 12/2/2566 BE.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

public struct RequestConfigs {
    var urlString: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var header: HTTPHeaders?
    var encoding: ParameterEncoding = JSONEncoding.default
    
    public init(urlString: String,
                method: HTTPMethod,
                parameters: Parameters? = nil,
                header: HTTPHeaders? = nil,
                encoding: ParameterEncoding = JSONEncoding.default,
                isRepeat: Bool = true,
                jsonfileName: String? = nil) {
        self.urlString = urlString
        self.method = method
        self.parameters = parameters
        self.header = header
        self.encoding = encoding
    }
}


class BaseServiceRequester {
    
    static public let shared = BaseServiceRequester()
    
    func callRequest<T>(config: RequestConfigs,
                        completionHandler: @escaping (T) -> Void,
                        errorHandler: @escaping (Error) -> Void) where T: Mappable {
        
        guard let url = URL(string: config.urlString) else {
            return
        }
        
        Alamofire.request(url,
                          method: config.method,
                          parameters: config.parameters,
                          encoding: config.encoding,
                          headers: config.header).responseObject { (response: (DataResponse<T>)) in
            var tempHttpBody: String?
            if let httpBody = response.request?.httpBody {
                tempHttpBody = String(data: httpBody, encoding: String.Encoding.utf8)
            }
            
            print("""
            
            ******************************************************
                        
                URL Path :: \(response.request?.url?.description ?? "")
                Request Body :: \(tempHttpBody ?? "")
                Status Code :: \(response.response?.statusCode ?? 0)
                Response Body :: \(response.result.value?.toJSONString(prettyPrint: true) ?? "")
                        
            ******************************************************
            
            """)
            
            switch response.result {
            case .success(let value):
                let responseValue = value as T
                completionHandler(responseValue)
            case .failure(let error):
                errorHandler(error)
            }
        }
    }
}
