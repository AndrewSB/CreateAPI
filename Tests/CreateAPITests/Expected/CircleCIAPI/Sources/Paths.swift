// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import APIClient
import HTTPHeaders

extension Paths {
    public static var me: Me {
        Me(path: "/me")
    }

    public struct Me {
        /// Path: `/me`
        public let path: String

        /// Provides information about the signed in user.
        public var get: Request<CircleCIAPI.User> {
            .get(path)
        }
    }
}

extension Paths {
    public static var project: Project {
        Project(path: "/project")
    }

    public struct Project {
        /// Path: `/project`
        public let path: String
    }
}

extension Paths.Project {
    public func username(_ username: String) -> WithUsername {
        WithUsername(path: "\(path)/\(username)")
    }

    public struct WithUsername {
        /// Path: `/project/{username}`
        public let path: String
    }
}

extension Paths.Project.WithUsername {
    public func project(_ project: String) -> WithProject {
        WithProject(path: "\(path)/\(project)")
    }

    public struct WithProject {
        /// Path: `/project/{username}/{project}`
        public let path: String

        /// Build summary for each of the last 30 builds for a single git repo.
        public func get(parameters: GetParameters? = nil) -> Request<[CircleCIAPI.Build]> {
            .get(path, query: parameters?.asQuery())
        }

        public struct GetParameters {
            public var limit: Int?
            public var offset: Int?
            public var filter: Filter?

            public enum Filter: String, Codable, CaseIterable {
                case completed
                case successful
                case failed
                case running
            }

            public init(limit: Int? = nil, offset: Int? = nil, filter: Filter? = nil) {
                self.limit = limit
                self.offset = offset
                self.filter = filter
            }

            public func asQuery() -> [(String, String?)] {
                var query: [(String, String?)] = []
                query.addQueryItem("limit", limit?.asQueryValue)
                query.addQueryItem("offset", offset?.asQueryValue)
                query.addQueryItem("filter", filter?.asQueryValue)
                return query
            }
        }

        /// Triggers a new build, returns a summary of the build.
        public func post(_ body: PostRequest? = nil) -> Request<CircleCIAPI.BuildSummary> {
            .post(path, body: body)
        }

        public struct PostRequest: Encodable {
            /// Additional environment variables to inject into the build environment. A map of names to values.
            public var buildParameters: CircleCIAPI.BuildParameters?
            /// The number of containers to use to run the build. Default is null and the project default is used.
            public var parallel: String?
            /// The specific revision to build.
            /// Default is null and the head of the branch is used. Cannot be used with tag parameter.
            public var revision: String?
            /// The tag to build. Default is null. Cannot be used with revision parameter.
            public var tag: String?

            public init(buildParameters: CircleCIAPI.BuildParameters? = nil, parallel: String? = nil, revision: String? = nil, tag: String? = nil) {
                self.buildParameters = buildParameters
                self.parallel = parallel
                self.revision = revision
                self.tag = tag
            }

            private enum CodingKeys: String, CodingKey {
                case buildParameters = "build_parameters"
                case parallel
                case revision
                case tag
            }
        }
    }
}

extension Paths.Project.WithUsername.WithProject {
    public var buildCache: BuildCache {
        BuildCache(path: path + "/build-cache")
    }

    public struct BuildCache {
        /// Path: `/project/{username}/{project}/build-cache`
        public let path: String

        /// Clears the cache for a project.
        public var delete: Request<DeleteResponse> {
            .delete(path)
        }

        public struct DeleteResponse: Decodable {
            public var status: String?

            public init(status: String? = nil) {
                self.status = status
            }
        }
    }
}

extension Paths.Project.WithUsername.WithProject {
    public var checkoutKey: CheckoutKey {
        CheckoutKey(path: path + "/checkout-key")
    }

    public struct CheckoutKey {
        /// Path: `/project/{username}/{project}/checkout-key`
        public let path: String

        /// Lists checkout keys.
        public var get: Request<[CircleCIAPI.Key]> {
            .get(path)
        }

        /// Creates a new checkout key.
        /// Only usable with a user API token.
        public func post(_ body: String? = nil) -> Request<CircleCIAPI.Key> {
            .post(path, body: body)
        }
    }
}

