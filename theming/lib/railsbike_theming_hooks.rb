class RailsbikeThemingHooks < RailsbikeCore::ThemeSupport::HookListener
  insert_after :navigation_submenu_tabs, :partial=>"admin/shared/submenu_tabs"
end