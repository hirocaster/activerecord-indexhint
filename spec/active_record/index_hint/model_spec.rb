describe "ActiveRecord::IndexHint::Model" do
  describe ".create" do
    it "return Model object" do
      expect(User.create name: "foobar").to be_a User
    end
  end

  describe ".use_index" do
    it "has use_index method" do
      expect(User.respond_to? :use_index).to be true
    end
  end

  describe ".ignore_index" do
    it "has ignore_index method" do
      expect(User.respond_to? :ignore_index).to be true
    end
  end

  describe ".force_index" do
    it "has force_index method" do
      expect(User.respond_to? :force_index).to be true
    end
  end
end
