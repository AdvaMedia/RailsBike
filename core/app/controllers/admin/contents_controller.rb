class Admin::ContentsController < Admin::BaseController
  before_filter :set_content_type
  respond_to :html
  
  def index
    @contents = @content_type.contents
  end
  
  def new
    @item = @content_type.contents.build
  end
  
  def edit
    @item = @content_type.contents.find(params[:id])
  end
  
  def create
    new
    if @item.update_attributes(params[:content_instance])
      redirect_to admin_contents_url(:slug=>@content_type.slug)
    else
      render :action=>"new"
    end
  end
  
  def update
    edit
    if @item.update_attributes(params[:content_instance])
      redirect_to admin_contents_url(:slug=>@content_type.slug)
    else
      render :action=>"edit"
    end
  end
  
  def destroy
    edit
    @item.destroy
    redirect_to admin_contents_url(:slug=>@content_type.slug)
  end
  
  protected
  
  def field_member
     @field = @fields.find(params[:id])
  end
    
  def set_content_type
    @content_type ||= ContentType.where(:slug => params[:slug]).first
  end
end