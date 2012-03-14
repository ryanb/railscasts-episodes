# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Pianos" do
    describe "Admin" do
      describe "pianos" do
        login_refinery_user

        describe "pianos list" do
          before(:each) do
            FactoryGirl.create(:piano, :name => "UniqueTitleOne")
            FactoryGirl.create(:piano, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.pianos_admin_pianos_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.pianos_admin_pianos_path

            click_link "Add New Piano"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Pianos::Piano.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Pianos::Piano.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:piano, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.pianos_admin_pianos_path

              click_link "Add New Piano"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Pianos::Piano.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:piano, :name => "A name") }

          it "should succeed" do
            visit refinery.pianos_admin_pianos_path

            within ".actions" do
              click_link "Edit this piano"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:piano, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.pianos_admin_pianos_path

            click_link "Remove this piano forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Pianos::Piano.count.should == 0
          end
        end

      end
    end
  end
end
