// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import APIClient

extension Paths {
    public static func year(_ year: Int) -> WithYear {
        WithYear(path: "/\(year)")
    }

    public struct WithYear {
        /// Path: `/{year}`
        public let path: String
    }
}

extension Paths.WithYear {
    public func month(_ month: Int) -> WithJSON {
        WithJSON(path: "\(path)/\(month).json")
    }

    public struct WithJSON {
        /// Path: `/{year}/{month}.json`
        public let path: String

        /// Archive API
        ///
        /// The Archive API provides lists of NYT articles by month going back to 1851.  Simply pass in the year and month you want and it returns a JSON object with all articles for that month.
        public var get: Request<GetResponse> {
            .get(path)
        }

        public struct GetResponse: Decodable {
            public var response: Response?

            public struct Response: Decodable {
                public var docs: [NYTArchiveAPI.Doc]?
                public var meta: Meta?

                public struct Meta: Decodable {
                    public var hits: Int?
                    public var offset: Int?
                    public var time: Int?

                    public init(hits: Int? = nil, offset: Int? = nil, time: Int? = nil) {
                        self.hits = hits
                        self.offset = offset
                        self.time = time
                    }
                }

                public init(docs: [NYTArchiveAPI.Doc]? = nil, meta: Meta? = nil) {
                    self.docs = docs
                    self.meta = meta
                }
            }

            public init(response: Response? = nil) {
                self.response = response
            }
        }
    }
}

public enum Paths {}
