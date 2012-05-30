module MatchScope
  def match(matches)
    clause = matches.map do |attribute, conditions|
      Array.wrap(conditions).map do |predicates|
        predicates = predicates.kind_of?(Hash) ? predicates : {eq: predicates}
        predicates.map do |predicate, value|
          arel_table[attribute].send(predicate, value)
        end.reduce(:and)
      end.reduce(:or)
    end.reduce(:and)
    where(clause)
  end
end

ActiveSupport.on_load :active_record do
  extend MatchScope
end
