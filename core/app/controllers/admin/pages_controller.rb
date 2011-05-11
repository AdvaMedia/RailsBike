class Admin::PagesController < Admin::ResourceController
  def index
      respond_with(@collection) do |format|
        format.html
        format.json { render :json => json_data }
      end
  end
end