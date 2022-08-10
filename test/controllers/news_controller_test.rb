# frozen_string_literal: true

require 'test_helper'

class NewsControllerTest < ActionDispatch::IntegrationTest
  test 'should get technews' do
    get news_technews_url
    assert_response :success
  end
end
