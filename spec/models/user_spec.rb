require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'should have a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  context 'validation' do
    it 'should valid with valid attributes' do
      expect(user).to be_a(User)
    end

    describe '#email' do
      it 'should not be valid without a email' do
        user.email = nil
        expect(user).not_to be_valid
        expect(user.errors.include?(:email)).to eq(true)
      end

      it { expect(user.email).to match(Devise.email_regexp) }
    end

    describe '#first_name' do
      it 'should validate length' do
        user.first_name = Faker::Lorem.characters(number: 81)
        expect(user).not_to be_valid
        expect(user.errors.include?(:first_name)).to eq(true)
      end

      it 'should not be valid without a first_name' do
        user.first_name = nil
        expect(user).not_to be_valid
        expect(user.errors.include?(:first_name)).to eq(true)
      end

      it 'should not be blank' do
        user.first_name = ''
        expect(user).not_to be_valid
        expect(user.errors.include?(:first_name)).to eq(true)
      end
    end

    describe '#last_name' do
      it 'should validate length' do
        user.last_name = Faker::Lorem.characters(number: 81)
        expect(user).not_to be_valid
        expect(user.errors.include?(:last_name)).to eq(true)
      end

      it 'should not be valid without a last_name' do
        user.last_name = nil
        expect(user).not_to be_valid
        expect(user.errors.include?(:last_name)).to eq(true)
      end

      it 'should not be blank' do
        user.last_name = ''
        expect(user).not_to be_valid
        expect(user.errors.include?(:last_name)).to eq(true)
      end
    end

    describe '#password' do
      it 'should not be valid without a password' do
        user.password = nil
        expect(user).not_to be_valid
        expect(user.errors.include?(:password)).to eq(true)
      end
    end

    describe '#password_confirmation' do
      it 'should not be valid without an identical password_confirmation' do
        user.password_confirmation = '$tr0Ng;p@ssWord{43}'
        expect(user).not_to be_valid
        expect(user.errors.include?(:password_confirmation)).to eq(true)
      end
    end
  end

  context 'custom methods' do
    describe '#full_name' do
      it 'should return a valid full_name' do
        expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
      end
    end
  end

  context 'associations' do
    describe '#articles' do
      it { expect(user).to have_many(:articles) }
      it { expect(user).to have_many(:comments) }
    end
  end
end
