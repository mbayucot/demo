class V1::ProjectsController < ApplicationController
  before_action :set_project, only: %i[show update destroy]

  has_scope :by_query
  has_scope :by_sort, using: %i[column direction], type: :hash

  # GET /v1/projects
  def index
    @projects = authorize policy_scope(Project)
    @projects = apply_scopes(@projects)
    @projects = @projects.paginate(page: params[:page])

    render json: @projects,
           meta: pagination_dict(@projects),
           adapter: :json,
           root: 'entries'
  end

  # GET /v1/projects/1
  def show
    render json: @project
  end

  # POST /v1/projects
  def create
    @project = authorize current_user.projects.create!(project_params)

    render json: @project, status: :created
  end

  # PATCH/PUT /v1/projects/1
  def update
    @project.update!(project_params)

    render json: @project
  end

  # DELETE /v1/projects/1
  def destroy
    @project.destroy
  end

  private

  def set_project
    @project = policy_scope(Project).find(params[:id])
    authorize @project
  end

  def project_params
    params.fetch(:project, {}).permit(:name)
  end

  def import_params
    params.permit(:uuid, :file)
  end
end
