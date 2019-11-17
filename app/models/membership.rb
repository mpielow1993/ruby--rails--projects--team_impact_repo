class Membership < StoreItem
    has_many :members, through: :subscriptions
    has_many :subscriptions
    
end
