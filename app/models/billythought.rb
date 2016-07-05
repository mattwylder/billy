class Billythought < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  
  @@white = 0xffffff
  
  @@darkest_pink = 0xff00bf
  @@pink_increment = 0x100

  def get_background_color
      diff = namastes - doodooblasts
      if diff == 0
          color = 0xfff
      elsif diff > 0
          color = namaste_color(diff)
      else
          color = doodooblast_color(diff)
      end
      color.to_s(16)
  end

  private

  def namaste_color(diff)
      color = @@white - diff * @@pink_increment
      color = color > @@darkest_pink ? color : @@darkest_pink
  end

  def doodooblast_color(diff)
      color = 0x4d3319
  end

end
