require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(
      email: 'john@doe.com',
      first_name: 'John',
      last_name: 'Doe',
      password: '$tr0Ng;p@ssWord{42}',
      password_confirmation: '$tr0Ng;p@ssWord{42}'
    )
  end

  context 'validation' do
    it 'should valid with valid attributes' do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe '#email' do
      it 'should not valid without a email' do
        invalid_user = User.create(
          first_name: 'John',
          last_name: 'Doe',
          password: '$tr0Ng;p@ssWord{42}',
          password_confirmation: '$tr0Ng;p@ssWord{42}'
        )

        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:email)).to eq(true)
      end
    end

    describe '#first_name' do
      it 'should not valid without a first_name' do
        invalid_user = User.create(
          email: 'john@doe.com',
          last_name: 'Doe',
          password: '$tr0Ng;p@ssWord{42}',
          password_confirmation: '$tr0Ng;p@ssWord{42}'
        )

        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:first_name)).to eq(true)
      end

      it 'should not be lower than 1 character' do
        invalid_user = User.create(
          email: 'john@doe.com',
          first_name: '',
          last_name: 'Doe',
          password: '$tr0Ng;p@ssWord{42}',
          password_confirmation: '$tr0Ng;p@ssWord{42}'
        )

        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:first_name)).to eq(true)
      end
    end

    describe '#last_name' do
      it 'should not valid without a last_name' do
        invalid_user = User.create(
          email: 'john@doe.com',
          first_name: 'John',
          password: '$tr0Ng;p@ssWord{42}',
          password_confirmation: '$tr0Ng;p@ssWord{42}'
        )

        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:last_name)).to eq(true)
      end

      it 'should not be lower than 1 character' do
        invalid_user = User.create(
          email: 'john@doe.com',
          first_name: 'John',
          last_name: 'a',
          password: '$tr0Ng;p@ssWord{42}',
          password_confirmation: '$tr0Ng;p@ssWord{42}'
        )

        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:last_name)).to eq(true)
      end
    end

    describe '#password' do
      it 'should not valid without a password' do
        invalid_user = User.create(
          email: 'john@doe.com',
          first_name: 'John',
          last_name: 'Doe',
          password_confirmation: '$tr0Ng;p@ssWord{42}'
        )

        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:password)).to eq(true)
      end
    end

    describe '#password_confirmation' do
      it 'should not valid without an identical password_confirmation' do
        invalid_user = User.create(
          email: 'john@doe.com',
          first_name: 'John',
          last_name: 'Doe',
          password: '$tr0Ng;p@ssWord{42}',
          password_confirmation: '$tr0Ng;p@ssWord{43}'
        )

        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.include?(:password_confirmation)).to eq(true)
      end
    end
  end

  context 'associations' do
    describe 'articles' do
      it 'should have_many articles' do
        article = Article.create(title: 'My first article', content: 'Lorem ipsum', user: @user)
        expect(@user.articles.include?(article)).to eq(true)
      end
      # it { should have_many(:articles) }
    end
  end
end
