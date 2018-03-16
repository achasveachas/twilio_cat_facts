class CatFact < ApplicationRecord
    after_create :notify_subscribers

    def notify_subscribers
        client = Twilio::REST::Client.new

        Subscriber.all.each do |subscriber|
            client.messages.create({
                from: TWILIO_PHONE_NUMBER,
                to: subscriber.phone_number,
                body: self.fact
              })
        end
    end
end
