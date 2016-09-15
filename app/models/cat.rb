class Cat < ApplicationRecord
  validates :name, :weight, presence: true
  has_many :cat_hobbies
  has_many :hobbies, through: :cat_hobbies

  def fat?
    if weight >= 10
      true
    elsif weight < 10
      false
    end
  end

  def learn_to(hobby)
    self.hobbies << hobby
  end

end
