require 'spec_helper'

describe Post do
  it 'has title methods' do
    post = Post.new
    expect(post.respond_to?('title')).to be_true
    expect(post.respond_to?('title=')).to be_true
  end

  it 'has body methods' do
    post = Post.new
    expect(post.respond_to?('body')).to be_true
    expect(post.respond_to?('body=')).to be_true
  end

  it "when creating a post" do
    post = Post.new(title: 'Hello', body: 'World')
    expect(post.title).to eq 'Hello'
    expect(post.body).to eq 'World'
  end
end
