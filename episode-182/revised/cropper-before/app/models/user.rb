class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end
