class HomeController < ApplicationController
  def index
    @allPost = Post.all.reverse
  end
  
  def write
    new_post = Post.new
    new_post.editor = params[:post_editor]
    new_post.title = params[:post_title]
    new_post.content = params[:post_content]
    
    new_post.save
    redirect_to '/'
    
  end

  def show
    @showPost = Post.find(params[:id])
    
  end

  def post_ud_page
    @thisPost = Post.find(params[:id])
  end
  
  def post_update
    thisPost = Post.find(params[:id])
    thisPost.editor = params[:post_editor]
    thisPost.title = params[:post_title]
    thisPost.content = params[:post_content]
  
    thisPost.save
    
    redirect_to '/'
  end
  
  def post_destroy
    thisPost = Post.find(params[:id])
    thisPost.destroy
    
    redirect_to '/'
    
  end
  
  
  def reply_write
    new_reply = Reply.new
    new_reply.editor = params[:reply_editor]
    new_reply.content = params[:reply_content]
    new_reply.post_id = params[:reply_id]
    
    new_reply.save
    redirect_to :back
    
  end
  def reply_destroy
    @thisReply = Reply.find(params[:id])
    @thisReply.destroy
    
    redirect_to :back
  end
  
end
