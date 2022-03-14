import Vapor
import Plot

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.get("helloplot") { req -> HTML in
        HTML(
            .head(
                .title("hello plot!")
            ),
            .body(
                .div(
                    .h1("Hello Plot Developer!")
                )
            )
        )
    }
}

extension HTML : ResponseEncodable {
    public func encodeResponse(for request: Request) -> EventLoopFuture<Response> {
        let res = Response(headers: ["content-type": "text/html; charset=utf-8"], body: .init(string: self.render()))
        return res.encodeResponse(for: request)
    }
}
