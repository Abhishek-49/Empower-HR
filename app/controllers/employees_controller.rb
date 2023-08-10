class EmployeesController < ApplicationController
  layout 'admin'
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end


  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path, notice: 'Employee was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path, notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  def show
  end
  
  def destroy
    if @employee.destroy
      redirect_to employees_path, notice: 'Employee was successfully destroyed.'
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :department_id, :employee_id, :address, :mobile_no, :aadhar, :pancard, :date_of_birth)
  end
  def set_employee
    @employee = Employee.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
        redirect_to employees_path, notice: error
  end

end
