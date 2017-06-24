class LinksController < ApplicationController
  before_action :require_logged_in

  def index
    @links = Links.all
    render :index
  end

  def new
    render :new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id

    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end 
  end


  def show
    render :show
  end

  def edit
    render :edit
  end

  def update

  end

  def destroy

  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
