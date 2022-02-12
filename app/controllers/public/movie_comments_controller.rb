class Public::MovieCommentsController < ApplicationController
  def new
    @movies_comment = MovieComment.new
    @movie = Movie.find(params[:movie_id])
  end
  
  #更新
  def create
    @movie = Movie.find(params[:movie_id])
    @movies_comment = MovieComment.new(movie_comment_params)
    @movies_comment.movie_id = @movie.id
    @movies_comment.customer_id = current_customer.id
      if @movies_comment.save
      redirect_to public_customer_path(current_customer)
      else
      render 'new'
      end
  end
  
  def index
    @movie_comments = MovieComment.all
  end
  def destroy
    @movie_comment = MovieComment.find_by(id: params[:id])
      if @movie_comment.destroy
        flash[:notice] = '投稿物件を解除しました'
        redirect_to public_customer_path(current_customer)
      else
      　flash[:notice] = '投稿物件を解除に失敗しました'
      end
  end
  
  
   private
    def movie_comment_params
      params.require(:movie_comment).permit(:movie_id, :customer_id, :rate, :comment, :scene)
    end
    
end
