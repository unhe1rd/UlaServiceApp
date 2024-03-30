//
//  MainManager.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 30.03.2024.
//

//import Alamofire
//import Foundation
//
//
//protocol NetworkManagerDescription {
//    func request(_ url: String ,completion: @escaping (DataResponse<Data, AFError>) -> Void)
//}
//
//class AlamofireNetworkManager: NetworkManagerDescription {
//    func request(_ url: String, completion: @escaping (DataResponse<Data, AFError>) -> Void) {
//        AF.request(url, headers: .init()).validate().responseData(completionHandler: completion)
//    }
//    
//}
//
//final class MainNetworkManager {
//    static let shared = MainNetworkManager()
//    private init() {}
//    
//    let baseURL = MainNetworkConstants.baseUrl
//    let networkManager = AlamofireNetworkManager()
//    
//    func fetchData(completion: @escaping (Result<MainNetworkResponse, Error>) -> Void){
//        networkManager.request(baseURL) { response in
//            
//            switch response.result {
//            case .success(let data):
//                do {
//                    let services = try JSONDecoder().decode(MainNetworkResponse.self, from: data)
//                    completion(.success(services))
//                } catch {
//                    completion(.failure(error))
//                }
//            case .failure(let error):
//                if let urlError = error.underlyingError as? URLError, urlError.code == .cancelled {
//                } else {
//                    completion(.failure(error))
//                }
//            }
//            
//        }
//    }
//}


import Alamofire
import Foundation

protocol NetworkManagerDescription {
    func request(_ url: String, cachePolicy: URLRequest.CachePolicy, completion: @escaping (DataResponse<Data, AFError>) -> Void)
}

class AlamofireNetworkManager: NetworkManagerDescription {
    func request(_ url: String, cachePolicy: URLRequest.CachePolicy, completion: @escaping (DataResponse<Data, AFError>) -> Void) {
        let request = AF.request(url, headers: .init()).validate().responseData(completionHandler: completion)
    }
}

final class MainNetworkManager {
    static let shared = MainNetworkManager()
    private init() {}

    let baseURL = MainNetworkConstants.baseUrl
    let networkManager = AlamofireNetworkManager()
    
    func fetchData(completion: @escaping (Result<MainNetworkResponse, Error>) -> Void) {
        let cachePolicy: URLRequest.CachePolicy = .returnCacheDataElseLoad
        print(baseURL)
        networkManager.request(baseURL, cachePolicy: cachePolicy) { response in
            switch response.result {
            case .success(let data):
                do {
                    let services = try JSONDecoder().decode(MainNetworkResponse.self, from: data)
                    completion(.success(services))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                if let urlError = error.underlyingError as? URLError, urlError.code == .cancelled {
                } else {
                    completion(.failure(error))
                }
            }
        }
    }
}
