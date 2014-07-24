class Article < ActiveRecord::Base


  has_many :comments, dependent: :destroy
  validates :title, presence: true,
            length: { minimum:5 }


  has_attached_file :avatar, :styles => { :large =>"200x200>" }

  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

  acts_as_taggable_on :tags


end