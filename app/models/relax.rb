class Relax < ApplicationRecord

    belongs_to :user

    mount_uploader :image, ImageUploader

    has_many :loves, dependent: :destroy
    has_many :loved_users, through: :loves, source: :user
    has_many :comments, dependent: :destroy
end
