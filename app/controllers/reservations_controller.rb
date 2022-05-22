class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations.recent
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = current_user.reservations.new(reservation_params)
    @room = @reservation.room
    if @reservation.valid?
      @length_of_stay = calc_length_of_stay(@reservation.start_at, @reservation.end_at)
      @reservation[:total_amount] = calc_total_amount(@reservation.start_at, @reservation.end_at, @reservation.room.price)
    else
      render template: "rooms/show"
    end
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    @room = @reservation.room
    if params[:back].present?
      render template: "rooms/show"
    elsif @reservation.save
      redirect_to reservation_path(@reservation.id), notice: "「#{@reservation.room.name}」を予約しました。"
    else
      render template: "rooms/show"
    end

  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_url, notice: "削除しました。"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_at, :end_at, :number_of_guests, :total_amount, :room_id, :user_id)
  end

  def calc_length_of_stay(start_at, end_at)
    length_of_stay = (end_at - start_at).to_i
  end

  def calc_total_amount(start_at, end_at, price)
    total_amount = calc_length_of_stay(start_at, end_at) * price
  end

end
