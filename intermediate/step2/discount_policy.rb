class DiscountPolicy
    def initialize(threshold:, rate:)
        @threshold = threshold # 閾値
        @rate = rate
    end

    def apply(amount)
        return amount if amount < @threshold

        (amount * (1.0 - @rate)).round
    end
end