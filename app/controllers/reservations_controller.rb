class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations.includes(:room)
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.build
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.build(reservation_params.merge(user: current_user))
  
    if @reservation.save
      redirect_to confirmation_reservation_path(@reservation), notice: '予約が成功しました。'
    else
      flash.now[:alert] = '予約に失敗しました。入力内容を確認してください。'
      render 'new'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to new_room_reservation_path(@reservation.room_id), notice: '予約がキャンセルされました。'
  end


  def confirmation
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :guests)
  end
end