# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all

User.create(
        fullname: 'Nyanta The Cat',
        username: 'nyaka',
        email: 'nyanta@example.com',
        password: 'fishy'
)

User.create(
        fullname: 'Gerrard',
        username: 'gerrard',
        email: 'gerrard@example.com',
        password: 'butler'
)


Post.create(
        title: 'First post',
        content: 'How to read a tome of Collected Poems?
                  Read one that pivotally changes you
                  and lose track of the page and title.
                  How to clean a house? Lose your ring in it.

                  Milosz not having to make peace one day
                  because the people are dead, nor revisit
                  some cities of his blood, because they are
                  razed. I’m still reading for that one.

                  If I wince that I got cuppy, said too much,
                  maybe years ago, sometimes the sudden
                  knowledge that my auditor is no longer
                  will come in as wistful relief, if with grief.

                  So I’d like to find it. This “how” isn’t
                  an engineering question, but angle,
                  here alchemically
                  translated to hope by way of loss.',
        visible: true,
        user_id: 1
)

Post.create(
    title: 'Second post',
    content: 'How to read a tome of Collected Poems?
                  Read one that pivotally changes you
                  and lose track of the page and title.
                  How to clean a house? Lose your ring in it.

                  Milosz not having to make peace one day
                  because the people are dead, nor revisit
                  some cities of his blood, because they are
                  razed. I’m still reading for that one.

                  If I wince that I got cuppy, said too much,
                  maybe years ago, sometimes the sudden
                  knowledge that my auditor is no longer
                  will come in as wistful relief, if with grief.

                  So I’d like to find it. This “how” isn’t
                  an engineering question, but angle,
                  here alchemically
                  translated to hope by way of loss.',
    visible: true,
    user_id: 2
)

Post.create(
    title: 'Third post',
    content: 'How to read a tome of Collected Poems?
                  Read one that pivotally changes you
                  and lose track of the page and title.
                  How to clean a house? Lose your ring in it.

                  Milosz not having to make peace one day
                  because the people are dead, nor revisit
                  some cities of his blood, because they are
                  razed. I’m still reading for that one.

                  If I wince that I got cuppy, said too much,
                  maybe years ago, sometimes the sudden
                  knowledge that my auditor is no longer
                  will come in as wistful relief, if with grief.

                  So I’d like to find it. This “how” isn’t
                  an engineering question, but angle,
                  here alchemically
                  translated to hope by way of loss.',
    visible: true,
    user_id: 1
)

Comment.create(
           message: 'This is the only one comment here',
           user_id: 2,
           post_id: 1,
           visible: true
)