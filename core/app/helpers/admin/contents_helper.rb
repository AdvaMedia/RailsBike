module Admin::ContentsHelper
  def content_label_for(content)
    if content._parent.raw_item_template.blank?
      content._label # default one
    else
      assigns = {
        'content'           => content.to_liquid
      }

      registers = {
        :controller     => self
      }

      preserve(content._parent.item_template.render(::Liquid::Context.new({}, assigns, registers)))
    end
  end
end