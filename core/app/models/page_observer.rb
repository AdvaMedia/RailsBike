class PageObserver# < ActiveRecord::Observer
  def before_create(model)
    ap "begin observing create"
    model.regenerate_full_url
  end
  
  def before_save(model)
    before_create(model)
  end
  
  def after_create(model)
    model.children.map{|i| i.save }.count
  end
  
  def after_save(model)
    after_create(model)
  end
end