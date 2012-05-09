class Article
  extend  ActiveModel::Naming
  extend  ActiveModel::Translation
  include ActiveModel::Validations
  include ActiveModel::Conversion
  attr_accessor :id, :name, :content

  def self.all
    @articles ||= []
  end

  def self.find(id)
    all.detect { |a| a.id == id.to_i }
  end

  def initialize(attrs = {})
    self.attributes = attrs
  end

  def persisted?
    @id.present?
  end

  def save
    if valid?
      unless persisted?
        self.id = self.class.all.size + 1
        self.class.all << self
      end
      self
    else
      false
    end
  end

  def attributes=(attrs)
    attrs.each { |name, value| send("#{name}=", value) }
  end

  def update_attributes(attrs = {})
    self.attributes = attrs
    save
  end

  def destroy
    self.class.all.delete(self)
  end
end
