class Public::MoviesController < ApplicationController
  def new
    @movie = Movie.new
    @area = Area.new
  end
  
  def create
    @movie = Movie.new(movie_params)
    @movie.customer_id = current_customer.id
      if @movie.save
      redirect_to public_customer_path(current_customer)
      else
      render 'new'
      end
  end
    
  def destroy
    @movie = Movie.find_by(params[:id])
      if @movie.destroy
        flash[:notice] = '投稿を解除しました'
        redirect_to public_customer_path(current_customer)
      else
      　flash[:notice] = '投稿の解除に失敗しました'
      end
  end
  
  def show
    @movie = Movie.find_by(id: params[:id])
    @customer = @movie.customer
  end

  def index
    @movies = Movie.includes(:favorited_customers).sort {|a,b| b.favorited_customers.size <=> a.favorited_customers.size}
    @customer = current_customer
  end

    
  private
  def movie_params
    params.require(:movie).permit(:category_id, :customer_id, :movie_image_id,
    :detail, :movie_name, :image, :comments, :movie_status)
  end
  
end
