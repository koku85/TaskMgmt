ruby 2.6.5
Rails 5.2.4.4

# モデル名
- task

## カラム名 - データ型
- id: integer
- user_id: integer
- content: text
- deadline: date
- priority: integer
- status: text
- label: text

# モデル名
- user

## カラム名 - データ型
- id: integer
- name: text
- email: text
- password_digest: text


## Herokuデプロイ手順
- $ rails assets:precompile RAILS_ENV=production
- $ git add -A
- $ git commit -m "init"
- $ git push heroku master
- $ heroku run rails db:migrate

https://floating-coast-52366.herokuapp.com/tasks
