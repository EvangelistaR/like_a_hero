require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it "check if current_power is correct" do
    level = FFaker::Random.rand(1..99)
    power_base = FFaker::Random.rand(1000..99999)
    power_step = FFaker::Random.rand(100..999)

    current_power = (power_base + ((level - 1) * power_step))
    weapon = create(:weapon, level: level, power_base: power_base,
      power_step: power_step)

    expect(weapon.current_power).to eql(current_power)
  end

  it 'display correct title' do
    name = FFaker::Lorem.word
    level = FFaker::Random.rand(1..99)

    weapon = create(:weapon, level: level, name: name)
    expect(weapon.title).to eql("#{name} ##{level}")
  end
end
