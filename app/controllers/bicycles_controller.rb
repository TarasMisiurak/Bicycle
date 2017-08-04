class BicyclesController < ApplicationController
  def index
    @bicycles = Bicycle.order('created_at DESC')
  end

  def show
    @bicycle = Bicycle.find(params[:id])
  end

  def new
    @bicycle = Bicycle.new
    @categories = Category.all.map{ |c| [ c.name, c.id ]}
  end

  def edit
    @bicycle = Bicycle.find(params[:id])
    @categories = Category.all.map{ |c| [ c.name, c.id ]}
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
    @bicycle.category_id = params[:category_id]

    if @bicycle.save
      redirect_to @bicycle
    else
      render 'new'
    end
  end

  def update
    @bicycle = Bicycle.find(params[:id])
    @bicycle.category_id = params[:category_id]

    if @bicycle.update(bicycle_params)
      redirect_to @bicycle
    else
      render 'edit'
    end
  end

  def destroy
    @bicycle = Bicycle.find(params[:id])
    @bicycle.destroy

    redirect_to bicycles_path
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:name, :desc, :image_url)
  end
end
