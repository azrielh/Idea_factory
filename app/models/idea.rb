class Idea < ActiveRecord::Base

  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user

  has_many :joins, dependent: :destroy
  has_many :users_who_joined, through: :joins, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :user


  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


end
