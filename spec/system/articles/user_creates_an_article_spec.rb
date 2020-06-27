require 'rails_helper'

RSpec.describe 'Creating an article with the editor', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before(:each) { sign_in user }

  it 'creates a new article' do
    visit new_article_path
    expect(page).to have_field('Title')
    expect(page).to have_field('Content')
    sleep(2)
    within('form') do
      fill_in 'article_title', with: 'How to create an article with a robot'
      fill_in 'article_content', with: 'This article is written by a robot'
    end
    sleep(2)
    click_button 'Create Article'
    expect(page).to have_content('New article successfully added!')
    expect(page).to have_content('How to create an article with a robot')
    expect(page).to have_content('This article is written by a robot')
    expect(page).to have_link('Home', href: '/articles')
    sleep(2)
  end
end
