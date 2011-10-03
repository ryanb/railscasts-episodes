module UsersHelper
  def avatar_name(user)
    if user.avatar_image_name.present?
      user.avatar_image_name
    else
      "default.png"
    end
  end
end
