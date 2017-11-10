class ApplicationMsgq

  def self.request(payload)
    raise NotImplementedError.new
  end

  def self.requestSync(payload)
    raise NotImplementedError.new
  end

end
