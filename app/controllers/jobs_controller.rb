class JobsController < ApplicationController
 
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_categories

 
  
  def index
    @jobs = Job.all
    @category = Category.all

   
  end
 

 
 
  def new
    #@category = Category.new
    @categories = Category.where(parent_id: nil)  
    @subcategory = @subcategory&.category || []
    @subcategories = @subcategories&.subcategories || []
    @subsubcategories = @subsubcategories&.subsubcategories || []
 
    @job = Job.new
  

   
  end


  def create
  
  @job = Job.new(job_params.merge({ user: current_user }))
    if @job.save
  format.html { redirect_to root_path, notice: "Job was successfully created." }
    else
    render :new, status: :unprocessable_entity
    
  end
end

private
def job_params
  params.require(:job).permit(:title, :description,:category_id).merge(user: current_user)

end

 



 def set_categories
  @category = Category.find_by(id: params[:category].presence)
  @categories = Category.find_by(id: params[:category].presence)
  @subcategories = Category.find_by(id: params[:category].presence)
  @subsubcategories = Category.find_by(id: params[:subcategories].presence)

 end
end
