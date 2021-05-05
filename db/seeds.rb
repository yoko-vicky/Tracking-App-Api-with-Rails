User.create([{
              username: 'admin', password: 'admin', admin: true
            }])

Item.create([{
              title: 'Idioms', unit: 'idiom', icon: 'typcn:sort-alphabetically', target: 30
            }, {
              title: 'Grammer', unit: 'min', icon: 'bx:bxs-book', target: 30
            }, {
              title: 'Pronunciation', unit: 'min', icon: 'carbon:chat-bot', target: 15
            }, {
              title: 'Reading', unit: 'page', icon: 'akar-icons:book', target: 10
            }, {
              title: 'Speaking', unit: 'min', icon: 'cil:chat-bubble', target: 30
            }, {
              title: 'Writing', unit: 'word', icon: 'bx:bxs-pen', target: 200
            }])
