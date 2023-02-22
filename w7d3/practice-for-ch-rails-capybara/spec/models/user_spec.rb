require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(email, password) }
  let(:password) { double() }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6).on(:create) }
  
  it 'check if password is valid' do
    expect User.is_password?(:password).to be_kind_of(boolean)
  end
end
