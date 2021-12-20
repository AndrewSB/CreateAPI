// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import APIClient

extension Paths {
    public static var geographies: Geographies {
        Geographies(path: "/geographies")
    }

    public struct Geographies {
        /// Path: `/geographies`
        public let path: String
    }
}

extension Paths.Geographies {
    public func geoID(_ geoID: String) -> WithGeoID {
        WithGeoID(path: "\(path)/\(geoID)")
    }

    public struct WithGeoID {
        /// Path: `/geographies/{geo-id}`
        public let path: String
    }
}

extension Paths.Geographies.WithGeoID {
    public var media: Media {
        Media(path: path + "/media")
    }

    public struct Media {
        /// Path: `/geographies/{geo-id}/media`
        public let path: String
    }
}

extension Paths.Geographies.WithGeoID.Media {
    public var recent: Recent {
        Recent(path: path + "/recent")
    }

    public struct Recent {
        /// Path: `/geographies/{geo-id}/media/recent`
        public let path: String

        /// Get recent media from a custom geo-id.
        ///
        /// Get recent media from a geography subscription that you created.
        /// 
        /// **Note:** You can only access Geographies that were explicitly created by your OAuth client. Check the
        /// Geography Subscriptions section of the [real-time updates page](https://instagram.com/developer/realtime/).
        /// When you create a subscription to some geography that you define, you will be returned a unique `geo-id` that
        /// can be used in this query. To backfill photos from the location covered by this geography, use the
        /// [media search endpoint](https://instagram.com/developer/endpoints/media/).
        /// 
        /// **Warning:** [Deprecated](http://instagram.com/developer/changelog/) for Apps created **on or after** Nov 17, 2015
        @available(*, deprecated, message: "Deprecated")
        public func get(count: Int? = nil, minID: String? = nil) -> Request<InstagramAPI.MediaListResponse> {
            .get(path, query: makeGetQuery(count, minID))
        }

        private func makeGetQuery(_ count: Int?, _ minID: String?) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("count", count?.asQueryValue)
            query.addQueryItem("min_id", minID?.asQueryValue)
            return query
        }
    }
}

extension Paths {
    public static var locations: Locations {
        Locations(path: "/locations")
    }

    public struct Locations {
        /// Path: `/locations`
        public let path: String
    }
}

extension Paths.Locations {
    public var search: Search {
        Search(path: path + "/search")
    }

    public struct Search {
        /// Path: `/locations/search`
        public let path: String

        /// Search for a location by geographic coordinate.
        public func get(parameters: GetParameters? = nil) -> Request<InstagramAPI.LocationSearchResponse> {
            .get(path, query: parameters?.asQuery())
        }

        public struct GetParameters {
            public var distance: Int?
            public var facebookPlacesID: String?
            public var foursquareID: String?
            public var lat: Double?
            public var lng: Double?
            public var foursquareV2ID: String?

            public init(distance: Int? = nil, facebookPlacesID: String? = nil, foursquareID: String? = nil, lat: Double? = nil, lng: Double? = nil, foursquareV2ID: String? = nil) {
                self.distance = distance
                self.facebookPlacesID = facebookPlacesID
                self.foursquareID = foursquareID
                self.lat = lat
                self.lng = lng
                self.foursquareV2ID = foursquareV2ID
            }

            public func asQuery() -> [(String, String?)] {
                var query: [(String, String?)] = []
                query.addQueryItem("distance", distance?.asQueryValue)
                query.addQueryItem("facebook_places_id", facebookPlacesID?.asQueryValue)
                query.addQueryItem("foursquare_id", foursquareID?.asQueryValue)
                query.addQueryItem("lat", lat?.asQueryValue)
                query.addQueryItem("lng", lng?.asQueryValue)
                query.addQueryItem("foursquare_v2_id", foursquareV2ID?.asQueryValue)
                return query
            }
        }
    }
}

extension Paths.Locations {
    public func locationID(_ locationID: String) -> WithLocationID {
        WithLocationID(path: "\(path)/\(locationID)")
    }

    public struct WithLocationID {
        /// Path: `/locations/{location-id}`
        public let path: String

        /// Get information about a location.
        public var get: Request<InstagramAPI.LocationInfoResponse> {
            .get(path)
        }
    }
}

extension Paths.Locations.WithLocationID {
    public var media: Media {
        Media(path: path + "/media")
    }

    public struct Media {
        /// Path: `/locations/{location-id}/media`
        public let path: String
    }
}

extension Paths.Locations.WithLocationID.Media {
    public var recent: Recent {
        Recent(path: path + "/recent")
    }

