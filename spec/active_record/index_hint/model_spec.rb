describe "ActiveRecord::IndexHint::Model" do

  describe ".create" do
    it "return Model object" do
      expect(User.create name: "foobar").to be_a User
    end
  end

end
