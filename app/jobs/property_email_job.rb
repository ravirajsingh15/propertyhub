class PropertyEmailJob < ApplicationJob
  queue_as :default

  def perform(property_id)
    property = Property.find(property_id)

    PropertyMailer.property_created(property).deliver_now
  end
end