    public struct Recent {
        /// Path: `/locations/{location-id}/media/recent`
        public let path: String

        /// Get a list of recent media objects from a given location.
        public func get(parameters: GetParameters? = nil) -> Request<InstagramAPI.MediaListResponse> {
            .get(path, query: parameters?.asQuery())
        }

        public struct GetParameters {
            public var minTimestamp: Int?
            public var maxTimestamp: Int?
            public var minID: String?
            public var maxID: String?

            public init(minTimestamp: Int? = nil, maxTimestamp: Int? = nil, minID: String? = nil, maxID: String? = nil) {
                self.minTimestamp = minTimestamp
                self.maxTimestamp = maxTimestamp
                self.minID = minID
                self.maxID = maxID
            }

            public func asQuery() -> [(String, String?)] {
                var query: [(String, String?)] = []
                query.addQueryItem("min_timestamp", minTimestamp?.asQueryValue)
                query.addQueryItem("max_timestamp", maxTimestamp?.asQueryValue)
                query.addQueryItem("min_id", minID?.asQueryValue)
                query.addQueryItem("max_id", maxID?.asQueryValue)
                return query
            }
        }
    }
}

extension Paths {
    public static var media: Media {
        Media(path: "/media")
    }

    public struct Media {
        /// Path: `/media`
        public let path: String
    }
}

extension Paths.Media {
    public var popular: Popular {
        Popular(path: path + "/popular")
    }

    public struct Popular {
        /// Path: `/media/popular`
        public let path: String

        /// Get a list of currently popular media.
        ///
        /// Get a list of what media is most popular at the moment. Can return mix of `image` and `video` types.
        /// 
        /// **Warning:** [Deprecated](http://instagram.com/developer/changelog/) for Apps created **on or after** Nov 17, 2015
        @available(*, deprecated, message: "Deprecated")
        public var get: Request<InstagramAPI.MediaSearchResponse> {
            .get(path)
        }
    }
}

extension Paths.Media {
    public var search: Search {
        Search(path: path + "/search")
    }

    public struct Search {
        /// Path: `/media/search`
        public let path: String

        /// Search for media in a given area.
        ///
        /// Search for media in a given area. The default time span is set to 5 days. The time span must not exceed 7 days.
        /// Defaults time stamps cover the last 5 days. Can return mix of `image` and `video` types.
        public func get(parameters: GetParameters) -> Request<InstagramAPI.MediaSearchResponse> {
            .get(path, query: parameters.asQuery())
        }

        public struct GetParameters {
            public var lat: Double
            public var lng: Double
            public var minTimestamp: Int?
            public var maxTimestamp: Int?
            public var distance: Int?

            public init(lat: Double, lng: Double, minTimestamp: Int? = nil, maxTimestamp: Int? = nil, distance: Int? = nil) {
                self.lat = lat
                self.lng = lng
                self.minTimestamp = minTimestamp
                self.maxTimestamp = maxTimestamp
                self.distance = distance
            }

            public func asQuery() -> [(String, String?)] {
                var query: [(String, String?)] = []
                query.addQueryItem("lat", lat.asQueryValue)
                query.addQueryItem("lng", lng.asQueryValue)
                query.addQueryItem("min_timestamp", minTimestamp?.asQueryValue)
                query.addQueryItem("max_timestamp", maxTimestamp?.asQueryValue)
                query.addQueryItem("distance", distance?.asQueryValue)
                return query
            }
        }
    }
}

extension Paths.Media {
    public var shortcode: Shortcode {
        Shortcode(path: path + "/shortcode")
    }

    public struct Shortcode {
        /// Path: `/media/shortcode`
        public let path: String
    }
}

extension Paths.Media.Shortcode {
    public func shortcode(_ shortcode: String) -> WithShortcode {
        WithShortcode(path: "\(path)/\(shortcode)")
    }

    public struct WithShortcode {
        /// Path: `/media/shortcode/{shortcode}`
        public let path: String

        /// Get information about a media object.
        ///
        /// This endpoint returns the same response as `GET /media/{media-id}`.
        /// 
        /// A media object's shortcode can be found in its shortlink URL. An example shortlink is
        /// `http://instagram.com/p/D/`, its corresponding shortcode is `D`.
        public var get: Request<InstagramAPI.MediaEntryResponse> {
            .get(path)
        }
    }
}

extension Paths.Media {
    public func mediaID(_ mediaID: String) -> WithMediaID {
        WithMediaID(path: "\(path)/\(mediaID)")
    }

    public struct WithMediaID {
        /// Path: `/media/{media-id}`
        public let path: String

