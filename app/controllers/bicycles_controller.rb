class BicyclesController < ApplicationController
  before_action :find_bicycle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :post_auth, only: [:destroy]
  load_and_authorize_resource

  def index
    @bicycles = Bicycle.order('created_at DESC')
  end

  def show
  end

  def new
    @bicycle = Bicycle.new
    @categories = Category.all.map{ |c| [ c.name, c.id ]}
  end

  def edit
    @categories = Category.all.map{ |c| [ c.name, c.id ]}

      # unless bicycle_version.whodunnit.to_i == current_user.id
      #   redirect_to bicycles_path, alert: "You've already made a suggestion"
      # end
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
    @bicycle.category_id = params[:category_id]
    @bicycle.user_id = current_user.id

    if @bicycle.save
      redirect_to @bicycle
    else
      render 'new'
    end
  end

  def update
    @bicycle.category_id = params[:category_id]

    if @bicycle.update(bicycle_params)
      redirect_to @bicycle
    else
      render 'edit'
    end
  end

  def destroy
    @bicycle.destroy

    redirect_to bicycles_path
  end

  private

  def find_bicycle
    @bicycle = Bicycle.find(params[:id])
  end

  def post_auth
    if current_user != @post.user
      redirect_to(root_path)
    end
  end

  def bicycle_params
    params.require(:bicycle).permit(:name, :desc, :image_url)
  end
end
