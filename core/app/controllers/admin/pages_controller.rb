class Admin::PagesController < Admin::ResourceController
  def index
      respond_with(@collection) do |format|
        format.html
        format.json { render :json => json_data }
      end
  end
  
  def new 
    @object = Page.new(:parent_id=>params[:parent_id])
    respond_with(@object) do |format|
      format.html { render :layout => !request.xhr? }
      format.js { render :layout => false }
    end
  end
  
  
  def init_ignore_fields
    @ignore_fields = ['id', 'created_at', 'updated_at', 'parent_id', 'lft', 'rgt', 'full_url']
  end
end