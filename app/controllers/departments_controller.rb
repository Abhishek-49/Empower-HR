class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[ show edit update destroy]
  #/departments
  def index
    @departments = Department.all
  end

  #/departments
  def new
    @department = Department.new
  end

  #/departments
  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path(@department)
    else
      render :new
    end
  end
  
  #/departments/:id
  def show
  end

  #/departments/:id
  def edit
  end

  #/departments/:id
  def update
    if @department.update(department_params)
      redirect_to departments_path(@department)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #/departments/:id
  def destroy
    @department.destroy
    redirect_to departments_path(@department)
  end

  private

  def department_params
    params.require(:department).permit(:name, :location)
  end

  def set_department
    @department = Department.find(params[:id])
  end
end