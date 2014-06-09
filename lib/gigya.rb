require 'gigya/version'
require 'gigya/http_service'
require 'gigya/identity_storage'
require 'gigya/oauth'
require 'gigya/rest_api'
require 'gigya/utils'

module Gigya
  URLS = {
    socialize: 'socialize.gigya.com',
    ids: 'ids.gigya.com'
  }

  URIS = {
    login: '/socialize.login',
    get_token: '/socialize.getToken',
    get_user_info: '/socialize.getUserInfo',
    search: '/ids.search'
  }

  class << self
    attr_accessor :connection
  end

  def self.build_url(url, uri)
    "https://#{url}#{uri}"
  end

  def self.connection=(service)
    @connection = service.connection
  end

  self.connection = HTTPService
end
