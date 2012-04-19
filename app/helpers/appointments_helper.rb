module AppointmentsHelper
  def convert_time_to_block(time_string)
    @t = Time.parse(time_string)
    @blocks = (@t.hour - 8) * 4 + (@t.min / 15 )
  end
  def convert_block_to_time(block)
    @hrs = (block / 4) + 8
    @mns = (block % 4) * 15
    return ("%02d" % @hrs.to_s) + ":" + ("%02d" % @mns.to_s)
  end
end
