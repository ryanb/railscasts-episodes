require 'find'
require 'fileutils'
def find_and_delete(path, pattern)
  Find.find(path) do |f|
	if !File.file?(f) and f[pattern]
	  FileUtils.rm_rf(f)
	end
  end
end
# print all the ruby files
find_and_delete(".", /\.svn$/)
