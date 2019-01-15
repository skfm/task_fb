class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def show
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end
  
  def edit
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_path, notice: '投稿が完了しました！'
    else
      render 'new' 
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: '投稿を編集しました！' 
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: '投稿を削除しました！' 
  end
  
  def confirm
    @picture = Picture.new(picture_params)
    render :new if @picture.invalid?
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:content)
    end
end
