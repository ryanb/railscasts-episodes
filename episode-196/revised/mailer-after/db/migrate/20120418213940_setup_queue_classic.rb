class SetupQueueClassic < ActiveRecord::Migration
  def up
    QC::Queries.load_functions
  end

  def down
    QC::Queries.drop_functions
  end
end
