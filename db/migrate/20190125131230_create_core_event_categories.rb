class CreateCoreEventCategories < ActiveRecord::Migration[5.2]
    def change
        create_table :core_event_categories, id: :uuid, default: 'uuid_generate_v4()', force: true do |t|
            t.string :name
            t.text :description

            t.timestamps
        end
    end
end