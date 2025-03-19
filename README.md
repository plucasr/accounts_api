# RESTful API for User and Contact Management

This is a RESTful API built with Ruby on Rails, designed for managing user and contact information. It utilizes a PostgreSQL database and adheres to RESTful principles for seamless interaction with client applications.

## Features

- **User Management:**
  - Create, read, update, and delete user accounts.
  - Primary email management.
  - User authentication (login and signup).
- **Contact Management:**
  - Create, read, update, and delete contact information.
  - Associates contacts with users.
  - Handles various contact types (emails, phone numbers, etc.).
- **Authentication:**
  - Secure endpoints for user authentication using JWT.
- **Protected Endpoint:**
  - `/notify` endpoint: A protected endpoint that receives a `userId` for notification purposes.
- **GRPC Notification Service Integration:**
  - Communicates with an external notification server via GRPC.

## Technologies Used

- Ruby on Rails (API-only mode)
- PostgreSQL
- UUID v4
- JWT (JSON Web Tokens)
- GRPC

## API Endpoints

(Provide a list of the API endpoints here, e.g.)

- `POST /signup` - User signup
- `POST /login` - User login
- `GET /users` - List all users
- `GET /users/:id` - Get a specific user
- `POST /users` - Create a new user
- `PUT /users/:id` - Update a user
- `DELETE /users/:id` - Delete a user
- `GET /users/:user_id/contacts` - List all contacts of a user
- `GET /contacts/:id` - Get a specific contact
- `POST /contacts` - Create a new contact
- `PUT /contacts/:id` - Update a contact
- `DELETE /contacts/:id` - Delete a contact
- `POST /notify` - Send a notification (protected)

## Setup Instructions

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd <repository_name>
    ```

2.  **Install dependencies:**

    ```bash
    bundle install
    ```

3.  **Configure the database:**

    - Create a `config/database.yml` file with your PostgreSQL credentials.
    - Run database migrations:

      ```bash
      rails db:create
      rails db:migrate
      ```

4.  **Start the server:**

    ```bash
    rails s
    ```

5.  **GRPC Service Setup:**
    - Add instructions on how to setup the GRPC connection

## Authentication

- User authentication is required for protected endpoints.
- Use the `/login` endpoint to obtain a JWT.
- Include the JWT in the `Authorization` header of your requests (e.g., `Authorization: Bearer <token>`).

## GRPC Integration

- Explain how the GRPC client is configured and used to communicate with the notification service.
- Include details about the GRPC service's address and port.

## Testing

- Explain how to run the tests.

## Contributing

- Explain how others can contribute to the project.

## License

- Specify the license under which the project is distributed.
