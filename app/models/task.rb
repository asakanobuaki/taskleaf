class Task < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  #validates :name, length: { maximum: 30 }
  validate :varidate_name_not_including_comma

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

private

def varidate_name_not_including_comma
  errors.add(:name, 'にコンマを含めることはできません') if name&.include?(',')
end

end
