ActiveSupport::Notifications.subscribe "process_action.action_controller" do |name, start, finish, id, payload|
  PageRequest.create! do |page_request|
    page_request.path = payload[:path]
    page_request.page_duration = (finish - start) * 1000
    page_request.view_duration = payload[:view_runtime]
    page_request.db_duration = payload[:db_runtime]
  end
end

ActiveSupport::Notifications.subscribe "products.search" do |name, start, finish, id, payload|
  Rails.logger.debug "SEARCH: #{payload[:search]}"
end
