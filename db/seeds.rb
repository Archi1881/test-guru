# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
  {name: 'Artur', email: 'art.test@gmail.com', password: 123456789, type: 'Admin' }
  ])

categories = Category.create!([
  {title: 'Frontend'},
  {title: 'Backend'}
  ])

tests = Test.create!([
  {title: 'Ruby', level: 0, category_id: categories[1].id, user_id: users[0].id},
  {title: 'HTML', level: 0, category_id: categories[1].id, user_id: users[0].id},
  {title: 'JS', level: 0, category_id: categories[1].id, user_id: users[0].id},
  {title: 'Ruby', level: 1, category_id: categories[0].id, user_id: users[0].id},
  {title: 'HTML', level: 1, category_id: categories[0].id, user_id: users[0].id},
  {title: 'JS', level: 1, category_id: categories[0].id, user_id: users[0].id},
  {title: 'Ruby', level: 2, category_id: categories[0].id, user_id: users[0].id},
  {title: 'HTML', level: 2, category_id: categories[0].id, user_id: users[0].id},
  {title: 'JS', level: 2, category_id: categories[0].id, user_id: users[0].id}
  ])

questions = Question.create([
  {body: 'First question', test_id: tests[0].id},
  {body: 'Second question', test_id: tests[0].id},
  {body: 'Third question', test_id: tests[0].id},
  {body: 'Fourth question', test_id: tests[1].id},
  {body: 'Fifth question', test_id: tests[1].id},
  {body: 'Sixth question', test_id: tests[1].id},
  {body: 'Seventh question', test_id: tests[2].id},
  {body: 'Eighth question', test_id: tests[2].id},
  {body: 'Ninth question', test_id: tests[2].id}
  ])

answers = Answer.create([
  {body: '1 answer for First question', question_id: questions[0].id, correct: true},
  {body: '2 answer for First question', question_id: questions[0].id},
  {body: '3 answer for First question', question_id: questions[0].id},
  {body: '1 answer for Second question', question_id: questions[1].id},
  {body: '2 answer for Second question', question_id: questions[1].id, correct: true},
  {body: '3 answer for Second question', question_id: questions[1].id},
  {body: '1 answer for Third question', question_id: questions[2].id},
  {body: '2 answer for Third question', question_id: questions[2].id},
  {body: '3 answer for Third question', question_id: questions[2].id, correct: true},
  {body: '1 answer for Fourth question', question_id: questions[3].id},
  {body: '2 answer for Fourth question', question_id: questions[3].id},
  {body: '3 answer for Fourth question', question_id: questions[3].id, correct: true},
  {body: '1 answer for Fifth question', question_id: questions[4].id},
  {body: '2 answer for Fifth question', question_id: questions[4].id, correct: true},
  {body: '1 answer for Fifth question', question_id: questions[4].id},
  {body: '1 answer for Sixth question', question_id: questions[5].id, correct: true},
  {body: '2 answer for Sixth question', question_id: questions[5].id},
  {body: '3 answer for Sixth question', question_id: questions[5].id},
  {body: '1 answer for Seventh question', question_id: questions[6].id},
  {body: '2 answer for Seventh question', question_id: questions[6].id, correct: true},
  {body: '3 answer for Seventh question', question_id: questions[6].id},
  {body: '1 answer for Eighth question', question_id: questions[7].id},
  {body: '2 answer for Eighth question', question_id: questions[7].id},
  {body: '3 answer for Eighth question', question_id: questions[7].id, correct: true},
  {body: '1 answer for Ninth question', question_id: questions[8].id, correct: true},
  {body: '1 answer for Ninth question', question_id: questions[8].id},
  {body: '1 answer for Ninth question', question_id: questions[8].id}
  ])


