module TwilioHelper
    def parse_sms(sms)

        body = sms[:Body]&.strip&.upcase
        from = sms[:From]

        case body

        when "SUBSCRIBE"
            subscriber = Subscriber.new(phone_number: from)
            "The number #{from} has been subscribed to receive cat facts. Text UNSUBSCRIBE at any time to unsubscribe."

        when "UNSUBSCRIBE"
            subscriber = Subscriber.find_by(phone_number: from)
            if subscriber
                subscriber.destroy
                "The number #{from} has been unsubscribed. Text SUBSCRIBE at any time to resubscribe."
            else
                "Sorry, I did not find a subscriber with the number #{from}."
            end

        when "FACT"
            CatFact.last.fact

        else
            "Sorry I didn't get that. the available commands are SUBSCRIBE, UNSUBSCRIBE, and FACT."
        end
            
    end
end
