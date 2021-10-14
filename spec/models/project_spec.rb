require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "#validations" do
    let(:project) { build(:project) }

    it "has a valid factory" do

      expect(project).to be_valid
    end

    it "is not valid without a title" do
      project = build(:project, title: nil)
      byebug
      expect(project.title).to_not be_valid
      expect(project.errors[:title]).to  include("can't be blank")
    end

    it "is not valid without a creator" do
      project = build(:project, created_by: '')

      expect(project.created_by).to_not be_valid
      expect(project.errors[:created_by]).to  include("can't be blank")
    end
  end
end
