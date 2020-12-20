require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task_name', with: 'タスク名'
        fill_in 'task_details', with: 'タスク詳細'
        fill_in 'task_deadline', with: '002020-01-01'
        select '未着手', from: 'task_status'
        click_on '登録する'
        expect(page).to have_content '2020-01-01'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, name: 'task')
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        visit tasks_path
        # save_and_open_page

        task_list = all('.task_row')
        # byebug
        expect(task_list[0]).to have_content 'Factoryで作ったデフォルトのタイトル２'
        expect(task_list[1]).to have_content 'Factoryで作ったデフォルトのタイトル１'
      end
    end

    context '終了期限でソートするというリンクを押した場合' do
      it 'タスクが終了期限の降順に並び替えられる' do
        visit tasks_path
        task_list = all('.task_row')
        expect(task_list[0]).to have_content '2020-02-01'
        expect(task_list[1]).to have_content '2020-01-01'
      end
    end

    context 'タイトルであいまい検索をした場合' do
      it '検索キーワードを含むタスクで絞り込まれる' do
        visit tasks_path
        fill_in 'タスク名', with: 'Factory'
        click_on '検索'
        expect(page).to have_content 'Factory'
      end
    end

    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        visit tasks_path
        select '未着手', from: 'ステータス'
        click_on '検索'
        expect(page).to have_content '未着手'
      end
    end
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        visit tasks_path
        fill_in 'タスク名', with: 'タイトル２'
        select '着手', from: 'ステータス'
        click_on '検索'
        expect(page).to have_content 'タイトル２'
        expect(page).to have_content '着手'
      end
    end

  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         task = FactoryBot.create(:task, name: 'task')
         visit task_path(Task)
         expect(page).to have_content 'task'
       end
     end
  end
end
