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
      get_rgb(diff)
  end

  private

  def get_rgb(diff)
      color = diff > 0 ? namaste_rgb(diff) : doodooblast_rgb(diff)
      "#" + color
  end

  def namaste_rgb(diff)
      color = @@white - diff * @@pink_increment
      color = color > @@darkest_pink ? color : @@darkest_pink
      color.to_s(16)
  end

  def doodooblast_rgb(diff)
      color = hsl_to_rgb(30.0,50.0,40.0)
  end

  def get_hsl(diff)
      color = diff > 0 ? namaste_hsl(diff) : doodooblast_hsl(diff)
      "hsl(" + color + ")"
  end

  def namaste_hsl(diff)
  end

  def doodooblast_hsl(diff)
      color = "27, 50, 65"
  end

  def hsl_to_rgb(h,s,l)
      if s == 0
          r = g = b = l
      else
          q = l < 0.5 ? l * (1 + s) : l + s - l * s
          p = 2 * l - q
          r = hue_to_rgb(p,q,h + 1/3)
          g = hue_to_rgb(p,q,h)
          b = hue_to_rgb(p,q, h - 1/3)
      end
      r *= 255
      g *= 255
      b *= 255
     return r.round.to_s + g.round.to_s + b.round.to_s
  end

  def hue_to_rgb(p,q,t)
      if t < 0 
          t += 1
      end
      if t > 1
          t -= 1
      end
      if t < 1/6 
          return p + (q - p) * 6  * t
      end
      if t < 1/2 
         return q
      end
      if t < 2/3
          return p + (q - p) * (2/3 -t) * 6
      end
      return p
  end
end
