class LeaveRequestsController < ApplicationController
  before_action :set_leaverequest, only: [:approve, :reject]

 def index
  if current_employee.has_role? :admin
    @leave_request = LeaveRequest.all
  else
    @leave_request = LeaveRequest.where(employee_id: current_employee.id)
  end
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

  def approve
      @leave_request.update(approve: true)
      redirect_to leave_requests_path, notice: 'Leave approved' 
  end

  def reject
      @leave_request.update(reject: true)
      redirect_to leave_requests_path, notice: 'Leave rejected' 
  end

   
  private

  def set_leaverequest
    @leave_request = LeaveRequest.find(params[:id])
  end

  def leave_params
    params.require(:leave_request).permit(:start_date, :end_date, :reason, :employee_id, 
    :approve, :reject)
  end
  
end
