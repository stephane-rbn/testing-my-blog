require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { described_class.new(title: 'My first blog', content: 'Lorem ipsum', is_draft: false) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a is_draft' do
    subject.is_draft = nil
    expect(subject).to_not be_valid
  end
end
