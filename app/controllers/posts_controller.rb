class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy save_post_view ]
  before_action :authenticate_account!, except: [:show]
  before_action :can_modify_post, only: [:edit, :update, :destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    respond_to do |format|
      format.html
      format.json {
        render json: @post
      }
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.account_id = current_account.id

    if @post.save
      redirect_to post_url(@post), notice: "Post was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update

    if @post.update(post_params)
      redirect_to post_url(@post), notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  def save_post_view
    @post.increment(:views, 1).save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def can_modify_post
      redirect_back(fallback_location: root_path) and return unless @post.account_id == current_account.id
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :summary, :body, :active, :category_id )
    end
end
