class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :rosters, dependent: :destroy
end
