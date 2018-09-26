class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.create((params[:comment].permit(:name, :description))
		@comment.post_id = params[:post_id]
		@comment.save

		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end

end

