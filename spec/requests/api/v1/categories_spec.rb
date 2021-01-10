require 'rails_helper'

describe 'CategoryAPI' do
it 'アイデア登録API' do
    valid_params = { category_name: 'category_name_test' ,
    body: "test_body"}

    expect{post '/api/v1/categories', params: (valid_params)}.to change(Idea, :count).by(+1)

    expect(response.status).to eq(201)

  end
end
