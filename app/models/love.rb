class Love < ApplicationRecord
  belongs_to :relax
  belongs_to :user

  validates_uniqueness_of :relax_id, scope: :user_id
end
