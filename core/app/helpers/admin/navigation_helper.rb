module Admin::NavigationHelper
  # Make an admin tab that coveres one or more resources supplied by symbols
  # Option hash may follow. Valid options are
  #   * :label to override link text, otherwise based on the first resource name (translated)
  #   * :route to override automatically determining the default route
  #   * :match_path as an alternative way to control when the tab is active, /products would match /admin/products, /admin/products/5/variants etc.
  def tab(*args)
      options = {:label => args.first.to_s}
      if args.last.is_a?(Hash)
        options = options.merge(args.pop)
      end
      options[:route] ||=  "admin_#{args.first}"

      destination_url = send("#{options[:route]}_path")

      ## if more than one form, it'll capitalize all words
      label_with_first_letters_capitalized = t(options[:label]).gsub(/\b\w/){$&.upcase}

      link = link_to(label_with_first_letters_capitalized, destination_url)

      css_classes = []

      selected = if options[:match_path]
        request.fullpath.starts_with?("/admin#{options[:match_path]}")
      else
        args.include?(controller.controller_name.to_sym)
      end
      css_classes << 'selected' if selected

      if options[:css_class]
        css_classes << options[:css_class]
      end
      content_tag('li', link, :class => css_classes.join(' '))
    end
end