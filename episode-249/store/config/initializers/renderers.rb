ActionController::Renderers.add :csv do |target, options|
  self.content_type ||= Mime::CSV
  self.response_body ||= "CSV Data"
end
