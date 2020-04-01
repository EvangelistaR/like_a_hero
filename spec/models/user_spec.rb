# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid if the level is not between 1 and 99' do
    hero = User.create(nickname: 'Chronos', kind: :wizard, level: 100)
    expect(hero).to_not be_valid
  end

  it 'return the correct hero title' do
    user = User.create(nickname: 'Chronos', kind: :wizard, level: 1)
    expect(user.title).to eql('wizard Chronos #1')
  end
end
