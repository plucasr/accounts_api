require "grpc"
require_relative "../lib/notifications_pb"
require_relative "../lib/notifications_services_pb"

class NotificationServer < Notifications::NotificationService::Service
  def send_notification(notification_req, _unused_call)
    # Implement your logic here
    puts "Sending notification to user #{notification_req.userId}: #{notification_req.message}"

    # Return an empty response as defined in the proto file
    Google::Protobuf::Empty.new
  end
end
