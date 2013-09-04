class BaseController < ApplicationController

  def initialize(entity_type)
    @entity_type = entity_type
    super()
  end

  def index
    @entities = @entity_type.order(:name).all
  end

  def new
    create_entity
  end
  
  def create
    create_entity(pars: post_params)
  end
  
  def edit
    define_entity
  end
  
  def update
    update_entity
  end

  def show
    define_entity
  end 

  def destroy 
    destroy_entity
  end
  
  def define_entity
    @entity = @entity_type.find(params[:id])
  end

  def create_entity(pars: nil)
    if pars
      @entity = @entity_type.new(pars)
      if @entity.save
        redirect_to action: 'index'
      else
        render 'new'
      end
    else
      @entity = @entity_type.new
    end
  end

  def update_entity
    define_entity
    if @entity.update(post_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy_entity
    define_entity
    @entity.destroy
  end

end
