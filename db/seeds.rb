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

User.create([{
              username: 'Yocotan', password: 'yocotan123'
            }, {
              username: 'Asahi', password: 'asahi123'
            }, {
              username: 'Vicky', password: 'vicky123'
            }])

Record.create([{
                result: 32, item_id: 1, user_id: 2, date: '2021-04-13 00:00:00 +0000'
              }, {
                result: 60, item_id: 4, user_id: 1, date: '2021-04-08 00:00:00 +0000'
              }, {
                result: 1000, item_id: 6, user_id: 3, date: '2021-04-01 00:00:00 +0000'
              }])
