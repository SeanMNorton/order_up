
def get_info
  print "How much are your picky customers looking to spend: "
  price = gets.chomp
  print "Your menu file + extention: "
  menu_file = gets.chomp
  puts order_up(price, menu_file)
end
