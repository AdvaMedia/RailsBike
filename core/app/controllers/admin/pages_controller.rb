class Admin::PagesController < Admin::ResourceController
  def index
      respond_with(@collection) do |format|
        format.html
        format.json { render :json => json_data }
      end
  end
  
  
  def init_ignore_fields
    @ignore_fields = ['id', 'created_at', 'updated_at', 'parent_id', 'lft', 'rgt']
  end
end