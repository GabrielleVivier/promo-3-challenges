def tag(tag_name, attr = nil)
  #TODO:  Build HTML tags around  content given in the block
  #       The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  content = yield()
  if attr.nil?
    "<#{tag_name}>" + content + "</#{tag_name}>"
  else
    "<#{tag_name} #{attr[0]}='#{attr[1]}'>" + content + "</#{tag_name}>"
  end
end

def timer_for
  #TODO:  Return time taken to execute the given block
  start_time = Time.now
  yield
  end_time = Time.now - start_time
end

def transform(element)
  #TODO:  Simply execute the given block on element
  yield(element)
end


