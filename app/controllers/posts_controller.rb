class PostsController < ApplicationController
  respond_to :html, :json

  # GET /posts
  # GET /posts.json
  def index
    @posts = PostRepository.all
    puts 'posts'
    puts @posts.inspect
    respond_with @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = PostRepository.find(params[:id])
    respond_with @post
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    respond_with @post
  end

  # GET /posts/1/edit
  def edit
    @post = PostRepository.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new params[:post]
    flash[:notice] = 'Post was successfully created.' if PostRepository.save(@post)
    respond_with(@post)
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = PostRepository.find(params[:id])
    @post.attributes = params[:post]

    flash[:notice] = 'Post was successfully updated.' if PostRepository.save(@post)
    respond_with(@post)
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = PostRepository.find(params[:id])
    PostRepository.destroy(@post)

    respond_with(@post)
  end
end
