#include <boost/beast.hpp>
#include <boost/asio/connect.hpp>
#include <boost/asio/ip/tcp.hpp>
#include "../include/web.h"

namespace cli {
    namespace example {
        namespace web {
            // api serverは別にライブラリを作っておく。
            // 

            // clientとサーバーの方が良い？
            // polling するときのステータス、どのような終了条件などを書く。
            namespace polling {

            }
            namespace response {
            }
            // 他のサーバーに対してrequest投げるとか。
            namespace request {

                // void Invoke() {
                //     boost::asio::io_context ioc;

                //     boost::asio::ip::tcp::resolver resolver{ioc};
                //     boost::asio::ip::tcp::socket socket{ioc};

                //     auto host = "localhost";
                //     // auto host = "google.com";
                //     auto port = "80";

                //     auto const results = resolver.resolve(host, port);

                //     // Make the connection on the IP address we get from a lookup
                //     boost::asio::connect(socket, results.begin(), results.end());

                //     // auto const target = argv[3];
                //     // string_view
                //     boost::beast::http::request<boost::beast::http::string_body> 
                //         req{boost::beast::http::verb::get, host, 10};
                //     req.set(
                //         boost::beast::http::field::host
                //         ,"string_view"
                //     );
                //     req.set(boost::beast::http::field::host, host);
                //     // user agentのバージョンを書く。
                //     req.set(boost::beast::http::field::user_agent, BOOST_BEAST_VERSION_STRING);
                //     // req.set(http::field::user_agent, BOOST_BEAST_VERSION_STRING);
                //     // socketに書き込むことにより、リクエストを送る。

                //     boost::beast::http::write(socket, req);

                //             // This buffer is used for reading and must be persisted
                //     boost::beast::flat_buffer buffer;

                //     // Declare a container to hold the response
                //     boost::beast::http::response<boost::beast::http::dynamic_body> res;

                //     // Receive the HTTP response
                //     boost::beast::http::read(socket, buffer, res);

                //     // Write the message to standard out
                //     std::cout << res << std::endl;

                //     // Gracefully close the socket
                //     boost::system::error_code ec;
                //     socket.shutdown(boost::asio::ip::tcp::socket::shutdown_both, ec);
                // }
            }
        }
    }
}
