class MenuParser

  def self.parse(menu_file)
    menu_file = extention_manager(menu_file)
    menu_items = []
    File.open(menu_file, 'r').readlines.each do |line|
      item_data = line.chomp.split(",")
      name = item_data[0]
      price = normalize(item_data[1])
      menu_items << Item.new(name, price)
    end

    menu_items
  end


  def self.extention_manager(file_path)
    file_path.match(/\./) ? file_path : "#{file_path}.txt"
  end

end
