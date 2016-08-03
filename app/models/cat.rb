require 'date'

class Cat < ActiveRecord::Base
  validates :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: %w( purple black polka-dot aquamarine ochre )}
  validates :sex, inclusion: { in: %w(M F)}

  has_many :cat_rentals, dependent: :destroy

  def age
    @age = (Date.today - self.birth_date).to_i / 365
  end
end
