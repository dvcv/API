class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :email, :password

  # Delegate the practical definition of `full_name` to
  # the User model, where it belongs, rather than
  # (re)defining it here.
  def name
    object.name
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

  def created_at
    object.password
  end
end
