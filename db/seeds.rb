def create_cities
  City.create(name: 'Zürich', zip: 8000)
  City.create(name: 'Geneva', zip: 1200)
  City.create(name: 'Basel', zip: 4000)
  City.create(name: 'Bern', zip: 3000)
  City.create(name: 'Lausanne', zip: 1004)
  City.create(name: 'Lausanne', zip: 1007)
  City.create(name: 'Jouxtens-Mézery', zip: 1008)
  City.create(name: 'Prilly', zip: 1009)
end

create_cities
