module SubscriptionsHelper
    def set_suscription_expiry_date(subscription)
        subscription.update(expiry_date: DateTime.now)
        subscription.update(is_active: false)
    end
end
