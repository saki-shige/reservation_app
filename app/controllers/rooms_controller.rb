class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :search]

  def index
    @rooms = current_user.rooms.recent
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_url, notice: "「#{@room.name}」を登録しました。"
    else
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_url, notice: "「#{@room.name}」を削除しました。"
  end

  def search
    area = params[:area]
    key_word = params[:key_word]

    if area
      @rooms = Room.where('address LIKE?',"%#{area}%")
    else
      @rooms = Room.all
    end

    if key_word
      @rooms = @rooms.where('name LIKE ? OR introduction LIKE ?', "%#{key_word}%","%#{key_word}%")
    end

  end

  private

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image, :user_id)
  end

end
