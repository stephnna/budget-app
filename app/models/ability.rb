class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can(:manage, Category, user:)
    can(:manage, Payment, user:)

    can %i[read create], Category
    can %i[read create], Payment
  end
end