        /// Get information about a media object.
        ///
        /// Get information about a media object. The returned type key will allow you to differentiate between image and
        /// video media.
        /// 
        /// **Note:** if you authenticate with an OAuth Token, you will receive the user_has_liked key which quickly tells
        /// you whether the current user has liked this media item.
        public var get: Request<InstagramAPI.MediaEntryResponse> {
            .get(path)
        }
    }
}

extension Paths.Media.WithMediaID {
    public var comments: Comments {
        Comments(path: path + "/comments")
    }

    public struct Comments {
        /// Path: `/media/{media-id}/comments`
        public let path: String

        /// Get a list of recent comments on a media object.
        public var get: Request<InstagramAPI.CommentsResponse> {
            .get(path)
        }

        /// Create a comment on a media object.
        ///
        /// Create a comment on a media object with the following rules:
        /// 
        ///   * The total length of the comment cannot exceed 300 characters.
        ///   * The comment cannot contain more than 4 hashtags.
        ///   * The comment cannot contain more than 1 URL.
        ///   * The comment cannot consist of all capital letters.
        public func post(text: String) -> Request<InstagramAPI.StatusResponse> {
            .post(path, query: makePostQuery(text))
        }

        private func makePostQuery(_ text: String) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("text", text.asQueryValue)
            return query
        }
    }
}

extension Paths.Media.WithMediaID.Comments {
    public func commentID(_ commentID: String) -> WithCommentID {
        WithCommentID(path: "\(path)/\(commentID)")
    }

    public struct WithCommentID {
        /// Path: `/media/{media-id}/comments/{comment-id}`
        public let path: String

        /// Remove a comment.
        ///
        /// Remove a comment either on the authenticated user's media object or authored by the authenticated user.
        public var delete: Request<InstagramAPI.StatusResponse> {
            .delete(path)
        }
    }
}

extension Paths.Media.WithMediaID {
    public var likes: Likes {
        Likes(path: path + "/likes")
    }

    public struct Likes {
        /// Path: `/media/{media-id}/likes`
        public let path: String

        /// Get a list of users who have liked this media.
        public var get: Request<InstagramAPI.UsersInfoResponse> {
            .get(path)
        }

        /// Set a like on this media by the current user.
        ///
        /// Set a like on this media by the currently authenticated user.
        public var post: Request<InstagramAPI.StatusResponse> {
            .post(path)
        }

        /// Remove a like on this media by the current user.
        ///
        /// Remove a like on this media by the currently authenticated user.
        public var delete: Request<InstagramAPI.StatusResponse> {
            .delete(path)
        }
    }
}

extension Paths {
    public static var tags: Tags {
        Tags(path: "/tags")
    }

    public struct Tags {
        /// Path: `/tags`
        public let path: String
    }
}

extension Paths.Tags {
    public var search: Search {
        Search(path: path + "/search")
    }

    public struct Search {
        /// Path: `/tags/search`
        public let path: String

        /// Search for tags by name.
        public func get(q: String) -> Request<InstagramAPI.TagSearchResponse> {
            .get(path, query: makeGetQuery(q))
        }

        private func makeGetQuery(_ q: String) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("q", q.asQueryValue)
            return query
        }
    }
}

extension Paths.Tags {
    public func tagName(_ tagName: String) -> WithTagName {
        WithTagName(path: "\(path)/\(tagName)")
    }

    public struct WithTagName {
        /// Path: `/tags/{tag-name}`
        public let path: String

        /// Get information about a tag object.
        public var get: Request<InstagramAPI.TagInfoResponse> {
            .get(path)
        }
    }
}

extension Paths.Tags.WithTagName {
    public var media: Media {
        Media(path: path + "/media")
    }

    public struct Media {
        /// Path: `/tags/{tag-name}/media`
        public let path: String
    }
}

extension Paths.Tags.WithTagName.Media {
    public var recent: Recent {
        Recent(path: path + "/recent")
    }

    public struct Recent {
        /// Path: `/tags/{tag-name}/media/recent`
        public let path: String

        /// Get a list of recently tagged media.
        ///
        /// Get a list of recently tagged media. Use the `max_tag_id` and `min_tag_id` parameters in the pagination
        /// response to paginate through these objects.
        public func get(parameters: GetParameters? = nil) -> Request<InstagramAPI.TagMediaListResponse> {
            .get(path, query: parameters?.asQuery())
        }

        public struct GetParameters {
            public var count: Int?
            public var minTagID: String?
            public var maxTagID: String?

            public init(count: Int? = nil, minTagID: String? = nil, maxTagID: String? = nil) {
                self.count = count
                self.minTagID = minTagID
                self.maxTagID = maxTagID
            }

