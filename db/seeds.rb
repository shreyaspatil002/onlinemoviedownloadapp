# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create([{ name: 'Star Wars', code: 'STAR1', price: 30, description: 'ssss' },
                { name: 'Lord of the Rings', code: 'LOR1', price: 30, description: 'ssss' }])
