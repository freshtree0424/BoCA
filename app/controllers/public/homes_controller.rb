class Public::HomesController < PublicController

  def top
   @posts = Post.all
  end

  def about
  end
end
