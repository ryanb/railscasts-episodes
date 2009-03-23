class Photo < ActiveRecord::Base
  has_many :comments, :as => :commentable
  
  has_attached_file :image,
                  :url  => "/assets/photos/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/photos/:id/:style/:basename.:extension"
end
