require_relative "../step2/order_repository"
require_relative "../step2/discount_policy"
require_relative "../step2/order_service"

# OrderServiceテスト
RSpec.describe OrderService do
    # let テストコード内で変数を定義
    let(:repo) { OrderRepository.new }
    let(:policy) { DiscountPolicy.new(threshold: 5000, rate: 0.1) }
    let(:service) { described_class.new(repository: repo, discount_policy: policy) }

    # describe 対象クラス、メソッドのグループ化
    describe "#place_order" do
        # テストケース
        context "正統系" do
            # テストコード
            it "閾値未満は割引なしで注文が作成される" do
                order = service.place_order(customer: "Taro", amount: 3000)
                # expect 検証 expect(対象値).to マッチャー(期待値)
                # マッチャー: eq, be, be_empty, be_valid, be_invalid...
                expect(order.id).to eq(1)
                expect(order.customer).to eq("Taro")
                expect(order.amount).to eq(3000)
            end

            it "閾値以上は割引が適用される" do
                order = service.place_order(customer: "Hanako", amount: 8000)
                expect(order.amount).to eq(7200)
            end
        end

        context "異常系" do
            it "customerが空なら例外" do
                expect {
                    service.place_order(customer: " ", amount: 1000)
                }.to raise_error(ArgumentError, "customerは必須です")
            end

            it "amountが0以下なら例外" do
                expect {
                    service.place_order(customer: "Taro", amount: 0)
                }.to raise_error(ArgumentError, "amountは1以上の整数にしてください")
            end
        end

        context "境界値" do
            it "閾値ちょうどは割引対象になる" do
                order = service.place_order(customer: "Boundary", amount: 5000)
                expect(order.amount).to eq(4500)
            end
        end
    end

    describe "#list_orders" do
        it "注文一覧を返す" do
            service.place_order(customer: "A", amount: 1000)
            service.place_order(customer: "B", amount: 2000)

            list = service.list_orders
            expect(list.size).to eq(2)
            expect(list.map(&:customer)).to eq(%w[A B]) # %w() 文字列配列の短縮記法 区切り文字は不要、数字使用時は注意が必要
        end
    end
end