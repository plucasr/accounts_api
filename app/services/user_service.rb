class UserService
  def initialize(user_repository: User)
    @user_repository = user_repository
  end

  def list_users(filter: nil, sort: nil, page: nil, per_page: nil)
    users = @user_repository.all

    # Apply filters
    users = users.where("first_name LIKE ?", "%#{filter}%") if filter.present?

    # Apply sorting
    users = users.order(sort) if sort.present?

    # Apply pagination
    users = users.paginate(page: page, per_page: per_page) if page.present? && per_page.present?

    users
  end
end
