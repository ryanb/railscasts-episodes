$redis = Redis.new
$rollout = Rollout.new($redis)
$rollout.define_group(:admin) do |user|
  user.admin?
end
$degrade_phone = Degrade.new($redis,
  name: :phone,
  minimum: 1,
  failure_strategy: lambda { $rollout.deactivate_all(:phone) }
)
