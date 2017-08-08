class BicyclesController < ApplicationController
  before_action :find_bicycle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :post_auth, only: [:destroy]
  load_and_authorize_resource

  def index
    @categories = Category.all.map{ |c| [ c.name, c.id ]}
    if params[:bicycle]
      @bicycles = Bicycle.paginate(:page => params[:page], :per_page => 10).filter(params[:bicycle][:category])
    else
      @bicycles = Bicycle.paginate(:page => params[:page], :per_page => 10).search(params[:search]).order('created_at DESC')
    end
  end

  def show
  end

  def new
    @bicycle = Bicycle.new
    @categories = Category.all.map{ |c| [ c.name, c.id ]}
  end

  def edit
    @categories = Category.all.map{ |c| [ c.name, c.id ]}
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
    @suggestion = BicycleSuggestion.where(bicycle_id: @bicycle.id)

    if @bicycle.user_id != current_user.id
      if @suggestion.blank? || @suggestion.user_id != current_user.id
        # @bicycle_suggestion = BicycleSuggestion.new
        # @bicycle_suggestion.id = @bicycle.id
        # @bicycle_suggestion.user_id = current_user.id
        # @bicycle_suggestion.update(bicycle_params)
        # @bicycle_suggestion.save
        redirect_to @bicycle, notice: 'Your changes will appear after approval'
      else
        redirect_to @bicycle, notice: 'You\'ve already did a suggestion to this post'
      end
    else
      if @bicycle.update(bicycle_params)
        redirect_to @bicycle
      else
        render 'edit'
      end
    end
  end

  def destroy
    @bicycle.destroy

    redirect_to bicycles_path
  end

  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @bicycle
      redirect_to root_path, notice: "You favorited #{@bicycle.name}"
    elsif type == "unfavorite"
      current_user.favorites.delete(@bicycle)
      redirect_to root_path, notice: "Unfavorited #{@bicycle.name}"
    else
      redirect_to root_path, notice: "Nothing happened"
    end
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
