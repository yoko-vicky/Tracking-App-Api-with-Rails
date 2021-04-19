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
                user_id: 1, date: '1620864000000', result: 32, item_id: 1
              }, {
                user_id: 1, date: '1620432000000', result: 120, item_id: 1
              }, {
                user_id: 1, date: '1620432000000', result: 88, item_id: 2
              }, {
                user_id: 1, date: '1620604800000', result: 451, item_id: 1
              }, {
                user_id: 1, date: '1620604800000', result: 56, item_id: 2
              }, {
                user_id: 1, date: '1620604800000', result: 116, item_id: 3
              }, {
                user_id: 1, date: '1619827200000', result: 1920, item_id: 3
              }])
