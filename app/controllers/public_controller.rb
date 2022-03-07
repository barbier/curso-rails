class PublicController < ApplicationController
  
  def homepage
    @posts = Post.active.order_by_latest_first.limit_5
    @categories = Category.all
  end

  def about
    
  end

  def blog
    
  end

  def contact
    
  end

end