            public func asQuery() -> [(String, String?)] {
                var query: [(String, String?)] = []
                query.addQueryItem("count", count?.asQueryValue)
                query.addQueryItem("min_tag_id", minTagID?.asQueryValue)
                query.addQueryItem("max_tag_id", maxTagID?.asQueryValue)
                return query
            }
        }
    }
}

extension Paths {
    public static var users: Users {
        Users(path: "/users")
    }

    public struct Users {
        /// Path: `/users`
        public let path: String
    }
}

extension Paths.Users {
    public var search: Search {
        Search(path: path + "/search")
    }

    public struct Search {
        /// Path: `/users/search`
        public let path: String

        /// Search for a user by name.
        public func get(q: String, count: Int? = nil) -> Request<InstagramAPI.UsersInfoResponse> {
            .get(path, query: makeGetQuery(q, count))
        }

        private func makeGetQuery(_ q: String, _ count: Int?) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("q", q.asQueryValue)
            query.addQueryItem("count", count?.asQueryValue)
            return query
        }
    }
}

extension Paths.Users {
    public var this: `Self` {
        `Self`(path: path + "/self")
    }

    public struct `Self` {
        /// Path: `/users/self`
        public let path: String
    }
}

extension Paths.Users.`Self` {
    public var feed: Feed {
        Feed(path: path + "/feed")
    }

    public struct Feed {
        /// Path: `/users/self/feed`
        public let path: String

        /// See the authenticated user's feed.
        ///
        /// See the authenticated user's feed.
        /// 
        /// **Warning:** [Deprecated](http://instagram.com/developer/changelog/) for Apps created **on or after** Nov 17, 2015
        @available(*, deprecated, message: "Deprecated")
        public func get(parameters: GetParameters? = nil) -> Request<InstagramAPI.MediaListResponse> {
            .get(path, query: parameters?.asQuery())
        }

        public struct GetParameters {
            public var count: Int?
            public var minID: String?
            public var maxID: String?

            public init(count: Int? = nil, minID: String? = nil, maxID: String? = nil) {
                self.count = count
                self.minID = minID
                self.maxID = maxID
            }

            public func asQuery() -> [(String, String?)] {
                var query: [(String, String?)] = []
                query.addQueryItem("count", count?.asQueryValue)
                query.addQueryItem("min_id", minID?.asQueryValue)
                query.addQueryItem("max_id", maxID?.asQueryValue)
                return query
            }
        }
    }
}

extension Paths.Users.`Self` {
    public var media: Media {
        Media(path: path + "/media")
    }

    public struct Media {
        /// Path: `/users/self/media`
        public let path: String
    }
}

extension Paths.Users.`Self`.Media {
    public var liked: Liked {
        Liked(path: path + "/liked")
    }

    public struct Liked {
        /// Path: `/users/self/media/liked`
        public let path: String

        /// See the list of media liked by the authenticated user.
        ///
        /// See the list of media liked by the authenticated user. Private media is returned as long as the authenticated
        /// user has permission to view that media. Liked media lists are only available for the currently authenticated
        /// user.
        public func get(count: Int? = nil, maxLikeID: String? = nil) -> Request<InstagramAPI.MediaListResponse> {
            .get(path, query: makeGetQuery(count, maxLikeID))
        }

        private func makeGetQuery(_ count: Int?, _ maxLikeID: String?) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("count", count?.asQueryValue)
            query.addQueryItem("max_like_id", maxLikeID?.asQueryValue)
            return query
        }
    }
}

extension Paths.Users.`Self` {
    public var requestedBy: RequestedBy {
        RequestedBy(path: path + "/requested-by")
    }

    public struct RequestedBy {
        /// Path: `/users/self/requested-by`
        public let path: String

        /// List the users who have requested this user's permission to follow.
        public var get: Request<InstagramAPI.UsersInfoResponse> {
            .get(path)
        }
    }
}

extension Paths.Users {
    public func userID(_ userID: String) -> WithUserID {
        WithUserID(path: "\(path)/\(userID)")
    }

    public struct WithUserID {
        /// Path: `/users/{user-id}`
        public let path: String

        /// Get basic information about a user.
        ///
        /// Get basic information about a user. To get information about the owner of the access token, you can use
        /// **self** instead of the `user-id`.
        /// 
        /// Security scope `public_content` is required to read information about other users.
        public var get: Request<InstagramAPI.UserResponse> {
            .get(path)
        }
    }
}

extension Paths.Users.WithUserID {
    public var followedBy: FollowedBy {
        FollowedBy(path: path + "/followed-by")
    }

