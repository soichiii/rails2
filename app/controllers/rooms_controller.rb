# app/controllers/rooms_controller.rb

class RoomsController < ApplicationController


  def index
    # 自分が作成したデータのみを取得
    @rooms = current_user.rooms
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
  
    if @room.save
      redirect_to @room, notice: '施設が作成されました。'
      flash[:notice]
    else
      flash.now[:notice]  = '施設の作成に失敗しました。'
      render :new
    end
  end

  def search
    @area = params[:area]
    @keyword = params[:keyword]
    @rooms = search_rooms
    render 'search'
  end

  def room_params
    params.require(:room).permit(:name, :detail, :price, :address, :image)
  end

  def search_rooms
    rooms = Room.all
  
    # エリア検索
    rooms = rooms.where("address LIKE ?", "%#{@area}%") if @area.present?
  
    # フリーワード検索
    rooms = rooms.where("name LIKE ? OR detail LIKE ?", "%#{@keyword}%", "%#{@keyword}%") if @keyword.present?
  
    rooms
  end

  def valid_area?
    valid_areas = ['東京', '大阪', '京都', '札幌']
    valid_areas.include?(@area)
  end
end
