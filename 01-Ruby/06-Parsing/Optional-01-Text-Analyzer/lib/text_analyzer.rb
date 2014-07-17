

def counting_lines(file_name)
  #TODO: should analyze the text in the given file
  file_path = File.dirname(__FILE__) + "/#{file_name}"
  line_count = 0
  File.open(file_path, "r").each_line do |line|
    line_count += 1
  end
  print line_count
end

analyze("text-to-analyse.txt")