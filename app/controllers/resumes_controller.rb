class ResumesController < ApplicationController
  before_action :find_resume, only: [:show]
  before_action :find_my_resume, only: [:edit, :update, :destroy, :pin]
  before_action :authenticate_user, extend: [:index, :show]

  def  index
    flash[:notice] = "1111"
    
    if user_signed_in? && current_user.role != "user"
      @resumes = Resume.published.find_by(pinned: true)
    else
      @resumes = Resume.published
    end
  end

  def  new
    @resume = Resume.new
  end

  def create
    # @resume = Resume.new(resume_params)
    # @resume.user = current_user

    @resume = current_user.resumes.new(resume_params)

    if @resume.save
      redirect_to resumes_path, notice: "新增成功"
    else
      render :new
    end
  end

  def show
    # begin
    #   @resume = Resume.find(params[:id])
    # rescue 
    #   render html: "打錯"
    # end
  end

  def pin
    # current_user.resumes.each do |re|
    #   re.update(pinned: false)
    # end

    current_user.resumes.update_all(pinned: false)
    @resume.update(pinned: true)
    redirect_to my_resumes_path, notice: "預設履歷設定成功"
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice: "已刪除"
  end

  def edit
  end

  def update

    if @resume.update(resume_params)
      redirect_to my_resumes_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def my
    @resumes = current_user.resumes
  end

  private
    def resume_params
      params.require(:resume).permit(:title, :content, :status, :mugshot)
    end

    def find_resume
      if user_signed_in?
        @resume = current_user.resumes.friendly.find(params[:id])
      else
        @resume = Resume.published.friendly.find(params[:id])
      end
    end

    def find_my_resume
      # @resume = Resume.find_by!(id: params[:id], user_id: current_user.id)
      @resume = current_user.resumes.friendly.find(params[:id])
    end
end