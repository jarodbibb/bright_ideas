class IdeasController < ApplicationController
  before_action :require_login
  def create
    @idea = Idea.new(content: makin_ideas[:content], users_id: current_user.id )
    if @idea.save
      redirect_to '/bright_ideas'
    else 
      flash[:notice] = @idea.errors.full_messages
    end

  end
  def show
    @ideas = Idea.all

  end 
  def update
    @idea = Idea.find(params[:id])
    @idea.increment!(:count)
    @likes = Like.where(users_id: current_user.id).where(ideas_id: params[:id])
    if @likes.length < 1
      @in = Like.create( users_id: current_user.id, ideas_id: params[:id])
    else 
      # @likes.each do |like|
      #   like.increment!(:count)
      end
      redirect_to '/bright_ideas'
    end
    def view
      @likes = Like.where(ideas_id: params[:id])



    end
    

  def destroy
  end
  private 
  def makin_ideas
    params.require(:idea).permit(:content)
  end
end
