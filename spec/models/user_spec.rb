require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    it 'should valid with valid attributes' do
      user = FactoryBot.build(:user)
      expect(user).to be_a(User)
      expect(user).to be_valid
    end

    describe '#email' do
      it 'should not valid without a email' do
        user = FactoryBot.build(:user, email: nil)
        expect(user).not_to be_valid
        expect(user.errors.include?(:email)).to eq(true)
      end
    end

    describe '#first_name' do
      it 'should not valid without a first_name' do
        user = FactoryBot.build(:user, first_name: nil)
        expect(user).not_to be_valid
        expect(user.errors.include?(:first_name)).to eq(true)
      end

      it 'should not be lower than 1 character' do
        user = FactoryBot.build(:user, first_name: '')
        expect(user).not_to be_valid
        expect(user.errors.include?(:first_name)).to eq(true)
      end
    end

    describe '#last_name' do
      it 'should not valid without a last_name' do
        user = FactoryBot.build(:user, last_name: nil)
        expect(user).not_to be_valid
        expect(user.errors.include?(:last_name)).to eq(true)
      end

      it 'should not be lower than 1 character' do
        user = FactoryBot.build(:user, last_name: '')
        expect(user).not_to be_valid
        expect(user.errors.include?(:last_name)).to eq(true)
      end
    end

    describe '#password' do
      it 'should not valid without a password' do
        user = FactoryBot.build(:user, password: nil)
        expect(user).not_to be_valid
        expect(user.errors.include?(:password)).to eq(true)
      end
    end

    describe '#password_confirmation' do
      it 'should not valid without an identical password_confirmation' do
        user = FactoryBot.build(:user, password_confirmation: '$tr0Ng;p@ssWord{43}')
        expect(user).not_to be_valid
        expect(user.errors.include?(:password_confirmation)).to eq(true)
      end
    end
  end

  context 'associations' do
    describe '#articles' do
      it 'should have_many articles' do
        expect(FactoryBot.create(:user)).to have_many(:articles)
      end
    end
  end
end
