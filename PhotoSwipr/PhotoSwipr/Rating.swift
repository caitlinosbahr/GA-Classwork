import Foundation

enum Rating {
    case Unknown, Like, Dislike
    
    func getDescription() -> String {
        switch self {
        case .Unknown:
            return "Unknown"
        case .Like:
            return "👍 Loved it"
        case .Dislike:
            return "🐽 Hated it"
        }
    }
}
