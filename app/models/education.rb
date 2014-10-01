require 'elasticsearch/model'
class Education < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
Education.import # for auto sync model with elastic search