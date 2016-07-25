require_relative 'items_class'
require_relative 'menu_parser'
require_relative 'controller'
require_relative 'view'
MENU = "test_menu.txt"

describe Item do

  before(:all) do
    @item = Item.new("Artisinal Grapes", "$7.50")
  end

  it "has name" do
    expect(@item.name).to eq("Artisinal Grapes")
  end

  it "has price" do
    expect(@item.price).to eq("$7.50")
  end

end


describe "Menu Parser" do

  it "returns an array" do
    expect(MenuParser.parse(MENU).class).to be(Array)
  end

  it "creates item objects" do
    expect(MenuParser.parse(MENU)[0].class).to be(Item)
  end

  describe "extention_manager()" do

    context "no given file extention" do
      it "adds .txt as default" do
        expect(MenuParser.extention_manager("menu")).to eq("menu.txt")
      end
    end

    context "given file extenion" do
      it "keeps given extention" do
        expect(MenuParser.extention_manager("menu.csv")). to eq("menu.csv")
      end
    end

  end

end

describe "helpers" do

  describe "order_up()" do
      context "given a correct price" do
        it "returns a combo" do
          expect(order_up("$5.80", MENU)).to eq("1)  sampler plate\ntotal: $5.80")

        end
      end

      context "given an incorrect price" do
        it "returns exit statment" do
          expect(order_up("$100.00", MENU)).to eq("No combination matches that price!")
        end
      end
  end

  describe "combo_price()" do

    context "given a two Item combo" do
      combo = [ Item.new("Papas Fritas", 4.00), Item.new("Leaves", 85.00) ]

      it "sums an array of Items prices" do
        expect(combo_price(combo)).to eq(89.00)
      end
    end

  end
end
