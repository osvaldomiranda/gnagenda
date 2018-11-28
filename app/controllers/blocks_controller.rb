class BlocksController < ApplicationController
  before_filter :authenticate_user! 
  before_action :set_block, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @blocks = Block.all
    respond_with(@blocks)
  end

  def show
    respond_with(@block)
  end

  def new
    @block = Block.new
    respond_with(@block)
  end

  def edit
  end

  def create
    @block = Block.new(block_params)
    @block.save
    respond_with(@block)
  end

  def update
    @block.update(block_params)
    respond_with(@block)
  end

  def destroy
    @block.destroy
    respond_with(@block)
  end

  private
    def set_block
      @block = Block.find(params[:id])
    end

    def block_params
      params.require(:block).permit(:duration, :zone)
    end
end
