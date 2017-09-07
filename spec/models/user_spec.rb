require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it 'is invalid without a username' do
    expect(FactoryGirl.build(:user, username: nil)).not_to be_valid
    expect(FactoryGirl.build(:user, username: '')).not_to be_valid
    expect(FactoryGirl.build(:user, username: ' 1')).not_to be_valid
    expect(FactoryGirl.build(:user, username: '1 ')).not_to be_valid
    expect(FactoryGirl.build(:user, username: '1dd ')).not_to be_valid
    expect(FactoryGirl.build(:user, username: ' 1dd')).not_to be_valid
  end

  it 'is invalid without an already used username' do
    user = FactoryGirl.create(:user, username: 'not_used')
    expect(FactoryGirl.build(:user, username: 'not_used')).not_to be_valid
  end
end
