module ApplicationHelper
  def converted_file_size(size)
    case size
    when 0 .. 1024
      "%d B" % size
    when 1024 .. 1024 ** 2
      "%d kB" % (size / 1024)
    when 1024 ** 2 .. 1024 ** 3
      "%.2f MB" % (size / (1.0 * (1024 ** 2)))
    else
      "%.2f GB" % (size / (1.0 * (1024 ** 3)))
    end
  end
end
