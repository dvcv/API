class ItemSerializer < ActiveModel::Serializer
  attributes :id, :complete, :title, :created_at, :list_id

  # Delegate the practical definition of `full_name` to
  # the User model, where it belongs, rather than
  # (re)defining it here.
  def title
    object.title
  end

  def complete
    object.complete
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
