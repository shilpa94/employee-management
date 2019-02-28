class ProjectsController < ApplicationController

  def index
    @project = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'New project successfully created.' }
        # format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def assign_employee
    # @employee_project= EmployeeProject.new(assign_params)
    # respond_to do |format|
    #   if @employee_project.save

    #     format.html { redirect_to project_path, notice: 'Assigned employees.' }
    #     format.json { render :show, status: :created, location: @project }
    #   else

    #     format.html { redirect_to project_path, alert: @employee_project.errors  }
    #     format.json { render json: @employee_project.errors, status: :unprocessable_entity }
    #   end
    # end
    # binding.pry
    arr = params[:employee_id]
    arr.each do |a|
      EmployeeProject.create(employee_id: a, project_id: params[:id])
    end
    redirect_to project_path
  end

  private
    
    def project_params
      params.require(:project).permit(:name, :details)
    end
    
    def assign_params
      params.permit(:employee_id, :project_id)
    end


end
