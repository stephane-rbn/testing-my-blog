require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article, user: user) }

  it 'should persist an article' do
    Article.create(
      title: Faker::Lorem.sentence(word_count: 10),
      content: Faker::ChuckNorris.fact,
      user: user
    )
    expect(Article.count).to eq(1)
  end

  it 'should have a valid factory' do
    expect(FactoryBot.build(:article)).to be_valid
  end

  context 'validation' do
    it 'should valid with valid attributes' do
      expect(article).to be_a(Article)
    end

    describe '#title' do
      it 'should not be valid without a title' do
        article.title = nil
        expect(article).not_to be_valid
        expect(article.errors.include?(:title)).to eq(true)
      end

      it 'should not be blank' do
        article.title = ''
        expect(article).not_to be_valid
        expect(article.errors.include?(:title)).to eq(true)
      end
    end

    describe '#content' do
      it 'should not be valid without a content' do
        article.content = nil
        expect(article).not_to be_valid
        expect(article.errors.include?(:content)).to eq(true)
      end

      it 'should not be blank' do
        article.content = ''
        expect(article).not_to be_valid
        expect(article.errors.include?(:content)).to eq(true)
      end
    end

    describe '#is_draft' do
      it 'is not valid without a is_draft' do
        article.is_draft = nil
        expect(article).not_to be_valid
        expect(article.errors.include?(:is_draft)).to eq(true)
      end
    end
  end

  context 'associations' do
    describe 'users' do
      it { expect(article).to belong_to(:user) }
    end

    describe 'comments' do
      it { expect(article).to have_many(:comments) }

      it 'should increment comments_count' do
        other_article = Article.new(
          title: Faker::Lorem.sentence(word_count: 10),
          content: Faker::ChuckNorris.fact,
          user: user
        )
        other_article.comments.push(FactoryBot.create(:comment, user: user))
        other_article.save
        expect(Comment.count).to eq(1)
        expect(other_article.comments.count).to eq(1)
      end
    end
  end
end
