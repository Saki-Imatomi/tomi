class Post < ApplicationRecord

    belongs_to :user
    #追記箇所
    has_many :loves, dependent: :destroy
    has_many :loved_users, through: :loves, source: :user
    mount_uploader :image, ImageUploader
    has_many :dogs, dependent: :destroy
end
