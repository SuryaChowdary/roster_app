class Roster < ApplicationRecord
  has_many :shifts,dependent: :destroy
  belongs_to :company
end
