class Membership < StoreItem
    has_many :members, through: :subscriptions
end
