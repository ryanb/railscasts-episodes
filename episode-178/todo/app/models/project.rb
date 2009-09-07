class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_attached_file :photo
  attr_accessible :name, :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
