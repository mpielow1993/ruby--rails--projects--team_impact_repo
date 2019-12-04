class Membership < StoreItem
    has_many :subscriptions, dependent: :destroy
    has_many :members, through: :subscriptions
end
