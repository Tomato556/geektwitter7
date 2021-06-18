class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


    validates :name, presence: true
    validates :profile, length: { maximum: 200 }

    has_many :tasks, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_tasks, through: :likes, source: :task

  def already_liked?(task)
    self.likes.exists?(task_id: task.id)
  end


  has_many :relaxes, dependent: :destroy
  has_many :loves, dependent: :destroy
  has_many :loved_relaxes, through: :loves, source: :relax
  has_many :comments, dependent: :destroy

  def already_loved?(relax)
    self.loves.exists?(relax_id: relax.id)
  end
end
