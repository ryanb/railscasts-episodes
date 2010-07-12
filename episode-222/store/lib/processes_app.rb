class ProcessesApp < ActionController::Metal
  include ActionController::Rendering
  
  append_view_path "#{Rails.root}/app/views"
  
  def index
    @processes = `ps -axcr -o "pid,pcpu,pmem,time,comm"`
    render
  end
end