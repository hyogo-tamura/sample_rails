require 'rails_helper'

RSpec.describe Hobby, type: :model do
  it 'is valid with title' do
    hobby = Hobby.new(title: 'test')
    expect(hobby).to be_valid
  end

  it 'is invalid without title' do
    hobby = Hobby.new
    expect(hobby).to_not be_valid
  end

  it 'is invalid with blank title' do
    hobby = Hobby.new(title: ' ')
    expect(hobby).to_not be_valid
  end

  it 'is not valid with long title' do
    hobby = Hobby.new(title: 'this is a very long title for the hobby that too long to tell us what you like.')
    expect(hobby).to_not be_valid
  end

  describe 'when the title is already taken' do
    before do
      hobby = Hobby.new(title: 'test')
      hobby.save!
    end
    it 'is not valid' do
      hobby2 = Hobby.new(title: 'test')
      expect(hobby2).to_not be_valid
    end
  end
end
