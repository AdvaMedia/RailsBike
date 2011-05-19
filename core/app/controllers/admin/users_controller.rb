class Admin::UsersController < Admin::ResourceController
  def index
      respond_with(@collection) do |format|
        format.html
        format.json { render :json => json_data }
      end
  end
  
  
  def init_ignore_fields
    @ignore_fields = [
      'id', 'created_at', 'updated_at', 'encrypted_password', 'reset_password_token', 'reset_password_sent_at',
      'remember_created_at', 'confirmation_token', 'confirmed_at', 'confirmation_sent_at'
      ]
  end
end