# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([
  { name: 'Horror' },
  { name: 'Action' },
  { name: 'Adventure' },
  { name: 'Comedy' },
  { name: 'Drama' },
  { name: 'Crime' },
  { name: 'Fantasy' },
  { name: 'Historical' },
  { name: 'Mystery' },
  { name: 'Romanc' }
  ])
