require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      email: 'john@doe.com',
      first_name: 'John',
      last_name: 'Doe',
      password: '$tr0Ng;p@ssWord{42}',
      password_confirmation: '$tr0Ng;p@ssWord{42}'
    )
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a first_name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a last_name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an identical password_confirmation' do
      subject.password_confirmation = '$tr0Ng;p@ssWord{43}'
      expect(subject).to_not be_valid
    end
  end
end
