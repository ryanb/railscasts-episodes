module ScopeGenerator
  def generate_scopes
    columns.each do |column|
      predicates_for(column).each do |predicate|
        scope "#{column.name}_#{predicate}", ->(value) do
          where(arel_table[column.name].send(predicate, value))
        end
      end
    end
  end

  def predicates_for(column)
    base = [:eq, :not_eq, :in, :not_in]
    case column.type
    when :integer, :float, :decimal, :date, :datetime, :timestamp, :time
      base + [:lt, :lteq, :gt, :gteq]
    when :string, :text
      base + [:matches, :does_not_match]
    else
      base
    end
  end
end

ActiveSupport.on_load :active_record do
  extend ScopeGenerator
end
