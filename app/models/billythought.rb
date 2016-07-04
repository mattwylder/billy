class Billythought < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true

  def get_background_color
      diff = doodooblasts - namastes
        color = 0xffccff - diff * 0x1A00 
      color.to_s(16)
  end

end