extension Paths.Project.WithUsername.WithProject.CheckoutKey {
    public func fingerprint(_ fingerprint: String) -> WithFingerprint {
        WithFingerprint(path: "\(path)/\(fingerprint)")
    }

    public struct WithFingerprint {
        /// Path: `/project/{username}/{project}/checkout-key/{fingerprint}`
        public let path: String

        /// Get a checkout key.
        public var get: Request<CircleCIAPI.Key> {
            .get(path)
        }

        /// Delete a checkout key.
        public var delete: Request<DeleteResponse> {
            .delete(path)
        }

        public struct DeleteResponse: Decodable {
            public var message: Message?

            public enum Message: String, Codable, CaseIterable {
                case ok = "OK"
            }

            public init(message: Message? = nil) {
                self.message = message
            }
        }
    }
}

extension Paths.Project.WithUsername.WithProject {
    public var envvar: Envvar {
        Envvar(path: path + "/envvar")
    }

    public struct Envvar {
        /// Path: `/project/{username}/{project}/envvar`
        public let path: String

        /// Lists the environment variables for :project
        public var get: Request<[CircleCIAPI.Envvar]> {
            .get(path)
        }

        /// Creates a new environment variable
        public var post: Request<CircleCIAPI.Envvar> {
            .post(path)
        }
    }
}

extension Paths.Project.WithUsername.WithProject.Envvar {
    public func name(_ name: String) -> WithName {
        WithName(path: "\(path)/\(name)")
    }

    public struct WithName {
        /// Path: `/project/{username}/{project}/envvar/{name}`
        public let path: String

        /// Gets the hidden value of environment variable :name
        public var get: Request<CircleCIAPI.Envvar> {
            .get(path)
        }

        /// Deletes the environment variable named ':name'
        public var delete: Request<DeleteResponse> {
            .delete(path)
        }

        public struct DeleteResponse: Decodable {
            public var message: Message?

            public enum Message: String, Codable, CaseIterable {
                case ok = "OK"
            }

            public init(message: Message? = nil) {
                self.message = message
            }
        }
    }
}

extension Paths.Project.WithUsername.WithProject {
    public var sshKey: SshKey {
        SshKey(path: path + "/ssh-key")
    }

    public struct SshKey {
        /// Path: `/project/{username}/{project}/ssh-key`
        public let path: String

        /// Create an ssh key used to access external systems that require SSH key-based authentication
        public func post(_ body: PostRequest) -> Request<PostResponse> {
            .post(path, body: body)
        }

        public struct PostResponse: Decodable {
            public var message: String?

            public init(message: String? = nil) {
                self.message = message
            }
        }

        public struct PostRequest: Encodable {
            public var hostname: String?
            public var privateKey: String?

            public init(hostname: String? = nil, privateKey: String? = nil) {
                self.hostname = hostname
                self.privateKey = privateKey
            }

            private enum CodingKeys: String, CodingKey {
                case hostname
                case privateKey = "private_key"
            }
        }
    }
}

extension Paths.Project.WithUsername.WithProject {
    public var tree: Tree {
        Tree(path: path + "/tree")
    }

    public struct Tree {
        /// Path: `/project/{username}/{project}/tree`
        public let path: String
    }
}

extension Paths.Project.WithUsername.WithProject.Tree {
    public func branch(_ branch: String) -> WithBranch {
        WithBranch(path: "\(path)/\(branch)")
    }

    public struct WithBranch {
        /// Path: `/project/{username}/{project}/tree/{branch}`
        public let path: String

        /// Triggers a new build, returns a summary of the build.
        /// Optional build parameters can be set using an experimental API.
        /// 
        /// Note: For more about build parameters, read about [using parameterized builds](https://circleci.com/docs/parameterized-builds/)
        public func post(_ body: PostRequest? = nil) -> Request<CircleCIAPI.Build> {
            .post(path, body: body)
        }

        public enum PostResponseHeaders {
            public static let location = HTTPHeader<URL>(field: "Location")
        }

        public struct PostRequest: Encodable {
            /// Additional environment variables to inject into the build environment. A map of names to values.
            public var buildParameters: CircleCIAPI.BuildParameters?
            /// The number of containers to use to run the build. Default is null and the project default is used.
            public var parallel: String?
            /// The specific revision to build.
            /// Default is null and the head of the branch is used. Cannot be used with tag parameter.
            public var revision: String?

