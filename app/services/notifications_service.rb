# app/services/notifications_service.rb
require "grpc"
require_relative "../lib/notifications_pb"
require_relative "../lib/notifications_services_pb"

class NotificationsService
  def self.send_notification(user_id, message, message_type)
    server_address = ENV["GRPC_SERVER_ADDRESS"]
    stub = Notifications::NotificationService::Stub.new(
      server_address,
      :this_channel_is_insecure
    )

    # Create a request object
    request = Notifications::NotificationRequest.new(
      userId: user_id,
      message: message,
      messageType: message_type
    )

    # Send the request to the gRPC server
    stub.send_notification(request)
  end
end
