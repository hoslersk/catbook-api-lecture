require 'rails_helper'

RSpec.describe Cat, type: :model do
  let(:cat) { cat = Cat.new(name: 'Maru', weight: 12) }
  # it {should have_many(:hobbies)} can test with "shoulda" gem
  it "should be valid with a name and weight" do
    # cat = Cat.new(name: 'Maru', weight: 12)
    expect(cat).to be_valid
  end
  it "should be invalid without a name" do
    bad_cat = Cat.new(weight: 10)
    # bad_cat.valid?
    # expect(bad_cat.errors[:name]).to include("can't be blank")
    expect(bad_cat).to_not be_valid
  end
  it "should be invalid without a weight" do
    weightless_cat = Cat.new(name: 'Maru')
    expect(weightless_cat).to_not be_valid
  end
  it "should not be fluffy by default" do
    # cat = Cat.new(name: 'Maru', weight: 12)
    expect(cat.fluffy).to be(false)
  end
  it "should know if it is fat" do
    # cat = Cat.new(name: 'Maru', weight: 12)
    skinny_cat = Cat.new(name: 'Skinny', weight: 9)
    perfectly_fat_cat = Cat.new(name: 'JusRite', weight: 10)
    expect(cat.fat?).to be(true)
    expect(skinny_cat.fat?).to be(false)
    expect(perfectly_fat_cat.fat?).to be(true)
  end
  it "should be able to learn a new hobby" do
    cat = Cat.create(name: 'Maru', weight: 12)
    hobby = Hobby.create(name: 'Hiding', description: "Some cats like to hide in cardboard boxes or stick their heads in paper bags")

    cat.learn_to(hobby)
    # expect(cat.hobbies).to include(hobby)
    cat.reload
    expect(cat.hobbies).to include(hobby)
  end
end
