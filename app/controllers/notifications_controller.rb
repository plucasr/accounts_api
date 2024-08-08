class NotificationsController < ApplicationController
  def send_notification
    user_id = params[:user_id].to_i
    message = params[:message]
    message_type = params[:message_type]

    # Call the gRPC client to send the message
    NotificationsService.send_notification(user_id, message, message_type)

    # Return a success response
    render json: { status: "Notification sent successfully" }, status: :ok
  rescue => e
    # Handle errors
    render json: { error: e.message }, status: :internal_server_error
  end
end
