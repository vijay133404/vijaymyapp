

class CommentsController < ApplicationController

  def create
  
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    redirect_to blog_path(@blog)
  end

 def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_path(@blog)
  end

def edit 
     @blog = Blog.find(params[:blog_id]) 
     @comment = Comment.find(params[:id]) 
  end 
   def update 
     @blog = Blog.find(params[:blog_id]) 
     @comment = Comment.find(params[:id]) 
      @comment.update(comment_params)
         flash[:notice] = "Comment Updated"
      redirect_to @blog  
    end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end