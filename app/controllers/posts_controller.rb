class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def timeline_posts
    @timeline_posts ||= Post.find_by_sql(['SELECT p.*
      FROM posts p
      LEFT JOIN friendships f ON f.user_id = p.user_id
      AND f.friend_id = ?
      AND f.status = \'a\'
      WHERE COALESCE(f.friend_id, p.user_id) = ?
      ORDER BY p.created_at DESC', current_user.id, current_user.id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
