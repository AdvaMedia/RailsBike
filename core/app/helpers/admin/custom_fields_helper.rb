module Admin::CustomFieldsHelper
  def options_for_field_kind
    %w(string text category boolean date file has_one has_many).map do |kind|
      [t("custom_fields.kind.#{kind}"), kind]
    end
  end
  
  def options_for_association_target
    ContentType.all.collect do |c|
      c.persisted? ? [c.name, c.content_klass.to_s] : nil
    end.compact
  end
end