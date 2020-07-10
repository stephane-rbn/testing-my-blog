require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article, user: user) }
  let(:comment) { FactoryBot.create(:comment, user: user, article: article) }

  it 'should have a valid factory' do
    expect(FactoryBot.build(:comment)).to be_valid
  end

  context 'validation' do
    it 'should be valid with valid attributes' do
      expect(comment).to be_a(Comment)
    end

    describe '#content' do
      it 'should validate content length' do
        comment.content = Faker::Lorem.characters(number: 251)
        expect(comment).not_to be_valid
        expect(comment.errors.include?(:content)).to eq(true)
      end

      it 'should not be valid without a content' do
        comment.content = nil
        expect(comment).not_to be_valid
        expect(comment.errors.include?(:content)).to eq(true)
      end
    end
  end

  context 'associations' do
    describe 'users' do
      it { expect(comment).to belong_to(:user) }
    end

    describe 'articles' do
      it { expect(comment).to belong_to(:article) }
    end
  end
end
