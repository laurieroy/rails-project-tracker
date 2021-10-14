require 'rails_helper'

RSpec.describe Milestone, type: :model do
  it "has an invalid title" do
    project = build(:milestone, title: '')

    expect(milestone.title).to_not be_valid
    expect(milestone.errors[:title]).to  include("can't be blank")
  endend
