# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.create([{
              title: 'Idioms', unit: 'idiom', icon: 'bi:chat-quote'
            }, {
              title: 'Grammer', unit: 'min', icon: 'bi:chat-quote'
            }, {
              title: 'Pronounciation', unit: 'min', icon: 'bi:chat-quote'
            }, {
              title: 'Reading', unit: 'page', icon: 'bi:chat-quote'
            }, {
              title: 'Spaking', unit: 'min', icon: 'bi:chat-quote'
            }, {
              title: 'Writing', unit: 'word', icon: 'bi:chat-quote'
            }])
