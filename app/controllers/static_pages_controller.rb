class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help#typed manually
  end
  
  def about#typed manually
  end
  
  def contact
  end
end
