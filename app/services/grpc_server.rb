require "grpc"
require_relative "notifications_service"
require_relative "../lib/notifications_services_pb"

server = GRPC::RpcServer.new
server.add_http2_port("0.0.0.0:50051", :this_port_is_insecure)
server.handle(NotificationServer)
puts "gRPC server running on 0.0.0.0:50051"
server.run_till_terminated
