class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update, :destroy]
    
    def new
        @blog = Blog.new
    end
    
    def edit
    end
    
    def update
        if @blog.update
            redirect_to blogs_path, notice: "更新しました"
        else
            render 'edit'
        end
    end
    
    def create
        @blog = Blog.new(blog_params)
        @blog.user_id = current_user.id
        if @blog.save
            redirect_to blogs_path, notice: "作成しました。"
        else
            render 'new'
        end
    end
    
    def destroy
        @blog.destroy
        redirect_to blogs_path, notice: "削除しました"
    end
    
    def index
        @blogs = Blog.all
    end
    
    def confirm
        @blog = Blog.new(blog_params)
        @blog.user_id = current_user.id
        render :new if @blog.invalid?
    end
    
    def show
        @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    end
    
    private
    
    def blog_params
       params.require(:blog).permit(:title, :content, :user_id) 
    end
    
    def set_blog
        @blog = Blog.find(params[:id])
    end
end
