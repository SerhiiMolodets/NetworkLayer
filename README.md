# How to use
```
import NetworkLayer
```
# Create endpoint
Example

```
enum PostsEndpoint: Endpoint {
    
    case users
    case posts
    case comments
    
    var path: String {
        switch self {
        case .users:
            return "/users"
        case .posts:
            return "/posts"
        case .comments:
            return "/comments"
        }
    }
    var method: RequestMethod {
        switch self {
        case .users, .posts, .comments:
            return .get
        }
    }
    var header: [String: String]? {
        return nil
    }
    var body: [String: String]? {
        return nil
    }
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
}
```

# Create network service

```
protocol PostNetworkServiceProtocol {
    func getUsers() async throws -> [User]
    func getComments() async throws -> [Comment]
    func getPosts() async throws -> [Post]
}

struct PostNetworkService: HTTPClient, PostNetworkServiceProtocol {

    private let decoder: JSONDecoder = {
        $0.keyDecodingStrategy = .convertFromSnakeCase
        return $0
    }(JSONDecoder())
    
    func getUsers() async throws -> [User] {
        do {
            return try await sendRequest(
                endpoint: PostsEndpoint.users,
                useCache: true,
                decoder: decoder
            )
        } catch {
            throw error
        }
    }
    func getComments() async throws -> [Comment] {
        do {
            return try await sendRequest(
                endpoint: PostsEndpoint.comments,
                useCache: true,
                decoder: decoder
            )
        } catch {
            throw error
        }
    }
    
    func getPosts() async throws -> [Post] {
        do {
            return try await sendRequest(
                endpoint: PostsEndpoint.posts,
                useCache: true,
                decoder: decoder
            )
        } catch {
            throw error
        }
    }
}
```
