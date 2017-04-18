class BlogsController < ApplicationController
   before_action :authenticate_user!

	def new
		@blog = Blog.new
	end

	def index
    if params[:search].present? 
      @blogs= Blog.where('title LIKE ? OR description LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%") 
    elsif params[:start_date].present? && params[:end_date].present? 
      @blogs = Blog.where('created_at >= ? AND created_at <=?', params[:start_date].to_date, params[:end_date].to_date)  
    else 
      @blogs=Blog.all 
    end
  end
   
  def create
    @blog = Blog.new(blog_params)
    @blog.save
    redirect_to blogs_path ,notice:'blogs was successfully created' 
  end

  def edit
    @blog=Blog.find(params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def update
    @blog=Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to blogs_path , notice:'blogs was successfully update' 
  end  
  
	
   def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
 
    redirect_to blogs_path , notice:'blogs was successfully delete' 
  
   end
 private
  def blog_params
    params.require(:blog).permit(:title,:description ,:image,:categry_id,:video)
  end

end
