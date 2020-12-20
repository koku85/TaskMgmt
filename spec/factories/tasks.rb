FactoryBot.define do
  factory :task do
    name { 'Factoryで作ったデフォルトのタイトル１' }
    details { 'Factoryで作ったデフォルトのコンテント１' }
    deadline { '2020-01-01' }
    status { '未着手' }
    priority { '高' }
  end
  factory :second_task, class: Task do
    name { 'Factoryで作ったデフォルトのタイトル２' }
    details { 'Factoryで作ったデフォルトのコンテント２' }
    deadline { '2020-02-01' }
    status { '着手' }
    priority { '中' }
  end
end
