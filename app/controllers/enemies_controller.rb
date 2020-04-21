class EnemiesController < ApplicationController
  before_action :set_enemy, except: %i[index create new]

  def index
    render json: Enemy.all, status: :ok
  end

  def show
    render json: @enemy, status: :ok
  end

  def new
    @enemy = Enemy.new
  end

  def create
    @enemy = Enemy.create(enemy_params)
    if @enemy.save
      render json: @enemy, status: :ok
    else
      render json: { errors: @enemy.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @enemy.update(enemy_params)
      render json: @enemy, status: :ok
    else
      render json: { errors: @enemy.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @enemy.destroy
    head 204
  end

  private

  def enemy_params
    params.permit(:name, :power_base, :power_step, :level, :kind)
  end

  def set_enemy
    @enemy = Enemy.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: :not_found
  end
end
