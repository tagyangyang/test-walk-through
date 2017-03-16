# See http://doc.gitlab.com/ce/development/migration_style_guide.html
# for more information on how to write migrations for GitLab.

class AddIndexToNoteOriginalDiscussionId < ActiveRecord::Migration
  include Gitlab::Database::MigrationHelpers

  DOWNTIME = false

  disable_ddl_transaction!

  def up
    add_concurrent_index :notes, :original_discussion_id
  end

  def down
    remove_index :notes, :original_discussion_id if index_exists? :notes, :original_discussion_id
  end
end