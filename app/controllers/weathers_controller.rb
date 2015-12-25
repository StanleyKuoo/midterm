class WeathersController < ApplicationController

def index

  @weathers = Weather.page( params[:page] ).per(5)

end

def new

  @weather = Weather.new

end

def dashboard

  @weather = Weather.find( params[:id] )


end

def create
  @weather = Weather.new( weather_params )

  if @weather.save

      flash[:notice] = "新增成功"

      redirect_to weathers_path
    else
      render :action => :new

  end
end

def show
  @weather = Weather.find( params[:id] )
end



def edit
  @weather = Weather.find( params[:id] )

end

def update

 @weather = Weather.find( params[:id] )

  if @weather.update( weather_params )

      flash[:notice] = "更新成功"

      redirect_to weathers_path
    else
      render :action => :edit
  end

end

def destroy

   @weather = Weather.find( params[:id] )

   @weather.destroy

       flash[:alert] = "刪除成功"

       redirect_to weathers_path

 

end

private

 def weather_params
  params.require(:weather).permit(:name, :description,  :status,
                                 :group_ids => [] )

 end



end
