class ListSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :title, :private, :user_id

  # Delegate the practical definition of `full_name` to
  # the User model, where it belongs, rather than
  # (re)defining it here.
  def title
    object.title
  end

  def private
    object.private
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
