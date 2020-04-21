class Enemy < ApplicationRecord
  enum kind: [ :globin, :orc, :demon, :dragon ]
  validates :level, numericality:{}
  validates_presence_of :name, :power_base, :power_step, :level, :kind

  def current_power
    power_base + ((level - 1 ) * power_step)
  end

  def title
    "#{kind} - #{name} ##{level} | #{current_power}"
  end
end
