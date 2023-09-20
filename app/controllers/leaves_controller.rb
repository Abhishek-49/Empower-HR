class LeavesController < ApplicationController
	layout 'admin'
	before_action :authenticate_employee!
  	before_action :set_leave, only: [:show, :approve, :deny]

	def index
		@leave = Leave.all
	end

	def new
		@leave = Leave.new
	end

	def show
		@leave = Leave.find_by(id: params[:id])
	    if @leave.nil?
	      redirect_to leaves_path, alert: "Leave not found."
	      return
	    end
	    @leave = @leave.employee.leave
	end

	def create
		@leave = Leave.new(leaves_params)
		@leave.employee_id = current_employee.id
		if @leave.save
			redirect_to leaves_path, notice: "Leave Request Successfully Created"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @leave.update(leaves_params)
			redirect_to leaves_path, notice: "Leave Request Successfully Updated"
		else
			render :edit
		end
	end

	def destroy
		if @leave.destroy
			redirect_to leaves_path, notice: "Leave Request Successfully Destroyed"
		end
	end

	def approve
		if current_employee.role.admin?
		  if @leave.update(approval: true, denial_reason: nil)
		    redirect_to leaves_path, notice: 'Leave Request Approved.'
		  else
		    redirect_to leaves_path, alert: 'Failed to approve leave request.'
		  end
		else
		  redirect_to leaves_path, alert: 'You do not have permission to approve this leave request.'
		end
	end

	def deny
	  if current_employee.role.admin?
	    if params[:admin_denial_reason].present?
	      @leave.approval = false
	      @leave.denial_reason = params[:admin_denial_reason]
	      if @leave.save
	        redirect_to leaves_path, notice: 'Leave Request Denied.'
	      else
	        redirect_to leaves_path, alert: 'Failed to deny leave request.'
	      end
	    else
	      redirect_to leaves_path, alert: 'Denial reason is required.'
	    end
	  else
	    redirect_to leaves_path, alert: 'You do not have permission to deny this leave request.'
	  end
	end

	private

	def set_leave
		@leave = Leave.find(params[:id])
	end

	def leaves_params
		params.require(:leave).permit(:leave_type, :start_date, :end_date, :duration, :leave_status, :leave_balance, :reason, :submission_date, :approval, :denial_reason)
	end
end