    public struct FollowedBy {
        /// Path: `/users/{user-id}/followed-by`
        public let path: String

        /// Get the list of users this user is followed by.
        ///
        /// Get the list of users this user is followed by. To get users followed by the owner of the access token, you
        /// can use **self** instead of the `user-id`.
        public var get: Request<InstagramAPI.UsersPagingResponse> {
            .get(path)
        }
    }
}

extension Paths.Users.WithUserID {
    public var follows: Follows {
        Follows(path: path + "/follows")
    }

    public struct Follows {
        /// Path: `/users/{user-id}/follows`
        public let path: String

        /// Get the list of users this user follows.
        ///
        /// Get the list of users this user follows. To get follows of the owner of the access token, you can use **self**
        /// instead of the `user-id`.
        public var get: Request<InstagramAPI.UsersPagingResponse> {
            .get(path)
        }
    }
}

extension Paths.Users.WithUserID {
    public var media: Media {
        Media(path: path + "/media")
    }

    public struct Media {
        /// Path: `/users/{user-id}/media`
        public let path: String
    }
}

extension Paths.Users.WithUserID.Media {
    public var recent: Recent {
        Recent(path: path + "/recent")
    }

    public struct Recent {
        /// Path: `/users/{user-id}/media/recent`
        public let path: String

        /// Get the most recent media published by a user.
        ///
        /// Get the most recent media published by a user. To get the most recent media published by the owner of the
        /// access token, you can use **self** instead of the `user-id`.
        /// 
        /// Security scope `public_content` is required to read information about other users.
        public func get(parameters: GetParameters? = nil) -> Request<InstagramAPI.MediaListResponse> {
            .get(path, query: parameters?.asQuery())
        }

        public struct GetParameters {
            public var count: Int?
            public var maxTimestamp: Int?
            public var minTimestamp: Int?
            public var minID: String?
            public var maxID: String?

            public init(count: Int? = nil, maxTimestamp: Int? = nil, minTimestamp: Int? = nil, minID: String? = nil, maxID: String? = nil) {
                self.count = count
                self.maxTimestamp = maxTimestamp
                self.minTimestamp = minTimestamp
                self.minID = minID
                self.maxID = maxID
            }

            public func asQuery() -> [(String, String?)] {
                var query: [(String, String?)] = []
                query.addQueryItem("count", count?.asQueryValue)
                query.addQueryItem("max_timestamp", maxTimestamp?.asQueryValue)
                query.addQueryItem("min_timestamp", minTimestamp?.asQueryValue)
                query.addQueryItem("min_id", minID?.asQueryValue)
                query.addQueryItem("max_id", maxID?.asQueryValue)
                return query
            }
        }
    }
}

extension Paths.Users.WithUserID {
    public var relationship: Relationship {
        Relationship(path: path + "/relationship")
    }

    public struct Relationship {
        /// Path: `/users/{user-id}/relationship`
        public let path: String

        /// Get information about a relationship to another user.
        public var get: Request<InstagramAPI.RelationshipResponse> {
            .get(path)
        }

        /// Modify the relationship between the current user and the target user.
        public func post(action: Action) -> Request<InstagramAPI.RelationshipPostResponse> {
            .post(path, query: makePostQuery(action))
        }

        private func makePostQuery(_ action: Action) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("action", action.asQueryValue)
            return query
        }

        public enum Action: String, Codable, CaseIterable {
            case follow
            case unfollow
            case block
            case unblock
            case approve
            case ignore
        }
    }
}

public enum Paths {}

extension Bool {
    var asQueryValue: String {
        self ? "true" : "false"
    }
}

extension Date {
    var asQueryValue: String {
        ISO8601DateFormatter().string(from: self)
    }
}

extension Double {
    var asQueryValue: String {
        String(self)
    }
}

extension Int {
    var asQueryValue: String {
        String(self)
    }
}

extension Int32 {
    var asQueryValue: String {
        String(self)
    }
}

extension Int64 {
    var asQueryValue: String {
        String(self)
    }
}

extension String {
    var asQueryValue: String {
        self
    }
}

extension URL {
    var asQueryValue: String {
        absoluteString
    }
}

extension RawRepresentable where RawValue == String {
    var asQueryValue: String {
        rawValue
    }
}

extension Array where Element == (String, String?) {
    mutating func addQueryItem(_ name: String, _ value: String?) {
        guard let value = value, !value.isEmpty else { return }
        append((name, value))
    }

    var asPercentEncodedQuery: String {
        var components = URLComponents()
        components.queryItems = self.map(URLQueryItem.init)
        return components.percentEncodedQuery ?? ""
    }
}
