reader, writer = IO.pipe
writer.write("Hello pipe")
writer.close
puts reader.read