            public init(buildParameters: CircleCIAPI.BuildParameters? = nil, parallel: String? = nil, revision: String? = nil) {
                self.buildParameters = buildParameters
                self.parallel = parallel
                self.revision = revision
            }

            private enum CodingKeys: String, CodingKey {
                case buildParameters = "build_parameters"
                case parallel
                case revision
            }
        }
    }
}

extension Paths.Project.WithUsername.WithProject {
    public func buildNum(_ buildNum: Int) -> WithBuildNum {
        WithBuildNum(path: "\(path)/\(buildNum)")
    }

    public struct WithBuildNum {
        /// Path: `/project/{username}/{project}/{build_num}`
        public let path: String

        /// Full details for a single build. The response includes all of the fields from the build summary.
        /// This is also the payload for the [notification webhooks](/docs/configuration/#notify), in which case this object is the value to a key named 'payload'.
        public var get: Request<CircleCIAPI.BuildDetail> {
            .get(path)
        }
    }
}

extension Paths.Project.WithUsername.WithProject.WithBuildNum {
    public var artifacts: Artifacts {
        Artifacts(path: path + "/artifacts")
    }

    public struct Artifacts {
        /// Path: `/project/{username}/{project}/{build_num}/artifacts`
        public let path: String

        /// List the artifacts produced by a given build.
        public var get: Request<[CircleCIAPI.Artifact]> {
            .get(path)
        }
    }
}

extension Paths.Project.WithUsername.WithProject.WithBuildNum {
    public var cancel: Cancel {
        Cancel(path: path + "/cancel")
    }

    public struct Cancel {
        /// Path: `/project/{username}/{project}/{build_num}/cancel`
        public let path: String

        /// Cancels the build, returns a summary of the build.
        public var post: Request<CircleCIAPI.Build> {
            .post(path)
        }
    }
}

extension Paths.Project.WithUsername.WithProject.WithBuildNum {
    public var retry: Retry {
        Retry(path: path + "/retry")
    }

    public struct Retry {
        /// Path: `/project/{username}/{project}/{build_num}/retry`
        public let path: String

        /// Retries the build, returns a summary of the new build.
        public var post: Request<CircleCIAPI.Build> {
            .post(path)
        }
    }
}

extension Paths.Project.WithUsername.WithProject.WithBuildNum {
    public var tests: Tests {
        Tests(path: path + "/tests")
    }

    public struct Tests {
        /// Path: `/project/{username}/{project}/{build_num}/tests`
        public let path: String

        /// Provides test metadata for a build
        /// Note: [Learn how to set up your builds to collect test metadata](https://circleci.com/docs/test-metadata/)
        public var get: Request<CircleCIAPI.Tests> {
            .get(path)
        }
    }
}

extension Paths {
    public static var projects: Projects {
        Projects(path: "/projects")
    }

    public struct Projects {
        /// Path: `/projects`
        public let path: String

        /// List of all the projects you're following on CircleCI, with build information organized by branch.
        public var get: Request<[CircleCIAPI.Project]> {
            .get(path)
        }
    }
}

extension Paths {
    public static var recentBuilds: RecentBuilds {
        RecentBuilds(path: "/recent-builds")
    }

    public struct RecentBuilds {
        /// Path: `/recent-builds`
        public let path: String

        /// Build summary for each of the last 30 recent builds, ordered by build_num.
        public func get(limit: Int? = nil, offset: Int? = nil) -> Request<[CircleCIAPI.Build]> {
            .get(path, query: makeGetQuery(limit, offset))
        }

        private func makeGetQuery(_ limit: Int?, _ offset: Int?) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("limit", limit?.asQueryValue)
            query.addQueryItem("offset", offset?.asQueryValue)
            return query
        }
    }
}

extension Paths {
    public static var user: User {
        User(path: "/user")
    }

    public struct User {
        /// Path: `/user`
        public let path: String
    }
}

extension Paths.User {
    public var herokuKey: HerokuKey {
        HerokuKey(path: path + "/heroku-key")
    }

    public struct HerokuKey {
        /// Path: `/user/heroku-key`
        public let path: String

        /// Adds your Heroku API key to CircleCI, takes apikey as form param name.
        public var post: Request<Void> {
            .post(path)
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
