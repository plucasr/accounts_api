class UserService
  def initialize(user_repository: User)
    @user_repository = user_repository
  end

  def list_users(filter: nil, sort: nil, page: nil, per_page: nil)
    users = @user_repository.all
    users = users.where("first_name LIKE ?", "%#{filter}%") if filter.present?
    users = users.order(sort) if sort.present?
    users = users.paginate(page: page, per_page: per_page) if page.present? && per_page.present?

    users
  end

  def find_user(user_id)
    begin
      @user_repository.find(user_id)
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
  def set_user(input)
    user = @user_repository.find_by(id: input[:id])

    if user

      if user.update(input)
        user
      else
        user.errors
      end
    else

      new_user = @user_repository.new(input)
      if new_user.save
        new_user
      else
        new_user.errors
      end
    end
  end
end
