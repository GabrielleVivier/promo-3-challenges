

def analyze(file_name)
  #TODO: should analyze the text in the given file
  file_path = File.dirname(__FILE__) + "/#{file_name}"
  line_count = 0
  file_string = ""
  File.open(file_path, "r").each_line do |line|
    line_count += 1
    file_name + line.split(//).to_s
  end
  print file_name
end

analyze("text-to-analyse.txt")