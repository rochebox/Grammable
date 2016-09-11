class CommentsController < ApplicationController

	  before_action :authenticate_user!
	  def create
	  	@gram = Gram.find(params[:gram_id])
	  	@gram.comments.create(comment_params.merge(user: current_user))
	  	redirect_to gram_path(@gram)
	  end

	  private

	  def comment_params
	  	params.require(:comment).permit(:message)
	  end
end
