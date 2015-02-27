//
//  Rating.swift
//  Lecture4
//
//  Created by Caitlin Osbahr on 2/26/15.
//  Copyright (c) 2015 Arun Nagarajan. All rights reserved.
//

import Foundation

enum Rating {
    case Unknown, Like, Dislike
    func getDescription() -> String {
        switch self {
        case .Unknown:
            return "No rating"
        case .Like:
            return "Loved it!"
        case .Dislike:
            return "Hated it!"
        }
    }
}