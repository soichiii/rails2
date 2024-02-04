class HomeController < ApplicationController
  def index
    # エリア検索のパラメータ
    @area = params[:area]

    # フリーワード検索のパラメータ
    @keyword = params[:keyword]

    # エリア検索とフリーワード検索が両方ともない場合、全ての施設を表示
    if @area.blank? && @keyword.blank?
      @rooms = Room.all
    else
      # エリア検索がある場合
      if @area.present?
        @rooms = Room.where("address LIKE ?", "%#{@area}%")
      end

      # フリーワード検索がある場合
      if @keyword.present?
        @rooms = Room.where("name LIKE ? OR description LIKE ?", "%#{@keyword}%", "%#{@keyword}%")
      end
    end
  end
end
