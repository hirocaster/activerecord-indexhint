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

    context "Give one hint" do
      it "`USE INDEX` in SQL Query" do
        expect(User.use_index("PRIMARY").to_sql).to be_include "FROM `users` USE INDEX (PRIMARY)"
      end
    end

    context "Give two hint" do
      it "`USE INDEX` in SQL Query" do
        expect(User.use_index("index_users_on_name", "PRIMARY").to_sql).to be_include "FROM `users` USE INDEX (index_users_on_name, PRIMARY)"
      end
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

    context "Give one hint" do
      it "`FORCE INDEX` in SQL Query" do
        expect(User.force_index("PRIMARY").to_sql).to be_include "FROM `users` FORCE INDEX (PRIMARY)"
      end
    end

    context "Give two hint" do
      it "`FORCE INDEX` in SQL Query" do
        expect(User.force_index("index_users_on_name", "PRIMARY").to_sql).to be_include "FROM `users` FORCE INDEX (index_users_on_name, PRIMARY)"
      end
    end
  end
end
