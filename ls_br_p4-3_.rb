# Add the code in the missing  #search method

PRODUCTS = [
  { name: "Thinkpad x210",   price: 220},
  { name: "Thinkpad x220",   price: 250},
  { name: "Thinkpad x250",   price: 979},
  { name: "Thinkpad x230",   price: 300},
  { name: "Thinkpad x230",   price: 330},
  { name: "Thinkpad x230",   price: 350},
  { name: "Thinkpad x240",   price: 700},
  { name: "Macbook Leopard", price: 300},
  { name: "Macbook Air",     price: 700},
  { name: "Macbook Pro",     price: 600},
  { name: "Macbook",         price: 1449},
  { name: "Dell latitude",   price: 200},
  { name: "Dell latitude",   price: 650},
  { name: "Dell inspiron",   price: 300},
  { name: "Dell inspiron",   price: 450}
]


query = {
  price_min: 240,
  price_max: 280,
  q: 'thinkpad'
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

def search(query)
  query_product = []
  PRODUCTS.each do |product|
    query_product << product if product[:name].downcase.start_with? query[:q]
  end
  result = query_product.select do |product|
    product[:price] >= query[:price_min] && product[:price] <= query[:price_max]
  end
  p result
  # puts query[:price_min]
  # puts query[:price_max]
  # puts query[:q]
end

p search(query) == [{name: "Thinkpad x220", price: 250}]
p search(query2) == [{:name=>"Dell inspiron", :price=>300}, {:name=>"Dell inspiron", :price=>450}]