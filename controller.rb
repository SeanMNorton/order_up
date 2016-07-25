EXIT_STATEMENT = "No combination matches that price!"

def order_up(price, menu_file)
  items = MenuParser.parse(menu_file)
  qty = 1
  while qty <= items.length
    items.combination(qty).each do |combo|
      if combo_price(combo) == normalize(price)
        return combo_format(combo)
      end
    end
    qty += 1
  end
   EXIT_STATEMENT
end

def combo_price(combo_array)
  prices = []
  combo_array.each do |item|
    prices.push(item.price)
  end
    normalize(prices.reduce(:+))
end

def normalize(number)
  number = number.gsub("$", "") if number.is_a? String
  number.to_f
end

def combo_format(combo)
  counter = 0
  result = ""
  combo.each do |item|
    result += "#{counter += 1})  #{item.name}\n"
  end
  result += "total: $#{'%.2f' % combo_price(combo)}"
end
