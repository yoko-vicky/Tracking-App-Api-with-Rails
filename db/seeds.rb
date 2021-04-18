Item.create([{
              title: 'Idioms', unit: 'idiom', icon: 'bi:chat-quote', target: 30
            }, {
              title: 'Grammer', unit: 'min', icon: 'bi:chat-quote', target: 60
            }, {
              title: 'Pronounciation', unit: 'min', icon: 'bi:chat-quote', target: 15
            }, {
              title: 'Reading', unit: 'page', icon: 'bi:chat-quote', target: 10
            }, {
              title: 'Spaking', unit: 'min', icon: 'bi:chat-quote', target: 30
            }, {
              title: 'Writing', unit: 'word', icon: 'bi:chat-quote', target: 30
            }])

User.create([{
              username: 'yocotan', password: 'yocotan'
            }, {
              username: 'asahi', password: 'asahi'
            }, {
              username: 'vicky', password: 'vicky'
            }, {
              username: 'admin', password: 'admin', admin: true
            }])

Record.create([{
                result: 32, item_id: 1, user_id: 2, date: '2021-04-13 00:00:00 +0000'
              }, {
                result: 60, item_id: 4, user_id: 1, date: '2021-04-08 00:00:00 +0000'
              }, {
                result: 1000, item_id: 6, user_id: 3, date: '2021-04-01 00:00:00 +0000'
              }])
