# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid if the level is not between 1 and 99' do
    nickname = FFaker::Name.first_name
    kind = %i[knight wizard].sample
    level = FFaker::Random.rand(100..9999)
    hero = User.new(nickname: nickname, kind: kind, level: level)
    expect(hero).to_not be_valid
  end

  it 'return the correct hero title' do
    nickname = FFaker::Name.first_name
    kind = %i[knight wizard].sample
    level = FFaker::Random.rand(1..99)

    hero = User.create(nickname: nickname, kind: kind, level: level)
    expect(hero.title).to eq("#{kind} #{nickname} ##{level}")
  end
end
