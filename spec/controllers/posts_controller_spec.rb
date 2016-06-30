require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  instance = Post.new

  it 'should save post' do
    instance.title = 'Title'
    instance.content = 'content'
    expect(instance.save).to eq(true)
  end
end
