class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend('posts',
                                                    partial: "posts/post",
                                                    locals: { post: @post })
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('post_form',
                                                    partial: "posts/form",
                                                    locals: { post: @post }), status: :unprocessable_entity
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:name)
  end
end
