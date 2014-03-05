module Janky
  class Provider < ActiveRecord::Base
    has_many :repositories

    def host
      URI(base_url).host
    end

    def module
      module_name.constantize
    end
  end
end