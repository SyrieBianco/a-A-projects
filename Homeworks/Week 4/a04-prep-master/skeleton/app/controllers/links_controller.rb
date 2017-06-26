class LinksController < ApplicationController
  before_action :require_logged_in

  def index
    @links = Link.all
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
    @link = Link.find(params[:id])
    render :show
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    @link = current_user.links.find(params[:id])
    if @link.update_attributes(link_params)
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  def destroy
    @link = current_user.links.find(params[:id])
    if @link
      @link.destroy
      redirect_to links_url
    else
      flash.now[:errors] = @link.errors.full_messages
      render :show
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
