describe "#basic_test" do
    it "to_eq" do
        expect(true).to eq(true)
    end

    it "not_to" do
        expect(false).not_to eq(true)
    end

    it "be" do
        # 大なり小なり検証
        # eqと似ているが同一インスタンスかを比較するため値が同じ別の変数同士で比較してもテストは失敗する
        expect(3).to be >= 1
    end

    it "be_empty" do
        expect([]).to be_empty
    end

    it "be_truthy_be_falsey" do
        # be true と違ってfalse または nilであれば偽、それ以外は真となるように評価
        expect(1).to be_truthy
        expect(nil).to be_falsey
    end

    it "change_from_to_by" do
        # before afterのような検証が可能
        arr = [1, 2, 3]
        # expect(arr.size).to eq 3
        # arr.pop
        # expect(arr.size).to eq 2
        # ↑の検証と同等の検証を以下のように置き換え可能
        # expect { X }.to change { Y }.from(A).to(B) Xを実行するとYがAからBに変化することを検証
        expect {
            arr.pop
        }.to change{arr.size}.from(3).to(2)

        # by 変化する値を検証
        arr = [1, 2, 3]
        expect { arr.pop }.to change{ arr.size }.by(-1)
    end

    it "include" do
        arr = [1, 2, 3]
        expect(arr).to include(1)
        expect(arr).to include(1, 3)
    end

    it "raise_error" do
        # error 検証
        expect { 1 / 0 }.to raise_error ZeroDivisionError
    end

    it "be_within_of" do
        # ゆらぎ検証 確立検証など必ず同一の値にならないためある程度のゆらぎを許容するようなテスト
        # expect(X).to be_within(A).of(B) XがB + 前後Aの範囲に収まっていればOKといった検証
        expect(10).to be_within(1).of(9)
    end
end