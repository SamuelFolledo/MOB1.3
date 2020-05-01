//
//  Request.swift
//  Moviefy
//
//  Created by Macbook Pro 15 on 4/29/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation

public struct Request {
    let builder: RequestBuilder
    let completion: (Result<Data, Error>) -> Void

    init(builder: RequestBuilder, completion: @escaping (Result<Data, Error>) -> Void) {
        self.builder = builder
        print("Builder is \(builder)")
        self.completion = completion
    }
    
    public static func basic(method: HTTPMethod = .get, baseURL: URL, path: String, params: [URLQueryItem]? = nil, completion: @escaping (Result<Data, Error>) -> Void) -> Request {
        let builder = BasicRequestBuilder(method: method, baseURL: baseURL, path: path, params: params)
        return Request(builder: builder, completion: completion)
    }
}

extension Request {
    static func popularMovies(completion: @escaping (Result<PagedResults<Movie>, Error>) -> Void) -> Request {
        Request.basic(baseURL: MovieDB.baseURL, path: "discover/movie", params: [
            URLQueryItem(name: "sort_by", value: "popularity.desc")
        ]) { result in
          //we need to take the result and decode the response JSON into our expected type
            result.decoding(PagedResults<Movie>.self, completion: completion) //This now reads as: take the result, decode into this type (PagedResults), then call this completion block.
        }
    }
    
    static func upcomingMovies(completion: @escaping (Result<PagedResults<Movie>, Error>) -> Void) -> Request {
        Request.basic(baseURL: MovieDB.baseURL, path: "movie/upcoming", params: [
//            URLQueryItem(name: "sort_by", value: "popularity.desc")
        ]) { result in
            result.decoding(PagedResults<Movie>.self, completion: completion)
        }
    }
    
    static func configuration(completion: @escaping (Result<ConfigurationResults<MovieDBConfiguration.Images>, Error>) -> Void) -> Request {
            Request.basic(baseURL: MovieDB.baseURL, path: "configuration") { result in
                result.decoding(ConfigurationResults<MovieDBConfiguration.Images>.self, completion: completion)
            }
        }
}

public extension Result where Success == Data, Failure == Error {
    func decoding<M: ModelProtocol>(_ model: M.Type, completion: @escaping (Result<M, Error>) -> Void) {
      // decode the JSON in the background and call the completion block on the main thread
      DispatchQueue.global().async {
            //Result’s flatMap() method takes the successful case (if it was successful) and applies your block. You can return a new Result that contains a successful value or an error.
            let result = self.flatMap { data -> Result<M, Error> in
                do {
//                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
//                    print(data, "JSON ERROR RESULT=", jsonResult)
                    let decoder = M.decoder
                    let model = try decoder.decode(M.self, from: data)
                    return .success(model)
                } catch {
                    return .failure(error)
                }
            }
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
