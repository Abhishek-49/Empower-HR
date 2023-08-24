class LeavesController < ApplicationController
	layout 'admin'

	def index
		@leave = Leave.all
	end

	def new
		@leave = Leave.new
	end

	def show
	end

	def create
		@leave = Leave.new(leave_params)
		if leave.save
			redirect_to leaves_path, notice: "Leave Request Successfully Created"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @leave.update(leave_params)
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

	private

	def set_leave
		@leave = Leave.find(params[:id])
	end

	def leaves_params
		params.require(:leave).permit(:leave_type, :start_date, :end_date, :duration, :leave_status, :leave_balance, :reason, :submission_date, :approval, :denial_reason)
	end
end
