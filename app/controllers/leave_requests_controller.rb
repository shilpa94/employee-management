class LeaveRequestsController < ApplicationController
 def index
   @leave_request = LeaveRequest.all
 end

  def new
   @leave_request = LeaveRequest.new
  end

    
  def create
    @leave_request = LeaveRequest.new(leave_params)
    @leave_request.employee_id = current_employee.id

    respond_to do |format|
      if @leave_request.save
        format.html { redirect_to leave_requests_path, notice: 'Leave request successfully created.' }
        # format.json { render :show, status: :created, location: @leave_request }
      else
        format.html { render :new }
        format.json { render json: @leave_request.errors, status: :unprocessable_entity }
      end
    end
  end

   
  private

  def leave_params
    params.require(:leave_request).permit(:start_date, :end_date, :reason, :employee_id)
  end
  
end
