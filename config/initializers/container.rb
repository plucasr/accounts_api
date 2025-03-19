require "dry/container"

class Container
  extend Dry::Container::Mixin

  # Register dependencies
  register(:user_repository) { User }
  register(:user_service) { UserService.new(user_repository: resolve(:user_repository)) }
end
