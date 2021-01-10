require 'rails_helper'

describe 'IdeaAPI' do
  it 'アイデア取得API' do

    valid_params = { category_name: 'category_name_test' ,
      body: "test_body"}
    post '/api/v1/categories', params: (valid_params)

    get '/api/v1/ideas'
    json = JSON.parse(response.body)

    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)

    # 正しい数のデータが返されたか確認する。
    expect(json['data'].length).to eq(1)
  end

  it 'アイデア取得API(category特定)' do

    valid_params = { category_name: 'category_name_test' ,
      body: "test_body"}
    post '/api/v1/categories', params: (valid_params)

    get '/api/v1/ideas?category_name='+'category_name_test'
    json = JSON.parse(response.body)

    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)

    # 正しい数のデータが返されたか確認する。
    expect(json['data'].length).to eq(1)
  end
end