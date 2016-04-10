class Pet < ActiveRecord::Base
  has_many :appointments
  has_many :doctors, :through => :appointments

  validates :name, presence: true, length: {maximum: 35}
  validates :breed, presence: true
  validates :pet_type, inclusion: { in: %w(cat dog bird),
    message: "%{value} is not valid! Pet should be either cat or dog or bird" }
  validates :age, presence: true
  validates :weight, presence: true
  validates :last_appointment, presence: true
  
  def self.get_name(id)
    return self.find(id).name
  end
end
