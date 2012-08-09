class CreateCampaign < ActiveRecord::Migration
  def change
    create_table "campaigns" do |t|
      t.string    :title
      t.text      :description
      t.integer   :goal_in_cents
      t.datetime  :end_date
    end
  end
end
