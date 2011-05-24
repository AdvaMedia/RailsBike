class RailsbikeAuthHooks < RailsbikeCore::ThemeSupport::HookListener
  replace :shared_login_bar, :partial => "shared/login_bar"
  insert_after :admin_tabs, :partial=>"shared/auth_tabs"
end