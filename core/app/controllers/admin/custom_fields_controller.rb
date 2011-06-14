class Admin::CustomFieldsController < Admin::BaseController
  before_filter :find_model_and_fields
  respond_to :html
  
  def index
    
  end
  
  def new
    @field = @model.content_custom_fields.build
  end
  
  def edit
    find_field
  end
  
  def create
    new
    if @field.update_attributes(params[:content_type_content_field])
       redirect_to admin_custom_fields_url(:slug=>@model.slug)
     else
       render :action=>"new"
    end
  end
  
  def update
    find_field
    if @field.update_attributes(params[:content_type_content_field])
       redirect_to admin_custom_fields_url(:slug=>@model.slug)
     else
       render :action=>"edit"
    end
  end
  
  def destroy
    find_field
    if @field.destroy
      redirect_to admin_custom_fields_url(:slug=>@model.slug)
    end
  end
  
  
  protected
  
  def find_field
    @field = @fields.find(params[:id])
  end
  
  def find_model_and_fields
    @model = ContentType.where(:slug=>params[:slug]).first
    @fields = @model.content_custom_fields
  end
  
  #def begin_of_association_chain
  #  find_model_and_fields
  #end
end