//
//  NetworkLayer.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/20/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit

enum PhotoFetchResult {
    case success([Photo])
    case failure(Error)
}

enum ImageFetchResult {
    case success(UIImage)
    case failure(Error)
}

enum FlickrAPIError: Error {
    case invalidJSONData
}

enum ImageRequestError: Error {
    case imageCreationError
}

struct PhotoNetworkLayer {
    
    //TODO: Insert your API Key here
    static private let APIKey = "f8df0594dd8c418e60514553a08ea56a"
    static private let baseURLString = "https://api.flickr.com/services/rest"
    static private let flickrMethod = "flickr.interestingness.getList"
    
    static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    static func processImageRequest(data: Data?, error: Error?) -> ImageFetchResult {
        guard
            let imageData = data,
            let image = UIImage(data: imageData) else {                
                // Could not create an image from data
                if data == nil {
                    return .failure(error!)
                } else {
                    return .failure(ImageRequestError.imageCreationError)
                }
        }
        return .success(image)
    }
    
    static func fetchImage(for photo: Photo, completion: @escaping (ImageFetchResult) -> Void) {
        guard let photoURL = photo.remoteURL else {
            preconditionFailure("Photo expected to have a remote URL.")
        }
        let request = URLRequest(url: photoURL)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            let result = self.processImageRequest(data: data, error: error)
            
            OperationQueue.main.addOperation { //addOperation = Wraps the specified block in an operation and adds it to the receiver.
                completion(result)
            }
        }
        task.resume()
    }
    
    static func fetchPhotos(completion: @escaping (PhotoFetchResult) -> Void) {
        let url = urlBuilder(parameters: ["extras": "url_h,date_taken"])
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) -> Void in
            let result = self.processPhotoFetchRequest(data: data, error: error)
            OperationQueue.main.addOperation { //
                completion(result)
            }
        })
        task.resume()
    }
    
    static private func urlBuilder(parameters: [String:String]?) -> URL {
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        let baseParams = [
            "method": flickrMethod,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": APIKey
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.url!
    }
    
    static private func processPhotoFetchRequest(data: Data?, error: Error?) -> PhotoFetchResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return self.photoItems(fromJSON: jsonData)
    }
    
    static func photoItems(fromJSON data: Data) -> PhotoFetchResult {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            guard
                let jsonDict = jsonObject as? [AnyHashable:Any],
                let photos = jsonDict["photos"] as? [String:Any],
                let photosArray = photos["photo"] as? [[String:Any]] else {
                    
                    // The JSON structure is not correct
                    return .failure(FlickrAPIError.invalidJSONData)
            }
            
            var processedPhotos = [Photo]()
            
            for jsonPhoto in photosArray {
                if let photo = createPhotoItem(fromJSON: jsonPhoto ) {
                    processedPhotos.append(photo)
                }
            }
            if processedPhotos.isEmpty && !photosArray.isEmpty {
                // unable to parse Photo items. Maybe the JSON formatting has changed
                return .failure(FlickrAPIError.invalidJSONData)
            }
            return .success(processedPhotos)
        } catch let error {
            return .failure(error)
        }
    }
    
    static private func createPhotoItem(fromJSON json: [String : Any]) -> Photo? {
        guard
            let title = json["title"] as? String,
            let dateAsString = json["datetaken"] as? String,
            let photoID  = json["id"] as? String,
            let photoUrlAsString = json["url_h"] as? String,
            let url = URL(string: photoUrlAsString),
            let dateTaken = dateFormatter.date(from: dateAsString) else {
                // Not enough info to construct a PhotoItem
                return nil
        }
        return Photo(title: title, dateTaken: dateTaken as NSDate, photoID: photoID, remoteURL: url)
    }
}
