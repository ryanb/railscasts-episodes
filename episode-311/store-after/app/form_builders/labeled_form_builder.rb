class LabeledFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :tag, to: :@template
  
  %w[text_field text_area password_field collection_select].each do |method_name|
    define_method(method_name) do |name, *args|
      content_tag :div, class: "field" do
        field_label(name, *args) + tag(:br) + super(name, *args)
      end
    end
  end

  def check_box(name, *args)
    content_tag :div, class: "field" do
      super + " " + field_label(name, *args)
    end
  end

  def collection_check_boxes(attribute, records, record_id, record_name)
    content_tag :div, class: "field" do
      @template.hidden_field_tag("#{object_name}[#{attribute}][]") +
      records.map do |record|
        element_id = "#{object_name}_#{attribute}_#{record.send(record_id)}"
        checkbox = @template.check_box_tag("#{object_name}[#{attribute}][]", record.send(record_id),  object.send(attribute).include?(record.send(record_id)), id: element_id)
        checkbox + " " + @template.label_tag(element_id, record.send(record_name))
      end.join(tag(:br)).html_safe
    end
  end
  
  def submit(*args)
    content_tag :div, class: "actions" do
      super
    end
  end
  
  def error_messages
    if object.errors.full_messages.any?
      content_tag(:div, :class => "error_messages") do
        content_tag(:h2, "Invalid Fields") +
        content_tag(:ul) do
          object.errors.full_messages.map do |msg|
            content_tag(:li, msg)
          end.join.html_safe
        end
      end
    end
  end
  
private

  def field_label(name, *args)
    options = args.extract_options!
    required = object.class.validators_on(name).any? { |v| v.kind_of? ActiveModel::Validations::PresenceValidator }
    label(name, options[:label], class: ("required" if required))
  end
  
  def objectify_options(options)
    super.except(:label)
  end
end
